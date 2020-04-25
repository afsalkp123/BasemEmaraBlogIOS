//
//  SearchPostsViewController.swift
//  Basem Emara
//
//  Created by Basem Emara on 2018-10-07.
//  Copyright © 2018 Zamzam Inc. All rights reserved.
//

import UIKit
import SwiftyPress
import ZamzamCore
import ZamzamUI

final class SearchPostsViewController: UIViewController {
    private let store: Store<SearchPostsState>
    private let interactor: SearchPostsInteractorType?
    private let constants: ConstantsType
    private let theme: Theme
    private var token: NotificationCenter.Token?
    
    var render: SearchPostsRenderType?
    var searchText: String?
    
    // MARK: - Controls

    private lazy var tableView = UITableView().with {
        $0.register(SimplePostTableViewCell.self)
        $0.contentInset.bottom += 20
    }
    
    private lazy var tableViewAdapter = PostsDataViewAdapter(
        for: tableView,
        delegate: self
    )
    
    private lazy var searchController = UISearchController(searchResultsController: nil).with {
        $0.searchResultsUpdater = self
        $0.obscuresBackgroundDuringPresentation = false
        $0.searchBar.delegate = self
        $0.searchBar.placeholder = .localized(.searchPlaceholder)
        $0.searchBar.scopeButtonTitles = [
            .localized(.searchAllScope),
            .localized(.searchTitleScope),
            .localized(.searchContentScope),
            .localized(.searchKeywordsScope)
        ]
    }
    
    private lazy var emptyPlaceholderView = EmptyPlaceholderView(
        text: .localized(.emptySearchMessage)
    )
    
    // MARK: - Initializers
    
    init(
        store: Store<SearchPostsState>,
        interactor: SearchPostsInteractorType?,
        constants: ConstantsType,
        theme: Theme
    ) {
        self.store = store
        self.interactor = interactor
        self.constants = constants
        self.theme = theme
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        prepare()
        fetch()
    }
}

// MARK: - Setup

private extension SearchPostsViewController {
    
    func prepare() {
        // Configure controls
        navigationItem.title = .localized(.searchTitle)
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        definesPresentationContext = true
        
        // Compose layout
        view.addSubview(tableView)
        tableView.edges(to: view)
        
        // Bind state
        store(in: &token, observer: load)
    }
    
    func load(_ state: SearchPostsState) {
        tableViewAdapter.reloadData(with: state.posts)
    }
    
    func search(for text: String, with scope: Int) {
        interactor?.fetchSearchResults(
            with: PostAPI.SearchRequest(
                query: text,
                scope: {
                    switch scope {
                    case 1:
                        return .title
                    case 2:
                        return .content
                    case 3:
                        return .terms
                    default:
                        return .all
                    }
                }()
            )
        )
    }
}

extension SearchPostsViewController {
    
    func fetch() {
        guard let searchText = searchText else {
            interactor?.fetchPopularPosts(
                with: SearchPostsAPI.PopularRequest()
            )
            
            return
        }
        
        self.searchText = nil
        searchController.isActive = true
        searchController.searchBar.text = searchText
        search(for: searchText, with: 0)
    }
}

// MARK: - Delegates

extension SearchPostsViewController: UISearchResultsUpdating {
    private static var searchLimiter = Debouncer(limit: 0.5)
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text, !text.isEmpty else {
            fetch()
            return
        }
        
        // Skip irrelevant search until some characters
        guard text.count > 1 else { return }
        
        SearchPostsViewController.searchLimiter.execute { [weak self] in
            self?.search(
                for: text,
                with: searchController.searchBar.selectedScopeButtonIndex
            )
        }
    }
}

extension SearchPostsViewController: PostsDataViewDelegate {
    
    func postsDataViewNumberOfSections(in dataView: DataViewable) -> Int {
        let isEmpty = tableViewAdapter.viewModels?.isEmpty == true
        tableView.backgroundView = isEmpty ? emptyPlaceholderView : nil
        tableView.separatorStyle = isEmpty ? .none : .singleLine
        return 1
    }
    
    func postsDataView(didSelect model: PostsDataViewModel, at indexPath: IndexPath, from dataView: DataViewable) {
        render?.showPost(for: model)
    }
}

extension SearchPostsViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        guard let text = searchController.searchBar.text else { return }
        search(for: text, with: selectedScope)
    }
}

@available(iOS 13, *)
extension SearchPostsViewController {
    
    func postsDataView(contextMenuConfigurationFor model: PostsDataViewModel, at indexPath: IndexPath, point: CGPoint, from dataView: DataViewable) -> UIContextMenuConfiguration? {
        UIContextMenuConfiguration(for: model, at: indexPath, from: dataView, delegate: self, constants: constants, theme: theme)
    }
    
    func postsDataView(didPerformPreviewActionFor model: PostsDataViewModel, from dataView: DataViewable) {
        render?.showPost(for: model)
    }
}
//
//  SimplePostTableViewCell.swift
//  Basem Emara
//
//  Created by Basem Emara on 2018-10-07.
//  Copyright © 2018 Zamzam Inc. All rights reserved.
//

import UIKit
import SwiftyPress

final class SimplePostTableViewCell: UITableViewCell {
    
    private let titleLabel = ThemedHeadline().with {
        $0.font = .preferredFont(forTextStyle: .body)
        $0.adjustsFontForContentSizeCategory = true
        $0.numberOfLines = 2
    }
    
    private let detailLabel = ThemedCaption().with {
        $0.font = .preferredFont(forTextStyle: .footnote)
        $0.numberOfLines = 1
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        prepare()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setup

private extension SimplePostTableViewCell {
    
    func prepare() {
        accessoryType = .disclosureIndicator
        
        let stackView = UIStackView(arrangedSubviews: [
            titleLabel.with {
                $0.setContentHuggingPriority(.defaultHigh, for: .vertical)
            },
            detailLabel
        ]).with {
            $0.axis = .vertical
            $0.spacing = 6
        }
        
        let view = ThemedView().with {
            $0.addSubview(stackView)
        }
        
        addSubview(view)
        view.edges(to: self)
        
        stackView.edges(
            to: view,
            insets: UIEdgeInsets(top: 12, left: 20, bottom: 12, right: 36),
            safeArea: true
        )
    }
}

// MARK: - Delegates

extension SimplePostTableViewCell: PostsDataViewCell {
    
    func load(_ model: PostsDataViewModel) {
        titleLabel.text = model.title
        detailLabel.text = model.date
    }
}

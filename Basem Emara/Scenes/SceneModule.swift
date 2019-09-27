//
//  SceneModule.swift
//  Basem Emara
//
//  Created by Basem Emara on 2019-05-18.
//  Copyright © 2019 Zamzam Inc. All rights reserved.
//

import UIKit
import SwiftyPress

/// Dependency injector for overriding concrete scene factories.
protocol SceneModuleType {
    func startMain() -> UIViewController
    func showBlog() -> UIViewController
    func listPosts(params: ListPostsAPI.Params, delegate: ListPostsDelegate?) -> UIViewController
    func showPost(for id: Int) -> UIViewController
    func listTerms() -> UIViewController
}

extension SceneModuleType {
    
    func listPosts(params: ListPostsAPI.Params) -> UIViewController {
        return listPosts(params: params, delegate: nil)
    }
}

struct SceneModule: SceneModuleType {
    
    func startMain() -> UIViewController {
        switch UIDevice.current.userInterfaceIdiom {
        case .pad:
            return .make(fromStoryboard: Storyboard.mainSplit.rawValue)
        default:
            return .make(fromStoryboard: Storyboard.main.rawValue)
        }
    }
}

extension SceneModule {
    
    func showBlog() -> UIViewController {
        return .make(fromStoryboard: Storyboard.showBlog.rawValue)
    }
    
    func listPosts(params: ListPostsAPI.Params, delegate: ListPostsDelegate?) -> UIViewController {
        let controller: ListPostsViewController = .make(fromStoryboard: Storyboard.listPosts.rawValue)
        controller.params = params
        controller.delegate = delegate
        return controller
    }
    
    func showPost(for id: Int) -> UIViewController {
        let controller: ShowPostViewController = .make(fromStoryboard: Storyboard.showPost.rawValue)
        controller.postID = id
        return controller
    }
    
    func listTerms() -> UIViewController {
        return .make(fromStoryboard: Storyboard.listTerms.rawValue)
    }
}

extension SceneModule {
    
    /// Tab identifiers for routing
    enum Tab: Int {
        case home = 0
        case blog = 1
        case favorites = 2
        case search = 3
        case more = 4
    }
    
    /// Storyboard identifiers for routing
    enum Storyboard: String {
        case main = "Main"
        case mainSplit = "MainSplit"
        case showBlog = "ShowBlog"
        case listPosts = "ListPosts"
        case showPost = "ShowPost"
        case listTerms = "ListTerms"
    }
}

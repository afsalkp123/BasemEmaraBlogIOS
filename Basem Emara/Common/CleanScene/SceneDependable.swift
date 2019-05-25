//
//  SceneDependable.swift
//  Basem Emara
//
//  Created by Basem Emara on 2019-05-18.
//  Copyright © 2019 Zamzam Inc. All rights reserved.
//

import UIKit
import SwiftyPress

/// Dependency injector for overriding concrete scene factories.
/// Inject delegates, parameters, interactors, presenters, routers,
/// and so forth to override behavior in the next scene.
protocol SceneDependable {
    func startMain() -> UIViewController
    func showDashboard() -> UIViewController
    func listPosts(params: ListPostsModels.Params, delegate: ShowPostViewControllerDelegate?) -> UIViewController
    func showPost(for id: Int) -> UIViewController
    func previewPost(for model: PostsDataViewModel, delegate: UIViewController?) -> UIViewController
    func listTerms() -> UIViewController
    func showSettings() -> UIViewController
}

extension SceneDependable {
    
    func listPosts(params: ListPostsModels.Params) -> UIViewController {
        return listPosts(params: params, delegate: nil)
    }
}

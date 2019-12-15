//
//  SearchPostsRouter.swift
//  Basem Emara
//
//  Created by Basem Emara on 2018-10-07.
//  Copyright © 2018 Zamzam Inc. All rights reserved.
//

import UIKit
import SwiftyPress

struct SearchPostsRouter: SearchPostsRouterable {
    private let render: SceneRenderType
    weak var viewController: UIViewController?
    
    init(render: SceneRenderType, viewController: UIViewController?) {
        self.render = render
        self.viewController = viewController
    }
}

extension SearchPostsRouter {

    func showPost(for model: PostsDataViewModel) {
        let controller = render.showPost(for: model.id)
        viewController?.show(controller)
    }
}

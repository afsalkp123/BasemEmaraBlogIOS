//
//  SearchPostsCore.swift
//  Basem Emara
//
//  Created by Basem Emara on 2019-09-21.
//  Copyright © 2019 Zamzam Inc. All rights reserved.
//

import UIKit
import SwiftyPress
import ZamzamCore

struct SearchPostsCore: SearchPostsCoreType {
    private let root: SwiftyPressCore
    private let render: SceneRenderType
    
    init(root: SwiftyPressCore, render: SceneRenderType) {
        self.root = root
        self.render = render
    }
    
    func action(with viewController: SearchPostsDisplayable?) -> SearchPostsActionable {
        SearchPostsAction(
            presenter: presenter(with: viewController),
            postRepository: root.postRepository(),
            mediaRepository: root.mediaRepository()
        )
    }
    
    func presenter(with viewController: SearchPostsDisplayable?) -> SearchPostsPresentable {
        SearchPostsPresenter(viewController: viewController)
    }
    
    func router(with viewController: UIViewController?) -> SearchPostsRouterable {
        SearchPostsRouter(
            render: render,
            viewController: viewController
        )
    }
    
    func constants() -> ConstantsType {
        root.constants()
    }
    
    func theme() -> Theme {
        root.theme()
    }
}

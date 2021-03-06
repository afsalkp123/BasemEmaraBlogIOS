//
//  DeepLinkCore.swift
//  Basem Emara
//
//  Created by Basem Emara on 2019-09-28.
//  Copyright © 2019 Zamzam Inc. All rights reserved.
//

import Foundation
import SwiftyPress
import UIKit
import ZamzamCore

struct DeepLinkCore: DeepLinkCoreType {
    private let core: SwiftyPressCore
    private let render: SceneRender
    
    init(core: SwiftyPressCore, render: SceneRender) {
        self.core = core
        self.render = render
    }
    
    func router() -> DeepLinkRouterable {
        DeepLinkRouter(
            render: render,
            postRepository: core.postRepository(),
            taxonomyRepository: core.taxonomyRepository(),
            theme: core.theme()
        )
    }
    
    func log() -> LogRepository {
        core.log()
    }
}

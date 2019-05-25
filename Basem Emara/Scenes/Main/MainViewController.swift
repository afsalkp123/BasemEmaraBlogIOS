//
//  MainViewController.swift
//  Basem Emara
//
//  Created by Basem Emara on 2018-10-21.
//  Copyright © 2018 Zamzam Inc. All rights reserved.
//

import UIKit
import SwiftyPress

class MainViewController: UISplitViewController, HasDependencies {
    
    // MARK: - Scene variables
    
    // TODO: Fix routing for deep linking etc
    private(set) lazy var router: MainRoutable = MainRouter(
        viewController: self,
        constants: dependencies.resolve()
    )
    
    // MARK: - Internal variable
    
    private lazy var theme: Theme = dependencies.resolve()
    
    // MARK: - Controller cycle
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return theme.statusBarStyle
    }
}

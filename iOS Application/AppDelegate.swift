//
//  AppDelegate.swift
//  Basem Emara
//
//  Created by Basem Emara on 2018-05-20.
//  Copyright © 2018 Zamzam Inc. All rights reserved.
//

import UIKit
import SwiftyPress
import ZamzamCore

@UIApplicationMain
class AppDelegate: ApplicationPluggableDelegate {

    override func plugins() -> [ApplicationPlugin] {[
        LoggerPlugin(log: core.log()),
        DataPlugin(dataRepository: core.dataRepository()),
        BackgroundPlugin(
            dataRepository: core.dataRepository(),
            preferences: core.preferences(),
            log: core.log()
        ),
        WindowPlugin(
            delegate: self,
            render: WindowRender(render: render),
            preferences: core.preferences()
        ),
        ThemePlugin(theme: core.theme()),
        NotificationPlugin(
            router: NotificationRouter(render: render),
            userNotification: .current()
        ),
        ShortcutPlugin(
            router: ShortcutRouter(
                render: render,
                constants: core.constants()
            )
        ),
        DeepLinkPlugin(
            core: DeepLinkCore(
                core: core,
                render: render
            ),
            log: core.log()
        )
    ]}
}

extension AppDelegate {
    
    func application(_ application: UIApplication, performFetchWithCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        pluginInstances.compactMap { $0 as? BackgroundPlugin }.first?
            .application(application, performFetchWithCompletionHandler: completionHandler)
    }
    
    func application(_ application: UIApplication, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: @escaping (Bool) -> Void) {
        pluginInstances.compactMap { $0 as? ShortcutPlugin }.first?
            .scene(performActionFor: shortcutItem, completionHandler: completionHandler)
    }
}

// MARK: - Environment Components

private enum AppStart {
    
    /// Root dependency injection container.
    static let core = AppCore()
    
    /// Root state.
    static let state = AppState()
    
    /// Root builder for all scenes.
    ///
    ///     NavigationView(
    ///         render.listArticles()
    ///     )
    ///
    /// Create views only through scene renders.
    static let render = SceneRender(
        core: core,
        state: state
    )
}

private extension UIApplicationDelegate {
    var core: AppCore { AppStart.core }
    var render: SceneRender { AppStart.render }
}

@available(iOS 13, *)
extension UISceneDelegate {
    var core: AppCore { AppStart.core }
    var render: SceneRender { AppStart.render }
}

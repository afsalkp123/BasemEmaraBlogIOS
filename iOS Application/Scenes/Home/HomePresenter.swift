//
//  HomeRender.swift
//  Basem Emara
//
//  Created by Basem Emara on 2019-05-24.
//  Copyright © 2019 Zamzam Inc. All rights reserved.
//

import SwiftyPress
import UIKit
import ZamzamUI

class HomePresenter: HomePresenterType {
    private let render: SceneRenderType
    private let mailComposer: MailComposerType
    private let constants: ConstantsType
    private let theme: Theme
    
    weak var presentationContext: UIViewController?
    
    init(
        render: SceneRenderType,
        mailComposer: MailComposerType,
        constants: ConstantsType,
        theme: Theme
    ) {
        self.render = render
        self.mailComposer = mailComposer
        self.constants = constants
        self.theme = theme
    }
}

extension HomePresenter {
    
    func select(menu: HomeAPI.MenuItem) {
        switch menu.type {
        case .about:
            presentationContext?.modal(
                pageSlug: "about",
                constants: constants,
                theme: theme
            )
        case .portfolio:
            presentationContext?.modal(
                pageSlug: "portfolio",
                constants: constants,
                theme: theme
            )
        case .seriesScalableApp:
            showSeriesScalableApp(title: menu.title)
        case .seriesSwiftUtilities:
            showSeriesSwiftUtilities(title: menu.title)
        case .coursesArchitecture:
            presentationContext?.modal(
                safari: "https://iosmentor.io",
                theme: theme
            )
        case .coursesFramework:
            presentationContext?.modal(
                safari: "https://iosmentor.io/webinars/swift-frameworks/",
                theme: theme
            )
        case .consultingDevelopment:
            presentationContext?.modal(
                safari: "https://zamzam.io",
                theme: theme
            )
        case .consultingMentorship:
            presentationContext?.modal(
                safari: "https://iosmentor.io/express/",
                theme: theme
            )
        }
    }
    
    func select(social: Social) {
        switch social {
        case .email:
            sendEmail()
        default:
            presentationContext?.show(
                social: social,
                theme: theme
            )
        }
    }
}

// MARK: - Helpers

private extension HomePresenter {
    
    var listPostsDelegate: ListPostsDelegate? {
        presentationContext?.splitViewController as? ListPostsDelegate
            ?? presentationContext as? ListPostsDelegate
    }
    
    func showSeriesScalableApp(title: String?) {
        let controller = render.listPosts(
            params: ListPostsAPI.Params(
                fetchType: .terms([80]),
                title: title,
                sort: seriesSort
            ),
            delegate: listPostsDelegate
        ).with {
            $0.hidesBottomBarWhenPushed = true
        }
        
        presentationContext?.show(controller)
    }
    
    func showSeriesSwiftUtilities(title: String?) {
        let controller = render.listPosts(
            params: ListPostsAPI.Params(
                fetchType: .terms([71]),
                title: title,
                sort: seriesSort
            ),
            delegate: listPostsDelegate
        ).with {
            $0.hidesBottomBarWhenPushed = true
        }
        
        presentationContext?.show(controller)
    }
    
    func seriesSort(_ post1: PostType, _ post2: PostType) -> Bool {
        guard let lhs = Int(post1.meta["_series_part"] ?? ""),
            let rhs = Int(post2.meta["_series_part"] ?? "") else {
                return false
        }

        return lhs < rhs
    }
}

private extension HomePresenter {
    
    func sendEmail() {
        let mailComposerController = mailComposer.makeViewController(
            email: constants.email,
            subject: .localizedFormat(
                .emailFeedbackSubject,
                constants.appDisplayName ?? ""
            ),
            body: nil,
            isHTML: true,
            attachment: nil
        )
        
        guard let controller = mailComposerController else {
            UIWindow.current?.visibleViewController?.present(
                alert: .localized(.couldNotSendEmail),
                message: .localized(.couldNotSendEmailMessage)
            )
            
            return
        }
        
        UIWindow.current?.visibleViewController?.present(controller)
    }
}
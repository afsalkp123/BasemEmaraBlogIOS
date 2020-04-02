//
//  HomeRender.swift
//  Basem Emara
//
//  Created by Basem Emara on 2019-05-24.
//  Copyright © 2019 Zamzam Inc. All rights reserved.
//

import SwiftyPress
import UIKit.UISplitViewController
import UIKit.UIViewController
import UIKit.UIWindow
import ZamzamUI

class HomeRender: HomeRenderType {
    private let render: SceneRenderType
    private let mailComposer: MailComposerType
    private let constants: ConstantsType
    private let theme: Theme
    
    weak var presentationContextProvider: UIViewController?
    
    private var listPostsDelegate: ListPostsDelegate? {
        presentationContextProvider?.splitViewController as? ListPostsDelegate
            ?? presentationContextProvider as? ListPostsDelegate
    }
    
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

extension HomeRender {
    
    func showAbout() {
        presentationContextProvider?.modal(
            pageSlug: "about",
            constants: constants,
            theme: theme
        )
    }
    
    func showPortfolio() {
        presentationContextProvider?.modal(
            pageSlug: "portfolio",
            constants: constants,
            theme: theme
        )
    }
}

extension HomeRender {
    
    func showSeriesScalableApp(title: String?) {
        let controller = render.listPosts(
            params: ListPostsAPI.Params(
                fetchType: .terms([80]),
                title: title,
                sort: seriesSort
            ),
            delegate: listPostsDelegate
        )
        
        presentationContextProvider?.show(controller)
    }
    
    func showSeriesSwiftUtilities(title: String?) {
        let controller = render.listPosts(
            params: ListPostsAPI.Params(
                fetchType: .terms([71]),
                title: title,
                sort: seriesSort
            ),
            delegate: listPostsDelegate
        )
        
        presentationContextProvider?.show(controller)
    }
    
    private func seriesSort(_ post1: PostType, _ post2: PostType) -> Bool {
        guard let lhs = Int(post1.meta["_series_part"] ?? ""),
            let rhs = Int(post2.meta["_series_part"] ?? "") else {
                return false
        }

        return lhs < rhs
    }
}

extension HomeRender {
    
    func showCoursesArchitecture() {
        presentationContextProvider?.modal(
            safari: "https://iosmentor.io",
            theme: theme
        )
    }
    
    func showCoursesFramework() {
        presentationContextProvider?.modal(
            safari: "https://iosmentor.io/webinars/swift-frameworks/",
            theme: theme
        )
    }
    
    func showConsultingDevelopment() {
        presentationContextProvider?.modal(
            safari: "https://zamzam.io",
            theme: theme
        )
    }
    
    func showConsultingMentorship() {
        presentationContextProvider?.modal(
            safari: "https://iosmentor.io/express/",
            theme: theme
        )
    }
}

extension HomeRender {
    
    func show(social: Social) {
        switch social {
        case .email:
            sendEmail()
        default:
            presentationContextProvider?.show(
                social: social,
                theme: theme
            )
        }
    }
    
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

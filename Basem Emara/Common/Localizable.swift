//
//  Localizable.swift
//  Basem Emara
//
//  Created by Basem Emara on 2018-09-07.
//  Copyright © 2018 Zamzam Inc. All rights reserved.
//

import ZamzamKit

// Errors
extension Localizable {
    static let latestPostsErrorTitle = Localizable(NSLocalizedString("latest.posts.error.title", comment: "Latest posts alert error title"))
    static let popularPostsErrorTitle = Localizable(NSLocalizedString("popular.posts.error.title", comment: "Popular posts alert error title"))
    static let topPickPostsErrorTitle = Localizable(NSLocalizedString("top.pick.posts.error.title", comment: "Top pick posts alert error title"))
    static let postsByTermsErrorTitle = Localizable(NSLocalizedString("posts.by.terms.error.title", comment: "Posts by terms alert error title"))
    static let termsErrorTitle = Localizable(NSLocalizedString("terms.error.title", comment: "Terms alert error title"))
    static let blogPostErrorTitle = Localizable(NSLocalizedString("blog.post.error.title", comment: "Blog post alert error title"))
    static let browserNotAvailableErrorTitle = Localizable(NSLocalizedString("browser.not.available.error.title", comment: "Browser unavailable alert error title"))
    static let commentsNotAvailableErrorTitle = Localizable(NSLocalizedString("comments.not.available.error.title", comment: "Comments unavailable alert error title"))
    static let notConnectedToInternetErrorMessage = Localizable(NSLocalizedString("not.connected.to.internet.error.message", comment: "Internet unavailable alert error message"))
    static let noPostInHistoryErrorMessage = Localizable(NSLocalizedString("no.post.in.history.error.message", comment: "No post in history alert error message"))
    static let couldNotSendEmail = Localizable(NSLocalizedString("could.not.send.email", comment: "The title of the dialog alerting the user an email could not be composed"))
    static let couldNotSendEmailMessage = Localizable(NSLocalizedString("could.not.send.email.message", comment: "The message of the dialog alerting the user an email could not be composed"))
    static let disclaimerNotAvailableErrorTitle = Localizable(NSLocalizedString("disclaimer.not.available.error.title", comment: "The title of the dialog alerting the user no disclaimer info is available"))
    static let disclaimerNotAvailableErrorMessage = Localizable(NSLocalizedString("disclaimer.not.available.error.message", comment: "The message of the dialog alerting the user no disclaimer info is available"))
}

// Misc
extension Localizable {
    static let unfavorTitle = Localizable(NSLocalizedString("unfavor.title", comment: "Unfavor title for buttons and dialogs"))
    static let unfavoriteTitle = Localizable(NSLocalizedString("unfavorite.title", comment: "Unfavorite title for buttons and dialogs"))
    static let favoriteTitle = Localizable(NSLocalizedString("favorite.title", comment: "Favorite title for buttons and dialogs"))
    static let moreTitle = Localizable(NSLocalizedString("more.title", comment: "More title for buttons and dialogs"))
    static let commentsTitle = Localizable(NSLocalizedString("comments.title", comment: "Comments title for buttons and dialogs"))
    static let shareTitle = Localizable(NSLocalizedString("share.title", comment: "Share title for buttons and dialogs"))
    static let emailFeedbackSubject = Localizable(NSLocalizedString("email.feedback.subject", comment: "Email subject for sending feedback"))
    static let shareAppMessage = Localizable(NSLocalizedString("share.app.message", comment: "Message for sharing the app"))
}

// Posts
extension Localizable {
    static let latestPostsTitle = Localizable(NSLocalizedString("latest.posts.title", comment: "Latest posts title"))
    static let popularPostsTitle = Localizable(NSLocalizedString("popular.posts.title", comment: "Popular posts title"))
    static let topPicksTitle = Localizable(NSLocalizedString("top.picks.title", comment: "Top pick posts title"))
    static let postsByTermsTitle = Localizable(NSLocalizedString("posts.by.terms.title", comment: "Posts by terms title"))
}

// Search
extension Localizable {
    static let searchPlaceholder = Localizable(NSLocalizedString("search.placeholder", comment: "Search placeholder for text field"))
    static let searchAllScope = Localizable(NSLocalizedString("search.all.scope", comment: "All label for search scope"))
    static let searchTitleScope = Localizable(NSLocalizedString("search.title.scope", comment: "Title label for search scope"))
    static let searchContentScope = Localizable(NSLocalizedString("search.content.scope", comment: "Content label for search scope"))
    static let searchKeywordsScope = Localizable(NSLocalizedString("search.keywords.scope", comment: "Keywords label for search scope"))
    static let searchErrorTitle = Localizable(NSLocalizedString("search.error.title", comment: "Search alert error title"))
}

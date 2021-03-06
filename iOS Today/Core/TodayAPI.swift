//
//  TodayInterfaces.swift
//  Today Extension
//
//  Created by Basem Emara on 2018-10-21.
//  Copyright © 2018 Zamzam Inc. All rights reserved.
//

import SwiftyPress
import UIKit.UIViewController
import ZamzamUI

// Scene namespace
enum TodayAPI {}

protocol TodayCoreType {
    func action(with viewController: (TodayDisplayable & UIViewController)?) -> TodayActionable
    func presenter(with viewController: (TodayDisplayable & UIViewController)?) -> TodayPresentable
    func dataRepository() -> DataRepository
    func theme() -> Theme
}

protocol TodayActionable {
    func fetchLatestPosts(with request: TodayAPI.Request)
}

protocol TodayPresentable {
    func presentLatestPosts(for response: TodayAPI.Response)
    func presentLatestPosts(error: SwiftyPressError)
}

protocol TodayDisplayable: AnyObject {
    func displayLatestPosts(with viewModels: [PostsDataViewModel])
}

extension TodayAPI {
    
    struct Request {
        let maxLength: Int
    }
    
    struct Response {
        let posts: [PostType]
        let media: [MediaType]
    }
}

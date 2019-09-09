//
//  SearchPostsInterfaces.swift
//  Basem Emara
//
//  Created by Basem Emara on 2018-10-07.
//  Copyright © 2018 Zamzam Inc. All rights reserved.
//

import SwiftyPress
import UIKit
import ZamzamUI

protocol SearchPostsBusinessLogic: AppBusinessLogic {
    func fetchSearchResults(with request: PostsModels.SearchRequest)
    func fetchPopularPosts(with request: SearchPostsModels.PopularRequest)
}

protocol SearchPostsPresentable: AppPresentable {
    func presentSearchResults(for response: SearchPostsModels.Response)
    func presentSearchResults(error: DataError)
}

protocol SearchPostsDisplayable: class, AppDisplayable {
    func displayPosts(with viewModels: [PostsDataViewModel])
}

protocol SearchPostsRoutable: AppRoutable {
    func showPost(for model: PostsDataViewModel)
    func previewPost(for model: PostsDataViewModel) -> UIViewController?
}

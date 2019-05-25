//
//  ListPostsModels.swift
//  Basem Emara
//
//  Created by Basem Emara on 2018-10-02.
//  Copyright © 2018 Zamzam Inc. All rights reserved.
//

import SwiftyPress

enum ListPostsModels {
    
    enum FetchType {
        case latest
        case popular
        case picks
        case terms(Set<Int>)
    }
    
    struct Params {
        let fetchType: FetchType
        let title: String?
        
        init(fetchType: FetchType, title: String? = nil) {
            self.fetchType = fetchType
            self.title = title
        }
    }
}

extension ListPostsModels {
    
    struct FetchPostsRequest {
        
    }
    
    struct FetchPostsByTermsRequest {
        let ids: Set<Int>
    }
    
    struct PostsResponse {
        let posts: [PostType]
        let media: [MediaType]
    }
}

extension ListPostsModels {
    
    struct FavoriteRequest {
        let postID: Int
    }
    
    struct FavoriteResponse {
        let postID: Int
        let favorite: Bool
    }
    
    struct FavoriteViewModel {
        let postID: Int
        let favorite: Bool
    }
}

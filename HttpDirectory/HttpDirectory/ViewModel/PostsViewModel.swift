//
//  PostsViewModel.swift
//  HttpDirectory
//
//  Created by 전율 on 2024/02/28.
//

import Foundation
import RxSwift

class PostsViewModel {
    let networkService = NetworkService()
    
    var posts: Observable<[PostModel]> {
        networkService.fetchPosts()
    }
}

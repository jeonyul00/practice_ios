//
//  PostModel.swift
//  HttpDirectory
//
//  Created by 전율 on 2024/02/27.
//

import Foundation

struct Posts:Codable {
    var results: [PostModel]
}


struct PostModel:Codable {
    var userId: Int
    var id: Int
    var title: String
    var body: String
}



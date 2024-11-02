//
//  Books.swift
//  Books
//
//  Created by 전율 on 11/2/24.
//

import Foundation

struct Books:Codable {
    let totalCount: Int
    let list: [BooksSummary]
    let code: Int
    let message: String?
}

struct BooksSummary:Codable {
    let id: Int
    let title: String
}

//
//  BookDetail.swift
//  Books
//
//  Created by 전율 on 11/2/24.
//

import Foundation

struct BookDetail:Codable {
    struct Book: Codable {
        let id: Int
        let title: String
        let summary: String
        let storeLink: URL
        let publicationDate: Date
    }
    
    let data: Book
    let code: Int
    let message: String?
}

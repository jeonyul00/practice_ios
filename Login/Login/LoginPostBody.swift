//
//  LoginPostBody.swift
//  Login
//
//  Created by 전율 on 11/4/24.
//

import Foundation

struct LoginPostBody:Codable {
    let id: String
    let password: String
}


struct LoginResponse:Codable {
    let code: Int
    let message: String
}

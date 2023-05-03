//
//  SignInRequest.swift
//  StudentPlusClient
//
//  Created by Komol Ibragimov on 01/05/2023.
//

import Foundation

struct SignInRequest: Codable {
    let userType: Int?
    let userNumber: String?
    let userPassword: String?
}

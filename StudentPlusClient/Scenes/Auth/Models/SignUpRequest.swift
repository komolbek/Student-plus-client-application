//
//  SignUpRequest.swift
//  StudentPlusClient
//
//  Created by Komol Ibragimov on 01/05/2023.
//

import Foundation

struct SignUpRequest: Codable {
    let studentNumber: String?
    let firstName: String?
    let lastName: String?
    let course: String?
    let graduationDate: String?
    let password: String?
}

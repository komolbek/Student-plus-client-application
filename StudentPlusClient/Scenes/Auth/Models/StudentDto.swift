//
//  StudentDto.swift
//  StudentPlusClient
//
//  Created by Komol Ibragimov on 01/05/2023.
//

import Foundation

struct StudentDto: Codable, Equatable {
    let studentId: String?
    let studentNumber: String?
    let firstName: String?
    let lastName: String?
    let course: String?
    let graduationDate: String?
    let password: String?
}

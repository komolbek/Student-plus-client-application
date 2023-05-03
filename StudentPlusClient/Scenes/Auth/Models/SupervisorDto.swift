//
//  SupervisorDto.swift
//  StudentPlusClient
//
//  Created by Komol Ibragimov on 02/05/2023.
//

import Foundation

struct SupervisorDto: Codable, Equatable {
    let supervisorId: String?
    let supervisorNumber: String?
    let firstName: String?
    let lastName: String?
    let department: String?
    let title: String?
    let password: String?
}

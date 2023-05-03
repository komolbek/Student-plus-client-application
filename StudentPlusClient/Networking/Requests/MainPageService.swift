//
//  MainPageService.swift
//  StudentPlusClient
//
//  Created by Komol Ibragimov on 03/05/2023.
//

import Foundation

enum MainPageService {
    
    static let networkManager = NetworkManager.shared
    
    static func addStudents(_ studentNumbers: [String], to supervisorId: String, completion: @escaping (Result<SuperviseeDto, Error>) -> Void) {
        let route = MainPageRoute.addStudents(students: studentNumbers, supervisorId: supervisorId)
        networkManager.request(route: route, completion: completion)
    }
}

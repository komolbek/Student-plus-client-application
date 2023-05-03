//
//  MainPageRoute.swift
//  StudentPlusClient
//
//  Created by Komol Ibragimov on 03/05/2023.
//

import Foundation

enum MainPageRoute: Route {
    case addStudents(students: [String], supervisorId: String)
    
    var path: String {
        switch self {
        case .addStudents:
            return "Supervisee/students"
        }
    }
    
    var method: RouteMethod {
        switch self {
        case .addStudents:
            return .post
        }
    }
    
    var headers: [String: String] {
        return [
            "Content-Type": "application/json"
        ]
    }
    
    var body: [String: String] {
        switch self {
        case .addStudents(let students,_):
            return [
                "studentNumbers": students.joined(separator: ",")
            ]
        }
    }
    
    var parameters: [String: Any] {
        switch self {
        case .addStudents(_, let supervisorId):
            return [
                "supervisorId": supervisorId,
            ]
        }
    }
}

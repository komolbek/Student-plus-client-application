//
//  AuthRoute.swift
//  StudentPlusClient
//
//  Created by Komol Ibragimov on 01/05/2023.
//

import Foundation

enum AuthRoute: Route {
    case signIn(requestData: SignInRequest)
    case signUp(requestData: SignUpRequest)
    case supervisorSignUp(requestData: SupervisorSignUpRequest)
    case supervisorSignIn(requestData: SignInRequest)
    
    var path: String {
        switch self {
        case .signIn:
            return "/Student/Login"
        case .signUp:
            return "/Student"
        case .supervisorSignUp:
            return "/Supervisor"
        case .supervisorSignIn:
            return "/Supervisor/Login"
        }
    }
    
    var method: RouteMethod {
        switch self {
        case .signIn:
            return .get
        case .signUp:
            return .post
        case .supervisorSignUp:
            return .post
        case .supervisorSignIn:
            return .get
        }
    }
    
    var headers: [String: String] {
        return [
            "Content-Type": "application/json"
        ]
    }
    
    var body: [String: String] {
        switch self {
        case .signUp(let signUp):
            return [
                "studentId": UUID().uuidString,
                "studentNumber": signUp.studentNumber ?? "",
                "firstName": signUp.firstName ?? "",
                "lastName": signUp.lastName ?? "",
                "course": signUp.course ?? "",
                "graduationDate": signUp.graduationDate ?? "",
                "password": signUp.password ?? ""
            ]
        case .supervisorSignUp(let signUp):
            return [
                "supervisorId": UUID().uuidString,
                "supervisorNumber": signUp.supervisorNumber ?? "",
                "firstName": signUp.firstName ?? "",
                "lastName": signUp.lastName ?? "",
                "department": signUp.department ?? "",
                "title": signUp.title ?? "",
                "password": signUp.password ?? ""
            ]
        default:
            return [:]
        }
    }
    
    var parameters: [String: Any] {
        switch self {
        case .signIn(let signIn):
            return [
                "userType": signIn.userType ?? 0,
                "userNumber": signIn.userNumber ?? "",
                "userPassword": signIn.userPassword ?? ""
            ]
        case .supervisorSignIn(let signIn):
            return [
                "userType": signIn.userType ?? 0,
                "userNumber": signIn.userNumber ?? "",
                "userPassword": signIn.userPassword ?? ""
            ]
        default:
            return [:]
        }
    }
}

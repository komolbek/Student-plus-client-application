//
//  AuthRequestsService.swift
//  StudentPlusClient
//
//  Created by Komol Ibragimov on 01/05/2023.
//

import Foundation

enum AuthRequestsService {
    
    static let networkManager = NetworkManager.shared
    
    static func signInStudent(using requestData: SignInRequest, completion: @escaping (Result<StudentDto, Error>) -> Void) {
        let route = AuthRoute.signIn(requestData: requestData)
        networkManager.request(route: route, completion: completion)
    }
    
    static func signInSupervisor(using requestData: SignInRequest, completion: @escaping (Result<SupervisorDto, Error>) -> Void) {
        let route = AuthRoute.supervisorSignIn(requestData: requestData)
        networkManager.request(route: route, completion: completion)
    }
    
    static func signUpStudent(using requestData: SignUpRequest, completion: @escaping (Result<StudentDto, Error>) -> Void) {
        let route = AuthRoute.signUp(requestData: requestData)
        networkManager.request(route: route, completion: completion)
    }
    
    static func signUpSupervisor(using requestData: SupervisorSignUpRequest, completion: @escaping (Result<SupervisorDto, Error>) -> Void) {
        let route = AuthRoute.supervisorSignUp(requestData: requestData)
        networkManager.request(route: route, completion: completion)
    }
}

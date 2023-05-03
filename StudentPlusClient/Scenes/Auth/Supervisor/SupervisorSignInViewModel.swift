//
//  SupervisorSignInViewModel.swift
//  StudentPlusClient
//
//  Created by Komol Ibragimov on 03/05/2023.
//

import Foundation

final class SupervisorSignInViewModel: ObservableObject {
    
    @Published var supervisorNumber = ""
    @Published var password = ""
    @Published var showError = false
    @Published var errorMessage = ""
    @Published var singedIn: Bool = false
    
    var isValid: Bool {
        return !supervisorNumber.isEmpty
        && !password.isEmpty
    }
    
    func signIn() {
        guard let userType = AppData.userType?.rawValue else { return }
        
        let requestData = SignInRequest(userType: userType,
                                        userNumber: supervisorNumber,
                                        userPassword: password)
        
        AuthRequestsService.signInSupervisor(using: requestData) { result in
            switch result {
            case .success(let supervisorDto):
                AppData.isSignedIn = true
                AppData.userType = .supervisor
                AppData.signedInSupervisor = supervisorDto
                self.singedIn = true
                
            case .failure(let error):
                self.showError = true
                self.errorMessage = error.localizedDescription
            }
        }
    }
    
    func forgotPassword() {
        
    }
}


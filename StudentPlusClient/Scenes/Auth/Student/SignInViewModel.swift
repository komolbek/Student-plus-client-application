//
//  SignInViewModel.swift
//  StudentPlusClient
//
//  Created by Komol Ibragimov on 01/05/2023.
//

import Foundation

final class SignInViewModel: ObservableObject {
    
    @Published var studentNumber = ""
    @Published var password = ""
    @Published var showError = false
    @Published var errorMessage = ""
    @Published var singedIn: Bool = false
    
    func signIn() {
        guard let userType = AppData.userType?.rawValue else { return }
        
        let requestData = SignInRequest(userType: userType,
                                        userNumber: studentNumber,
                                        userPassword: password)
        
        AuthRequestsService.signInStudent(using: requestData) { result in
            switch result {
            case .success(let studentDto):
                AppData.isSignedIn = true
                AppData.userType = .student
                AppData.signedInStudent = studentDto
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


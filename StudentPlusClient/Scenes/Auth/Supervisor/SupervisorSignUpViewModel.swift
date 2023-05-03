//
//  SupervisorSignUpViewModel.swift
//  StudentPlusClient
//
//  Created by Komol Ibragimov on 02/05/2023.
//

import Foundation

final class SupervisorSignUpViewModel: ObservableObject {
    @Published var supervisorNumber: String = ""
    @Published var firstName: String = ""
    @Published var lastName: String = ""
    @Published var department: String = ""
    @Published var title: String = ""
    @Published var password: String = ""
    
    @Published var showError: Bool = false
    @Published var errorMessage: String = ""
    
    @Published var supervisor: SupervisorDto?
    
    var isValid: Bool {
        !supervisorNumber.isEmpty &&
        !firstName.isEmpty &&
        !lastName.isEmpty &&
        !department.isEmpty &&
        !title.isEmpty &&
        !password.isEmpty
    }
    
    init() {
        AppData.userType = .supervisor
    }
    
    func signUpSupervisor() {
        let supervisorSignUpData = SupervisorSignUpRequest(supervisorNumber: supervisorNumber,
                                                           firstName: firstName,
                                                           lastName: lastName,
                                                           department: department,
                                                           title: title,
                                                           password: password)
        
        AuthRequestsService.signUpSupervisor(using: supervisorSignUpData) { result in
            switch result {
            case .success(let supervisor):
                self.supervisor = supervisor
                AppData.isSignedIn = true
                AppData.signedInSupervisor = supervisor
                
            case .failure(let error):
                self.showError = true
                self.errorMessage = error.localizedDescription
            }
        }
    }
    
    func signIn() {
        
    }
}

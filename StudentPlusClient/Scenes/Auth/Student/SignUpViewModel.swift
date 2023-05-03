//
//  SignUpViewModel.swift
//  StudentPlusClient
//
//  Created by Komol Ibragimov on 01/05/2023.
//

import Foundation

final class SignUpViewModel: ObservableObject {
    
    @Published var studentNumber = ""
    @Published var firstName = ""
    @Published var lastName = ""
    @Published var course = ""
    @Published var graduationDate: Int = Calendar.current.component(.year, from: Date())
    @Published var password = ""
    @Published var showError = false
    @Published var errorMessage = ""
    
    @Published var student: StudentDto?
    
    var isValid: Bool {
        !studentNumber.isEmpty
        && !firstName.isEmpty
        && !password.isEmpty
    }
    
    init() {
        AppData.userType = .student
    }
    
    func signUpStudent() {
        let formattedGraduationDate = FormattingManager.getStringDateFrom(InDate: graduationDate)
        
        let singUpData = SignUpRequest(studentNumber: studentNumber,
                                       firstName: firstName,
                                       lastName: lastName,
                                       course: course,
                                       graduationDate: formattedGraduationDate,
                                       password: password)
        
        AuthRequestsService.signUpStudent(using: singUpData) { result in
            switch result {
            case .success(let student):
                self.student = student
                AppData.isSignedIn = true
                AppData.signedInStudent = student
                
            case .failure(let error):
                self.showError = true
                self.errorMessage = error.localizedDescription
            }
        }
    }
    
    func signInStudent() {
        
    }
}

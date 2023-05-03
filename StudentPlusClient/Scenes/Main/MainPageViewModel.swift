//
//  MainPageViewModel.swift
//  StudentPlusClient
//
//  Created by Komol Ibragimov on 02/05/2023.
//

import Foundation

final class MainPageViewModel: ObservableObject {
    @Published var signedOut: Bool = false
    
    func checkSignIn() {
        
    }
    
    func signOut() {
        AppData.isSignedIn = false
        
        if AppData.userType == .student {
            AppData.signedInStudent = nil
        } else {
            AppData.signedInSupervisor = nil
        }
        
        signedOut = true
    }
}

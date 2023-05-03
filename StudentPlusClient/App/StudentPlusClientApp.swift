//
//  StudentPlusClientApp.swift
//  StudentPlusClient
//
//  Created by Komol Ibragimov on 13/01/2023.
//

import SwiftUI

@main
struct StudentPlusClientApp: App {
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                if AppData.isSignedIn {
                    MainPageView(viewModel: MainPageViewModel())
                } else {
                    UserTypeSelectionView()
                }
            }
        }
    }
}

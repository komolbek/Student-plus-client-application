//
//  MainPageView.swift
//  StudentPlusClient
//
//  Created by Komol Ibragimov on 02/05/2023.
//

import SwiftUI

struct MainPageView: View {
    @ObservedObject var viewModel: MainPageViewModel
    
    var body: some View {
        NavigationStack {
            VStack {
                if AppData.userType == .supervisor {
                    NavigationLink(destination: AddStudentsView(viewModel: AddStudentsViewModel())) {
                        Text("Add Students")
                    }
                } else {
                    NavigationLink(destination: SelectSupervisorView(viewModel: SelectSupervisorViewModel())) {
                        Text("Select My Supervisor")
                    }
                }
            }
            .navigationDestination(isPresented: $viewModel.signedOut, destination: {
                UserTypeSelectionView()
            })
            .navigationBarTitle("Home", displayMode: .large)
            .navigationBarItems(trailing: Button(action: {
                viewModel.signOut()
            }, label: {
                Text("Sign Out")
                    .foregroundColor(.green)
            }))
        }
    }
}








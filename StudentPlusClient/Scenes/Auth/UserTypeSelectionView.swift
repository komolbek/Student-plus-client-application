//
//  UserTypeSelectionView.swift
//  StudentPlusClient
//
//  Created by Komol Ibragimov on 02/05/2023.
//

import SwiftUI

struct UserTypeSelectionView: View {
    
    var body: some View {
        VStack {
            Text("Select user type")
                .font(.title)
                .fontWeight(.bold)
                .padding(.bottom, 30)
            
            VStack(alignment: .leading, spacing: 20) {
                NavigationLink {
                    SignUpView(viewModel: SignUpViewModel())
                } label: {
                    Image(systemName: "person.fill")
                        .font(.title)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.green)
                        .clipShape(Circle())
                    
                    Text("Student")
                        .foregroundColor(.primary)
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.center)
                }
                
                NavigationLink {
                    SupervisorSignUpView()
                } label: {
                    Image(systemName: "person.2.fill")
                        .font(.title)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.green)
                        .clipShape(Circle())
                    
                    Text("Supervisor")
                        .foregroundColor(.primary)
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.center)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .padding()
    }
}


//
//  SupervisorSignInView.swift
//  StudentPlusClient
//
//  Created by Komol Ibragimov on 03/05/2023.
//

import SwiftUI

struct SupervisorSignInView: View {
    @ObservedObject var viewModel: SupervisorSignInViewModel
    @State private var isShowingDetailView = false
    
    var body: some View {
        VStack {
            Image(systemName: "person.circle")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
            
            TextField("Supervisor Number", text: $viewModel.supervisorNumber)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
                .autocapitalization(.none)
                .disableAutocorrection(true)
            
            SecureField("Password", text: $viewModel.password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
            
            Button(action: {
                viewModel.signIn()
            }, label: {
                Text("Sign In")
            })
            .frame(maxWidth: .infinity)
            .padding()
            .foregroundColor(.white)
            .background(viewModel.isValid ? Color.green : .gray)
            .cornerRadius(8)
            .padding(.horizontal)
            .disabled(!viewModel.isValid)
            .padding(.top)
            .fullScreenCover(isPresented: $isShowingDetailView, content: {
                MainPageView(viewModel: MainPageViewModel())
            })
            .onChange(of: viewModel.singedIn, perform: { _ in
                isShowingDetailView = true
            })
            
            Button(action: {
                viewModel.forgotPassword()
            }, label: {
                Text("Forgot Password")
                    .foregroundColor(.green)
            })
            .padding(.top, 10)
        }
        .navigationBarTitle("Sign In", displayMode: .inline)
        .alert(isPresented: $viewModel.showError) {
            Alert(title: Text("Error"), message: Text(viewModel.errorMessage), dismissButton: .default(Text("OK")))
        }
    }
}


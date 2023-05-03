//
//  SupervisorSignUpView.swift
//  StudentPlusClient
//
//  Created by Komol Ibragimov on 02/05/2023.
//

import SwiftUI

struct SupervisorSignUpView: View {
    @ObservedObject var viewModel = SupervisorSignUpViewModel()
    @State private var isShowingDetailView = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            TextField("Supervisor Number", text: $viewModel.supervisorNumber)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
                .padding(.bottom, 10)
            
            TextField("First Name", text: $viewModel.firstName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
                .padding(.bottom, 10)
            
            TextField("Last Name", text: $viewModel.lastName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
                .padding(.bottom, 10)
            
            TextField("Department", text: $viewModel.department)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
                .padding(.bottom, 10)
            
            TextField("Title", text: $viewModel.title)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
                .padding(.bottom, 10)
            
            SecureField("Password", text: $viewModel.password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
                .padding(.bottom, 10)
        
            Button(action: {
                viewModel.signUpSupervisor()
            }) {
                Text("Sign Up")
                    .padding(.vertical, 10)
                    .padding(.horizontal, 25)
            }
            .disabled(!viewModel.isValid)
            .bold()
            .frame(width: 300, height: 50)
            .background(viewModel.isValid ? Color.green : Color.gray)
            .foregroundColor(.white)
            .cornerRadius(8)
            .fullScreenCover(isPresented: $isShowingDetailView, content: {
                    MainPageView(viewModel: MainPageViewModel())
            })
            .onChange(of: viewModel.supervisor, perform: { _ in
                if viewModel.supervisor != nil {
                    isShowingDetailView = true
                }
            })
            
            HStack {
                Spacer()
                
                Button(action: {
                    // handle forgot password
                }) {
                    Text("Forgot Password")
                        .foregroundColor(.green)
                }
                
                Spacer()
                
                NavigationLink(destination: SupervisorSignInView(viewModel: SupervisorSignInViewModel())) {
                    Text("Sign In")
                        .bold()
                        .padding(.vertical, 10)
                        .padding(.horizontal, 25)
                        .foregroundColor(.green)
                        .cornerRadius(5)
                }
                
                Spacer()
            }
            .padding(.top, 20)
            .padding(.bottom, 40)
            .padding(.horizontal)
        }
        .padding(.horizontal, 40)
        .navigationBarTitle("Supervisor Sign Up", displayMode: .inline)
        .padding(.bottom, 20)
        .alert(isPresented: $viewModel.showError) {
            Alert(title: Text("Error"), message: Text(viewModel.errorMessage), dismissButton: .default(Text("OK")))
        }
    }
}

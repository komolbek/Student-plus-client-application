//
//  SignUpView.swift
//  StudentPlusClient
//
//  Created by Komol Ibragimov on 01/05/2023.
//

import SwiftUI

struct SignUpView: View {
    @StateObject var viewModel: SignUpViewModel
    @State private var isShowingDetailView = false
    
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            
            TextField("Student Number*", text: $viewModel.studentNumber)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal, 50)
            
            TextField("First Name*", text: $viewModel.firstName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal, 50)
            
            TextField("Last Name", text: $viewModel.lastName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal, 50)
            
            TextField("Course", text: $viewModel.course)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal, 50)
            
            VStack(alignment: .center) {
                Text("Graduation Date")
                    .font(.headline)
                
                YearPicker(selectedYear: $viewModel.graduationDate)
                    .padding(.horizontal, 50)
            }
            
            SecureField("Password*", text: $viewModel.password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal, 50)
            
            Button {
                viewModel.signUpStudent()
            } label: {
                Text("Sign Up")
            }
            .bold()
            .frame(width: 300, height: 50)
            .background(viewModel.isValid ? Color.green : Color.gray)
            .foregroundColor(.white)
            .cornerRadius(8)
            .disabled(!viewModel.isValid)
            .fullScreenCover(isPresented: $isShowingDetailView, content: {
                MainPageView(viewModel: MainPageViewModel())
            })
            .onChange(of: viewModel.student, perform: { _ in
                isShowingDetailView = true
            })
            
            HStack {
                Button {
                    isShowingDetailView = true
                } label: {
                    Text("Forgot Password?")
                        .foregroundColor(.green)
                }
                Spacer()
                
                NavigationLink {
                    SignInView(viewModel: SignInViewModel())
                } label: {
                    Text("Sign In")
                        .bold()
                        .frame(width: 100, height: 40)
                        .foregroundColor(.green)
                }
                
                Spacer()
            }
            .padding(.horizontal, 50)
        }
        .padding(.vertical, 150)
        .navigationBarTitle("Home", displayMode: .inline)
        .alert(isPresented: $viewModel.showError) {
            Alert(title: Text("Error"), message: Text(viewModel.errorMessage), dismissButton: .default(Text("OK")))
        }
    }
}

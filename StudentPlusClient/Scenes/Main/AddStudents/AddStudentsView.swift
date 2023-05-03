//
//  AddStudentsView.swift
//  StudentPlusClient
//
//  Created by Komol Ibragimov on 02/05/2023.
//

import SwiftUI

struct AddStudentsView: View {
    @ObservedObject var viewModel: AddStudentsViewModel
    
    var body: some View {
        VStack {
            TextField("Enter student number", text: $viewModel.studentNumber)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button(action: {
                viewModel.addStudent()
            }, label: {
                Text("Add")
            })
            .disabled(viewModel.studentNumber.isEmpty)
            .padding()
            
            if viewModel.hasDuplicate {
                Text("Warning: This student number already exists!")
                    .foregroundColor(.red)
                    .padding(.top)
            }
                
            
            List(viewModel.studentNumbers, id: \.self) { studentNumber in
                Text(studentNumber)
                Button(action: {
                    viewModel.deleteStudent(studentNumber: studentNumber)
                }, label: {
                    Image(systemName: "trash")
                })
                .foregroundColor(.red)
            }
            .padding()
            
            Button(action: {
                viewModel.saveStudents()
            }, label: {
                Text("Save")
            })
            .padding()
        }
    }
}

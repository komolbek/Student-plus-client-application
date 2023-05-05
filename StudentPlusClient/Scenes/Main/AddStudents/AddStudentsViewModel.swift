//
//  AddStudentsViewModel.swift
//  StudentPlusClient
//
//  Created by Komol Ibragimov on 02/05/2023.
//

import Foundation

final class AddStudentsViewModel: ObservableObject {
    w
    @Published var studentNumber = ""
    @Published var studentNumbers = [String]()
    @Published var hasDuplicate: Bool = false
    
    var isNewStudentNumberValid: Bool {
            !studentNumber.isEmpty && !studentNumbers.contains(studentNumber)
        }
    
    func addStudent() {
        guard isNewStudentNumberValid else {
            hasDuplicate = true
            return
        }
        hasDuplicate = false
        studentNumbers.append(studentNumber)
        studentNumber = ""
    }
    
    func deleteStudent(studentNumber: String) {
        studentNumbers.removeAll(where: { $0 == studentNumber })
    }
    
    func saveStudents() {
        let supervisor = AppData.signedInSupervisor
        
        MainPageService.addStudents(studentNumbers, to: supervisor?.supervisorId ?? "") { result in
            switch result {
            case .success(let data):
                print(data)
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }
}

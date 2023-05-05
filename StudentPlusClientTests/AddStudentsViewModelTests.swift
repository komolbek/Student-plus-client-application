//
//  AddStudentsViewModelTests.swift
//  StudentPlusClientTests
//
//  Created by Komol Ibragimov on 03/05/2023.
//

import XCTest
@testable import StudentPlusClient

class AddStudentsViewModelTests: XCTestCase {
    
//    let mockNetworkManager = NetworkManager.shared
//
//    override func setUpWithError() throws {
//        try super.setUpWithError()
//        AuthRequestsService.networkManager = mockNetworkManager
//    }
//
//    func testSignInStudentSuccess() {
//        // given
//        let expectedStudent = StudentDto(id: "1", firstName: "John", lastName: "Doe")
//        let requestData = SignInRequest(email: "john.doe@example.com", password: "password")
//        mockNetworkManager.resultToReturn = .success(expectedStudent)
//
//        // when
//        AuthRequestsService.signInStudent(using: requestData) { result in
//            // then
//            switch result {
//            case .success(let student):
//                XCTAssertEqual(student.id, expectedStudent.id)
//                XCTAssertEqual(student.firstName, expectedStudent.firstName)
//                XCTAssertEqual(student.lastName, expectedStudent.lastName)
//            case .failure:
//                XCTFail("Expected success, but got failure.")
//            }
//        }
//    }
//
//    func testSignInStudentFailure() {
//        // given
//        let requestData = SignInRequest(email: "john.doe@example.com", password: "password")
//        let expectedError = NSError(domain: "Test", code: 1, userInfo: nil)
//        mockNetworkManager.resultToReturn = .failure(expectedError)
//
//        // when
//        AuthRequestsService.signInStudent(using: requestData) { result in
//            // then
//            switch result {
//            case .success:
//                XCTFail("Expected failure, but got success.")
//            case .failure(let error):
//                XCTAssertEqual(error.localizedDescription, expectedError.localizedDescription)
//            }
//        }
//    }
//    
    // similar tests for signInSupervisor, signUpStudent, and signUpSupervisor
}


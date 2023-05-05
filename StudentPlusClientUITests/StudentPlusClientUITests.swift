//
//  StudentPlusClientUITests.swift
//  StudentPlusClientUITests
//
//  Created by Komol Ibragimov on 13/01/2023.
//

import XCTest
@testable import StudentPlusClient

final class StudentPlusClientUITests: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app = XCUIApplication()
    }
    
    func testSignUpSuccess() {
        app.launch()
        
        let studentNumberField = app.textFields["Student Number*"]
        studentNumberField.tap()
        studentNumberField.typeText("1234567890")
        
        let firstNameField = app.textFields["First Name*"]
        firstNameField.tap()
        firstNameField.typeText("John")
        
        let lastNameField = app.textFields["Last Name"]
        lastNameField.tap()
        lastNameField.typeText("Doe")
        
        let courseField = app.textFields["Course"]
        courseField.tap()
        courseField.typeText("Computer Science")
        
        let graduationDatePicker = app.datePickers["Graduation Date"]
        graduationDatePicker.swipeUp()
        let yearComponent = graduationDatePicker.pickerWheels.element(boundBy: 0)
        yearComponent.adjust(toPickerWheelValue: "2024")
        
        let passwordField = app.secureTextFields["Password*"]
        passwordField.tap()
        passwordField.typeText("123456")
        
        app.buttons["Sign Up"].tap()
        
        XCTAssertTrue(app.navigationBars["Home"].exists)
    }
    
    func testSignUpError() {
        app.launch()
        
        let studentNumberField = app.textFields["Student Number*"]
        studentNumberField.tap()
        studentNumberField.typeText("invalid_student_number")
        
        let firstNameField = app.textFields["First Name*"]
        firstNameField.tap()
        firstNameField.typeText("John")
        
        let passwordField = app.secureTextFields["Password*"]
        passwordField.tap()
        passwordField.typeText("123456")
        
        app.buttons["Sign Up"].tap()
        
        XCTAssertTrue(app.alerts["Error"].exists)
        app.alerts["Error"].buttons["OK"].tap()
    }
    
    func testSignInNavigation() {
        app.launch()
        
        XCTAssertTrue(app.navigationBars["Sign In"].exists)
    }
}

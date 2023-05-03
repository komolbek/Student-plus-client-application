//
//  AppData.swift
//  StudentPlusClient
//
//  Created by Komol Ibragimov on 01/05/2023.
//

import Foundation

enum AppData {

    static var userType: UserType? {
        get {
            return UserType(rawValue: UserDefaults.standard.integer(forKey: "userType"))
        }
        set {
            UserDefaults.standard.set(newValue?.rawValue, forKey: "userType")
        }
    }
    
    static var isSignedIn: Bool {
        get {
            return UserDefaults.standard.bool(forKey: "isSignedIn")
        }
        set(newValue) {
            UserDefaults.standard.set(newValue, forKey: "isSignedIn")
        }
    }
    
    static var signedInStudent: StudentDto? {
        get {
            if let data = UserDefaults.standard.data(forKey: "student"),
                let student = try? JSONDecoder().decode(StudentDto.self, from: data) {
                return student
            }
            return nil
        }
        set {
            if let student = newValue, let data = try? JSONEncoder().encode(student) {
                UserDefaults.standard.set(data, forKey: "student")
            } else {
                UserDefaults.standard.removeObject(forKey: "student")
            }
        }
    }
    
    static var signedInSupervisor: SupervisorDto? {
        get {
            if let data = UserDefaults.standard.data(forKey: "supervisor"),
                let supervisor = try? JSONDecoder().decode(SupervisorDto.self, from: data) {
                return supervisor
            }
            return nil
        }
        set {
            if let supervisor = newValue, let data = try? JSONEncoder().encode(supervisor) {
                UserDefaults.standard.set(data, forKey: "supervisor")
            } else {
                UserDefaults.standard.removeObject(forKey: "supervisor")
            }
        }
    }
}

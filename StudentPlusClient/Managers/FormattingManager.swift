//
//  FormattingManager.swift
//  StudentPlusClient
//
//  Created by Komol Ibragimov on 01/05/2023.
//

import Foundation

enum FormattingManager {
    
    static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy"
        return formatter
    }()
    
    static func getStringDateFrom(InDate date: Int) -> String {
        return dateFormatter.string(from: Calendar.current.date(from: DateComponents(year: date)) ?? Date())
    }
}

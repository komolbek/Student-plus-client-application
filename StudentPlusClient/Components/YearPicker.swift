//
//  YearPicker.swift
//  StudentPlusClient
//
//  Created by Komol Ibragimov on 01/05/2023.
//

import SwiftUI

struct YearPicker: View {
    private let years = Array(2000...Calendar.current.component(.year, from: Date()+3))

    @Binding var selectedYear: Int

    var body: some View {
        Picker("Year", selection: $selectedYear) {
            ForEach(years, id: \.self) { year in
                Text("\(year)").tag(year)
            }
        }
        .pickerStyle(WheelPickerStyle())
        .fixedSize(horizontal: true, vertical: true) // Ensure the picker size does not change when the view appears
        .frame(maxWidth: .infinity) // Stretch the picker to fill available space
    }
}

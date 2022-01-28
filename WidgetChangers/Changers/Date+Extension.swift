//
//  Date+Extension.swift
//  WidgetChangers
//
//  Created by Clement Yerochewski on 26.01.22.
//

import Foundation

extension Date {
    var currentYearString: String {
        let date = Date()
        let format = DateFormatter()
        format.dateFormat = "yyyy"
        let formattedDate = format.string(from: date)
        return formattedDate
    }
}

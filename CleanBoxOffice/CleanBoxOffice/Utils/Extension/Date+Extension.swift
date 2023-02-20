//
//  Date+Extension.swift
//  CleanBoxOffice
//
//  Created by unchain on 2023/02/15.
//

import Foundation

extension Date {
    var now: String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_kr")
        formatter.timeZone = TimeZone(abbreviation: "KST")
        formatter.dateFormat = "yyyyMMdd"
        let formattedDate = formatter.string(from: self)

        return formattedDate
    }

    var year: String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_kr")
        formatter.timeZone = TimeZone(abbreviation: "KST")
        formatter.dateFormat = "YYYY"
        let formattedDate = formatter.string(from: self)

        return formattedDate
    }

}

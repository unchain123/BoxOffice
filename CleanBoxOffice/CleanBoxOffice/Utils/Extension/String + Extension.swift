//
//  String + Extension.swift
//  CleanBoxOffice
//
//  Created by unchain on 2023/02/22.
//

import Foundation

extension String {
    func decimalFormatter() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        guard let num = Int(self) else { return "" }
        guard let formatted = numberFormatter.string(from: NSNumber(value: Int(num))) else { return "" }
        return formatted
    }
}

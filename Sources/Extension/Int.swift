//
//  Int.swift
//  Zela
//
//  Created by Gabriel Chirico Mahtuk de Melo Sanzone on 23/01/24.
//

import Foundation

extension Int {
    func formattedString(mask: String) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.minimumIntegerDigits = mask.count
        numberFormatter.maximumFractionDigits = 0
        numberFormatter.minimumFractionDigits = 0
        numberFormatter.numberStyle = .decimal
        numberFormatter.groupingSeparator = ""
        numberFormatter.decimalSeparator = ""

        return numberFormatter.string(from: NSNumber(value: self)) ?? ""
    }
}

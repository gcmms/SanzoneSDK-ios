//
//  Date.swift
//  CountDown
//
//  Created by Gabriel Chirico Mahtuk de Melo Sanzone on 10/04/23.
//  Copyright © 2023 Gabriel Chirico Mahtuk de Melo Sanzone. All rights reserved.
//

import Foundation

public extension Date {

    static func dateToString(stringDate: String, _ dateFormat: String = "dd/MM/yyyy") -> Date {
        //let dateString = "13/04/2023"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        return dateFormatter.date(from: stringDate) ?? Date()
    }
}

//
//  DateExtension.swift
//  MX3Hydration
//
//  Created by Anh Vu on 11/27/17.
//  Copyright © 2017 MX3 Diagnostics. All rights reserved.
//

import Foundation

public extension Date {
    func toString(dateFormat: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormat
        formatter.amSymbol = "am"
        formatter.pmSymbol = "pm"
        return formatter.string(from: self)
    }
}

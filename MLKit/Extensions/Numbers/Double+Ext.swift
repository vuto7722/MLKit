//
//  Double+Ext.swift
//  MLAVKit
//
//  Created by Anh Vu on 1/30/18.
//

public extension Double {
    /// Rounds the double to decimal places value
    func rounded(toPlaces places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}

//
//  Decimal+Formatted.swift
//  Tradernet Quotes
//
//  Created by Zafar Ivaev on 23/12/22.
//

import Foundation

extension Decimal {
    var withFormat: String {
        let formatter = NumberFormatter()
        formatter.groupingSeparator = "."
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 5
        return formatter.string(for: self) ?? String(describing: self)
    }
    
    var withFormatPlusSign: String {
        let formatter = NumberFormatter()
        formatter.groupingSeparator = "."
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 5
        formatter.positivePrefix = formatter.plusSign
        return formatter.string(for: self) ?? String(describing: self)
    }
}

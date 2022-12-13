//
//  Double.swift
//  Crypto
//
//  Created by Amir Diafi on 12/1/22.
//

import Foundation

extension Double {
    
    /// Convert a Double into a currency with 2-6 decimal places
    ///```
    /// convert 1234.56 to $1,234.56
    /// convert 12.3456 to $12,3456
    /// convert 0.123456 to $0,123456
    /// ```
    private var currencyFormatter6: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "en_US")
        formatter.currencyCode = "usd" // <-- change currency
        formatter.currencySymbol = "$" // <-- change currency symbol
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 6
        return formatter
    }
    
    /// Convert a Double into a currency as a string with 2-6 decimal places
    ///```
    /// convert "1234.56" to "$1,234.56"
    /// convert "12.3456" to "$12,3456"
    /// convert "0.123456" to "$0,123456"
    /// ```
    func asCurrencyWith6Decimals() -> String {
        let number = NSNumber(value: self)
        return currencyFormatter6.string(from: number) ?? "$0.00"
        
    }
    
    /// Convert a Double into a currency with 2-6 decimal places
    ///```
    /// convert 1234.56 to $1,23
    /// convert 12.3456 to $12,34
    /// convert 0.123456 to $0,12
    /// ```
    private var currencyFormatter2: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "en_US")
        formatter.currencyCode = "usd" // <-- change currency
        formatter.currencySymbol = "$" // <-- change currency symbol
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }
    
    /// Convert a Double into a currency as a string with 2 decimal places
    ///```
    /// convert "12.3456" to "$12,34"
    /// ```
    func asCurrencyWith2Decimals() -> String {
        let number = NSNumber(value: self)
        return currencyFormatter2.string(from: number) ?? "$0.00"
        
    }
    
    /// Convert a Double into a string representation
    ///```
    /// convert 13.545 to "13.54"
    /// ```
    func asNumberString() -> String {
        return String(format: "%.2f", self)
    }
    
    /// Convert a Double into a string percentage representation
    ///```
    /// convert "13.54" to "13.54%"
    /// ```
    func asPercentString() -> String {
        return asNumberString() + "%"
    }
}

//
//  Double+Utils.swift
//  Test-iOS-TCS
//
//  Created by Ewerton Rabello on 05/05/20.
//  Copyright © 2020 Ewerton Rabello. All rights reserved.
//

import Foundation

extension Double {
    func currencyFormatted() -> String? {
        var number: NSNumber!
        let formatter = NumberFormatter()
        
        formatter.numberStyle = .currency
        formatter.locale = NSLocale(localeIdentifier: "pt_BR") as Locale
        
        number = NSNumber(value: self)
        
        return formatter.string(from: number)
    }
}

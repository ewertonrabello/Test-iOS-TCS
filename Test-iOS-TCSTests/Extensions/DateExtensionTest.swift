//
//  DateExtensionTest.swift
//  Test-iOS-TCSTests
//
//  Created by Ewerton Rabello on 13/05/20.
//  Copyright © 2020 Ewerton Rabello. All rights reserved.
//

import XCTest

@testable import Test_iOS_TCS

class DateExtensionTest: XCTestCase {
    
    func createDate() -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.date(from: "1998-09-10") ?? Date()
    }
    
    func testToString() {
        guard let date = createDate() else { return }
        let stringDate = date.toString()
        
        XCTAssertEqual(stringDate, "10/09/1998")
    }
}

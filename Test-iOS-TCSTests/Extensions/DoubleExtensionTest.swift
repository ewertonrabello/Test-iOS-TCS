//
//  DoubleExtensionTest.swift
//  Test-iOS-TCSTests
//
//  Created by Ewerton Rabello on 13/05/20.
//  Copyright © 2020 Ewerton Rabello. All rights reserved.
//

import XCTest

@testable import Test_iOS_TCS

class DoubleExtensionTest: XCTestCase {
    func testDoubleLocaleFormat() {
        let value = 100.0
        let stringValue = value.currencyFormatted()
        XCTAssertEqual(stringValue, "R$ 100,00")
    }
}

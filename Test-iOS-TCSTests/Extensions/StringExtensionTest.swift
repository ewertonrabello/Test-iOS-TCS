//
//  StringExtensionTest.swift
//  Test-iOS-TCSTests
//
//  Created by Ewerton Rabello on 13/05/20.
//  Copyright © 2020 Ewerton Rabello. All rights reserved.
//

import XCTest

@testable import Test_iOS_TCS

class StringExtensionTest: XCTestCase {
    
    func testValidCpf() {
        let cpf = "59651180072"
        let isValid = cpf.validateCpf()
        XCTAssertTrue(isValid)
    }
    
    func testInvalidCpf() {
        let cpf = "111111111"
        let isInvalid = cpf.validateCpf()
        XCTAssertFalse(isInvalid)
    }
    
    func testIsValidRegex() {
        let email = "emailTeste@teste.com"
        let isValid = email.validateRegex(pattern: Constants.Regex.emailRegex)
        XCTAssertTrue(isValid)
    }
    
    func testInvalidRegex() {
        let email = "emailTeste.com"
        let isInvalid = email.validateRegex(pattern: Constants.Regex.emailRegex)
        XCTAssertFalse(isInvalid)
    }
    
    func testConvertDate() {
        let date = "1994-06-07"
        let dateConverter = date.convertDataFormat()
        XCTAssertEqual(dateConverter, "07/06/1994")
    }
    
    func testDateConverterFail() {
        let date = ""
        let dateConverter = date.convertDataFormat()
        XCTAssertNil(dateConverter)
    }
    
    func testDate() {
        let stringDate = "1994-06-07"
        let date = stringDate.toDate()
        
        XCTAssertNotEqual(date, Date())
    }
}

//
//  StatementsWorkTest.swift
//  Test-iOS-TCSTests
//
//  Created by Ewerton Rabello on 13/05/20.
//  Copyright © 2020 Ewerton Rabello. All rights reserved.
//

import XCTest

@testable import Test_iOS_TCS

class StatementsWorkTest: XCTestCase {

    var sut: StatementsWorker!
    
    override func setUp() {
        super.setUp()
        setupStatementsWorker()
    }
    
    func setupStatementsWorker() {
        sut = StatementsWorker()
    }
    
    func testFetchStatement() {
        let expectation = XCTestExpectation(description: "get request")
        
        sut.getStatements(completionSuccess: { (response) in
            XCTAssertNotNil(response)
            expectation.fulfill()
        }, completionFailure: { (_) in })
        
        wait(for: [expectation], timeout: 30.0)
    }
}

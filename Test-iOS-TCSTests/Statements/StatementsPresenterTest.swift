//
//  StatementsPresenterTest.swift
//  Test-iOS-TCSTests
//
//  Created by Ewerton Rabello on 13/05/20.
//  Copyright © 2020 Ewerton Rabello. All rights reserved.
//

import XCTest

@testable import Test_iOS_TCS

class StatementsPresenterTest: XCTestCase {

    var sut: StatementsPresenter!
    
    // MARK: Test lifecycle
    
    override func setUp() {
        super.setUp()
        setupStatementsPresenter()
    }
    
    // MARK: Test setup
    
    func setupStatementsPresenter() {
        sut = StatementsPresenter()
    }
    
    // MARK: Test doubles
    
    class StatementsDisplayLogicSpy: StatementsDisplayLogic {
        var setDataIsCalled = false
        var setHeaderIsCalled = false
        var getErrorIsCalled = false
        
        func setHeaderData(viewModel: StatementsModel.Header.ViewModel) {
            setHeaderIsCalled = true
        }
        
        func setData(viewModel: StatementsModel.Fetch.ViewModel) {
            setDataIsCalled = true
        }
        
        func showAlertError(error: String) {
            getErrorIsCalled = true
        }
    }
    
    // MARK: Tests
    
    func testFetchStatement() {
        let viewControllerSpy = StatementsDisplayLogicSpy()
        sut.viewController = viewControllerSpy
        let statement = StatementList(title: "", accountName: "", date: "", accountValue: 0.0)
        let statementList = Statement(statementList: [statement], error: nil)
        let response = StatementsModel.Fetch.Response(statements: statementList)
        
        sut.presentGetStatements(response: response)
        
        XCTAssertTrue(viewControllerSpy.setDataIsCalled)
    }
    
    func testFetchHeader() {
        let viewControllerSpy = StatementsDisplayLogicSpy()
        sut.viewController = viewControllerSpy
        let response = StatementsModel.Header.Response(headerDataResponse: nil)
        
        sut.setupHeader(data: response)
        XCTAssertTrue(viewControllerSpy.setHeaderIsCalled)
    }
}

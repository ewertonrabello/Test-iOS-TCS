//
//  LoginWorkerTest.swift
//  Test-iOS-TCSTests
//
//  Created by Ewerton Rabello on 13/05/20.
//  Copyright © 2020 Ewerton Rabello. All rights reserved.
//

import XCTest

@testable import Test_iOS_TCS

class LoginWorkerTest: XCTestCase {

    var sut: LoginWorker!
    
    // MARK: Test lifecycle
    
    override func setUp() {
        super.setUp()
        setupWorker()
    }
    
    func setupWorker() {
        sut = LoginWorker()
    }
    
    func testCreateRequest() {
        guard let url = URL(string: Constants.URL.loginUrl) else { return }
        let requestData = LoginModel.Login.Request(userId: "teste@teste.com", password: "Teste@1")
        let request = sut.postLogin(requestData: requestData, urlRequest: url)
        XCTAssertNotNil(request)
        XCTAssertEqual(request.httpMethod, "POST")
    }
    
    func testValidUsername() {
        let isValid = sut.validateUserId(userId: "teste@teste.com")
        XCTAssertTrue(isValid)
    }
    
    func testValidUsernameFail() {
        let isInvalid = sut.validateUserId(userId: "teste.teste@")
        XCTAssertFalse(isInvalid)
    }
    
    func testValidPassword() {
        let isValid = sut.validatePassword(password: "Teste@1")
        XCTAssertTrue(isValid)
    }
    
    func testValidPasswordFail() {
        let isInvalid = sut.validatePassword(password: "teste@1")
        XCTAssertFalse(isInvalid)
    }
    
    func testLoginRequest() {
        let expectation = XCTestExpectation(description: "validate login request")
        
        sut.login(requestData: LoginModel.Login.Request(userId: "teste@teste.com", password: "Teste@1"), completionSuccess: { (response) in
            XCTAssertNotNil(response)
            expectation.fulfill()
        }, completionFailure: { (failure) in })
        
        wait(for: [expectation], timeout: 20.0)
    }
}

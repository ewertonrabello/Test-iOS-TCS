//
//  LoginViewControllerTest.swift
//  Test-iOS-TCSTests
//
//  Created by Ewerton Rabello on 13/05/20.
//  Copyright © 2020 Ewerton Rabello. All rights reserved.
//

import XCTest

@testable import Test_iOS_TCS

class LoginViewControllerTest: XCTestCase {

    var sut: LoginViewController!
    var window: UIWindow!
    
    // MARK: Test lifecycle
    
    override func setUp() {
        super.setUp()
        window = UIWindow()
        setupLoginViewController()
    }
    
    // MARK: Test setup
    
    func setupLoginViewController() {
        let bundle = Bundle.main
        let storyboard = UIStoryboard(name: "Main", bundle: bundle)
        sut = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController
    }
    
    func loadView() {
        window.addSubview(sut.view)
        RunLoop.current.run(until: Date())
    }
    
    // MARK: Test spies
    
    class LoginBusinessLogicSpy: LoginBusinessLogic {
        var postLoginIsCalled = false
        var getSavedUsernameIsCalled = false
        
        func getSavedUserName() {
            getSavedUsernameIsCalled = true
        }
        
        func postLogin(request: LoginModel.Login.Request) {
            postLoginIsCalled = true
        }
    }
    
    // MARK: Tests
    
    func testPostLogin() {
        let spy = LoginBusinessLogicSpy()
        sut.interactor = spy
        
        loadView()
        sut.postLogin()
        
        XCTAssertTrue(spy.postLoginIsCalled)
    }
    
    func testGetLastUsername() {
        // Given
        let spy = LoginBusinessLogicSpy()
        sut.interactor = spy
        
        // When
        loadView()
        sut.getLastUsername()
        
        // Then
        XCTAssertTrue(spy.getSavedUsernameIsCalled)
    }
    
    func testFillUsername() {
        // When
        loadView()
        sut.saveUserName(username: "teste@teste.com")
        
        //Then
        XCTAssertEqual(sut.userIdentificationTextField.text, "teste@teste.com")
    }
}

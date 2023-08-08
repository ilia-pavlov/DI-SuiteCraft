//
//  SignupPresenterTests.swift
//  DI-SuiteCraftTests
//
//  Created by Ilia Pavlov on 8/3/23.
//

import XCTest
@testable import DI_SuiteCraft

final class SignupPresenterTests: XCTestCase {
    var signupFormModel: SignupFormModel!
    var mockSignupModelValidator: MockSignupModelValidator!
    var mockSignupWebService: MockSignupWebService!
    var sut: SignupPresenter!
    var mockSignupViewDelegate: MockSignupViewDelegate!
     
    override func setUpWithError() throws {
        signupFormModel = SignupFormModel(firstName: "Bob",
                                              lastName: "Dylan",
                                              email: "test@test.com",
                                              password: "123456",
                                              repeatPassword: "123456")
        mockSignupModelValidator = MockSignupModelValidator()
        mockSignupWebService = MockSignupWebService()
        mockSignupViewDelegate = MockSignupViewDelegate()
        
        sut = SignupPresenter(formModelValidator: mockSignupModelValidator,
                              webService: mockSignupWebService,
                              delegate: mockSignupViewDelegate)
    }

    override func tearDownWithError() throws {
        signupFormModel = nil
        mockSignupModelValidator = nil
        mockSignupWebService = nil
        sut = nil
        mockSignupViewDelegate = nil
    }
    
    func testValidateEachProperty() {
        // Act
        sut.processUserSignup(formModel: signupFormModel)
        
        // Assert
        XCTAssertTrue(mockSignupModelValidator.isFirstNameValidated)
        XCTAssertTrue(mockSignupModelValidator.isLastNameValidated)
        XCTAssertTrue(mockSignupModelValidator.isEmailValidated)
        XCTAssertTrue(mockSignupModelValidator.isPasswordValidated)
        XCTAssertTrue(mockSignupModelValidator.isPasswordMatchValidated)
    }
    
    func testValidFormModelShouldCallSignupMethod() {
        sut.processUserSignup(formModel: signupFormModel)
        
        XCTAssertTrue(mockSignupWebService.isSignupMethodCalled)
    }
    
    func testSignupSuccessThenCallViewDelegate() {
        let myExpectation = expectation(description: "successfulSignup() was called")
        
        mockSignupViewDelegate.expectation = myExpectation
        
        sut.processUserSignup(formModel: signupFormModel)
        self.wait(for: [myExpectation], timeout: 5)
        
        XCTAssertEqual(mockSignupViewDelegate.signupCalledTimes, 1)
    }
    
    func testSignupFailedThenCallViewDelegate() {
        let errorHandlerExpectation = expectation(description: "errorHandler() was called")
        
        mockSignupViewDelegate.expectation = errorHandlerExpectation
        mockSignupWebService.shouldReturnError = true
        
        sut.processUserSignup(formModel: signupFormModel)
        self.wait(for: [errorHandlerExpectation], timeout: 5)
        
        XCTAssertEqual(mockSignupViewDelegate.signupCalledTimes, 0)
        XCTAssertEqual(mockSignupViewDelegate.errorHandlerCalledTimes, 1)
        XCTAssertNotNil(mockSignupViewDelegate.signupError)
    }
}

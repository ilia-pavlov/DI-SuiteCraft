//
//  SignupPresenterTests.swift
//  DI-SuiteCraftTests
//
//  Created by Ilia Pavlov on 8/3/23.
//

import XCTest
@testable import DI_SuiteCraft

final class SignupPresenterTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testValidateEachProperty() {
        // Arrange
        let signupFormModel = SignupFormModel(firstName: "Bob",
                                              lastName: "Dylan",
                                              email: "test@test.com",
                                              password: "123456",
                                              repeatPassword: "123456")
        let mockSignupModelValidator = MockSignupModelValidator()
        
        let sut = SignupPresenter(fromModelValidator: mockSignupModelValidator)
        
        // Act
        sut.processUserSignup(formModel: signupFormModel)
        
        // Assert
        XCTAssertTrue(mockSignupModelValidator.isFirstNameValidated)
        XCTAssertTrue(mockSignupModelValidator.isLastNameValidated)
        XCTAssertTrue(mockSignupModelValidator.isEmailValidated)
        XCTAssertTrue(mockSignupModelValidator.isPasswordValidated)
        XCTAssertTrue(mockSignupModelValidator.isPasswordMatchValidated)
        
        
    }
}

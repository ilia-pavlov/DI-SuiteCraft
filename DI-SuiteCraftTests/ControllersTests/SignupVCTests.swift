//
//  SignupVCTests.swift
//  DI-SuiteCraftTests
//
//  Created by Ilia Pavlov on 8/8/23.
//

import XCTest
@testable import DI_SuiteCraft

final class SignupVCTests: XCTestCase {
    var storyboard: UIStoryboard!
    var sut: SignupVC!
    
    override func setUpWithError() throws {
        storyboard = UIStoryboard(name: "Signup", bundle: nil)
        sut = storyboard.instantiateViewController(identifier: "SignupVC") as SignupVC
        
        sut?.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testsRequiredTextFieldsEmpty() throws {
        let firstNameTextField = try XCTUnwrap(sut.firstNameTextField, "The firstNameTextField is not connected to IBOutlet")
        let lastNameTextField = try XCTUnwrap(sut.lastNameTextField, "The lastNameTextField is not connected to IBOutlet")
        let emailTextField = try XCTUnwrap(sut.emailTextField, "The emailTextField is not connected to IBOutlet")
        let passwordTextField = try XCTUnwrap(sut.passwordTextField, "The passwordTextField is not connected to IBOutlet")
        let repeatPasswordTextField = try XCTUnwrap(sut.repeatPasswordTextField, "The repeatPasswordTextField is not connected to IBOutlet")
        
        XCTAssertEqual(firstNameTextField.text, "")
        XCTAssertEqual(lastNameTextField.text, "")
        XCTAssertEqual(emailTextField.text, "")
        XCTAssertEqual(passwordTextField.text, "")
        XCTAssertEqual(repeatPasswordTextField.text, "")
    }
    
    func testSignupButtonAction() throws {
        // Arrange
        let signupButton: UIButton = try XCTUnwrap(sut.signupButton, "The signup button does not have referencing outlet")
        // Act
        let signupButtonActions = try XCTUnwrap(signupButton.actions(forTarget: sut, forControlEvent: .touchUpInside))
        // Assert
        XCTAssertEqual(signupButtonActions.count, 1)
        XCTAssertEqual(signupButtonActions.first, "signupButtonTapped:", "There is no action with a name signupButtonTapped assigned to signup button")
    }
    
    func testSignupButtonTappedInvokesSignupProcess() {
        let mockSignupModelValidator = MockSignupModelValidator()
        let mockWebService = MockSignupWebService()
        let mockSignupViewDelegate = MockSignupViewDelegate()
        
        let mockSignupPresenter = MockSignupPresenter(formModelValidator: mockSignupModelValidator,
                                                      webService: mockWebService,
                                                      delegate: mockSignupViewDelegate)
        
        sut.signupPresenter = mockSignupPresenter
        
        sut.signupButton.sendActions(for: .touchUpInside)
        
        XCTAssertTrue(mockSignupPresenter.processUserSignupCalled)
    }
}

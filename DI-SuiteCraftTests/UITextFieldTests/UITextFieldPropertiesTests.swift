//
//  UITextFieldPropertiesTests.swift
//  DI-SuiteCraftTests
//
//  Created by Ilia Pavlov on 8/15/23.
//

import XCTest
@testable import DI_SuiteCraft

final class UITextFieldPropertiesTests: XCTestCase {

    var sut: CreateAccountVC!
    
    override func setUpWithError() throws {
        let storyboard = UIStoryboard(name: "CreateAccount", bundle: nil)
        
        sut = storyboard.instantiateViewController(withIdentifier: "CreateAccountVC") as? CreateAccountVC
        sut.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testEmailFieldContentTypeSet() throws {
        let emailTextField = try XCTUnwrap(sut.emailTextField, "Email field is not connected to VC")
        XCTAssertEqual(emailTextField.textContentType, .emailAddress) // UITextContentType.emailAddress
    }
    
    func testEmailFieldHasEmailKeyboardType() throws {
        let emailTextField = try XCTUnwrap(sut.emailTextField, "Email field is not connected to VC")
        XCTAssertEqual(emailTextField.keyboardType, .emailAddress)
    }
}

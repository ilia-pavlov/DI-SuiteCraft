//
//  SignupFormModelValidatorTests.swift
//  DI-SuiteCraftTests
//
//  Created by Ilia Pavlov on 8/1/23.
//

import XCTest
@testable import DI_SuiteCraft

final class SignupFormModelValidatorTests: XCTestCase {

    var sut: SignupFormModelValidator!
    
    override func setUpWithError() throws {
        sut = SignupFormModelValidator()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    // MARK: - FirstName Tests
    func testValidFirstName() {
        let isFirstNameValid = sut.isFirstNameValid(firstName: "John")
        XCTAssertTrue(isFirstNameValid, "The isFirstNameValid should return TRUE")
    }
    
    func testInValidFirstName() {
        let isFirstNameValid = sut.isFirstNameValid(firstName: "J")
        XCTAssertFalse(isFirstNameValid, "The isFirstNameValid should return False")
    }
    
    func testFirstNameTooLong() {
        let isFirstNameValid = sut.isFirstNameValid(firstName: "JohnJohn")
        XCTAssertFalse(isFirstNameValid, "The isFirstNameValid should return False")
    }
    
    // MARK: - LastName Tests
    func testValidLastName() {
        let isLastNameValid = sut.isLastNameValid(lastName: "Bob")
        XCTAssertTrue(isLastNameValid, "The isLastNameValid should return TRUE")
    }
    
    func testInValidLastName() {
        let isLastNameValid = sut.isLastNameValid(lastName: "Bo")
        XCTAssertFalse(isLastNameValid, "The isLastNameValid should return False")
    }
    
    func testLastNameTooLong() {
        let isLastNameValid = sut.isLastNameValid(lastName: "BlaBlaBlaBla")
        XCTAssertFalse(isLastNameValid, "The isLastNameValid should return False")
    }
    
    // MARK: - Email
    func testValidEmail() {
        let isEmailValid = sut.isValidEmail(email: "test+123@test.com")
        XCTAssertTrue(isEmailValid)
    }
    
    // MARK: - Password Tests
    func testValidPassword() {
        let isPasswordValid = sut.isPasswordValid(password: "1234567")
        XCTAssertTrue(isPasswordValid)
    }
    
    func testInValidPassword() {
        let isPasswordValid = sut.isPasswordValid(password: "12345672840129401206105")
        XCTAssertFalse(isPasswordValid)
    }
    
    func testInputPasswordMatch() {
        let isPasswordValid = sut.doPasswordMatch(password: "1234567", repeatPassword: "1234567")
        XCTAssertTrue(isPasswordValid)
    }
}

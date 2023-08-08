//
//  MockSignupViewDelegate.swift
//  DI-SuiteCraftTests
//
//  Created by Ilia Pavlov on 8/7/23.
//

import XCTest
@testable import DI_SuiteCraft

class MockSignupViewDelegate: SignupViewDelegateProtocol {
    var expectation: XCTestExpectation?
    var signupCalledTimes = 0
    var errorHandlerCalledTimes = 0
    var signupError: SignupError?
    
    func successfulSignup() {
        signupCalledTimes += 1
        expectation?.fulfill()
    }
    
    func errorHandler(error: SignupError) {
        signupError = error
        errorHandlerCalledTimes += 1
        expectation?.fulfill()
    }
}

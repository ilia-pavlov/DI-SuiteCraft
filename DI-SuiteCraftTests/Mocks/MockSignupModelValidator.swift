//
//  MockSignupModelValidator.swift
//  DI-SuiteCraftTests
//
//  Created by Ilia Pavlov on 8/3/23.
//

import Foundation
@testable import DI_SuiteCraft

class MockSignupModelValidator: SignupFormModelValidatorProtocol {
    var isFirstNameValidated: Bool = false
    var isLastNameValidated: Bool = false
    var isEmailValidated: Bool = false
    var isPasswordValidated: Bool = false
    var isPasswordMatchValidated: Bool = false
    
    func isFirstNameValid(firstName: String) -> Bool {
        isFirstNameValidated = true
        return isFirstNameValidated
    }
    
    func isLastNameValid(lastName: String) -> Bool {
        isLastNameValidated = true
        return isLastNameValidated
    }
    
    func isValidEmail(email: String) -> Bool {
        isEmailValidated = true
        return isEmailValidated
        
    }
    
    func isPasswordValid(password: String) -> Bool {
        isPasswordValidated = true
        return isPasswordValidated
        
    }
    
    func doPasswordMatch(password: String, repeatPassword: String) -> Bool {
        isPasswordMatchValidated = true
        return isPasswordMatchValidated
    }
}

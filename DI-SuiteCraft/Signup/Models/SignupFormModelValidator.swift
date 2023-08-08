//
//  SignupFormModelValidator.swift
//  DI-SuiteCraft
//
//  Created by Ilia Pavlov on 8/1/23.
//

import Foundation

class SignupFormModelValidator: SignupModelValidatorProtocol {
    func isFirstNameValid(firstName: String) -> Bool {
        var returnValue = true
        
        if firstName.count < SignupConstants.firstNameMinChars ||
            firstName.count > SignupConstants.firstNameMaxChars {
            returnValue = false
        }
        return returnValue
    }
    
    func isLastNameValid(lastName: String) -> Bool {
        var returnValue = true
        
        if lastName.count < SignupConstants.lastNameMinChars ||
            lastName.count > SignupConstants.lastNameMaxChars {
            returnValue = false
        }
        return returnValue
    }
    
    func isValidEmail(email: String) -> Bool {
        let emailRegex = "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
    
    func isPasswordValid(password: String) -> Bool {
        var returnValue = true
        
        if password.count < SignupConstants.passwordMinChars ||
            password.count > SignupConstants.passwordMaxChars {
            returnValue = false
        }
        return returnValue
    }
    
    func doPasswordMatch(password: String, repeatPassword: String) -> Bool {
        return password == repeatPassword
    }
}

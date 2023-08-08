//
//  SignupModelValidatorProtocol.swift
//  DI-SuiteCraft
//
//  Created by Ilia Pavlov on 8/3/23.
//

import Foundation

protocol SignupModelValidatorProtocol {
    func isFirstNameValid(firstName: String) -> Bool
    
    func isLastNameValid(lastName: String) -> Bool
    
    func isValidEmail(email: String) -> Bool
    
    func isPasswordValid(password: String) -> Bool
    
    func doPasswordMatch(password: String, repeatPassword: String) -> Bool
}

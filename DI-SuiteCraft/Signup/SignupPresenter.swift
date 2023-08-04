//
//  SignupPresenter.swift
//  DI-SuiteCraft
//
//  Created by Ilia Pavlov on 8/3/23.
//

import Foundation

class SignupPresenter {
    private var fromModelValidator: SignupModelValidatorProtocol
    
    init(fromModelValidator: SignupModelValidatorProtocol) {
        self.fromModelValidator = fromModelValidator
    }
    
    func processUserSignup(formModel: SignupFormModel) {
        
        if !fromModelValidator.isFirstNameValid(firstName: formModel.firstName) {
            return
        }
        
        if !fromModelValidator.isLastNameValid(lastName: formModel.lastName) {
            return
        }
        
        if !fromModelValidator.isValidEmail(email: formModel.email) {
            return
        }
        
        if !fromModelValidator.isPasswordValid(password: formModel.password) {
            return
        }
        
        if !fromModelValidator.doPasswordMatch(password: formModel.password,
                                               repeatPassword: formModel.repeatPassword) {
            return
        }
    }
}

//
//  SignupPresenterProtocol.swift
//  DI-SuiteCraft
//
//  Created by Ilia Pavlov on 8/8/23.
//

import Foundation

protocol SignupPresenterProtocol: AnyObject {
    init(formModelValidator: SignupFormModelValidatorProtocol,
         webService: SignupWebServiceProtocol,
         delegate: SignupViewDelegateProtocol)
    
    func processUserSignup(formModel: SignupFormModel)
}

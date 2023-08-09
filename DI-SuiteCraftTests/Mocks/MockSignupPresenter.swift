//
//  MockSignupPresenter.swift
//  DI-SuiteCraftTests
//
//  Created by Ilia Pavlov on 8/8/23.
//

import Foundation
@testable import DI_SuiteCraft

class MockSignupPresenter: SignupPresenterProtocol {
    var processUserSignupCalled: Bool = false
    
    required init(formModelValidator: DI_SuiteCraft.SignupModelValidatorProtocol,
                  webService: DI_SuiteCraft.SignupWebServiceProtocol,
                  delegate: DI_SuiteCraft.SignupViewDelegateProtocol) {
        // TODO:
    }
    
    func processUserSignup(formModel: DI_SuiteCraft.SignupFormModel) {
        processUserSignupCalled = true
    }
}

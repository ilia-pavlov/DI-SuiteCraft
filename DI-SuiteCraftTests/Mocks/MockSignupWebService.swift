//
//  MockSignupWebService.swift
//  DI-SuiteCraftTests
//
//  Created by Ilia Pavlov on 8/7/23.
//

import Foundation
@testable import DI_SuiteCraft

class MockSignupWebService: SignupWebServiceProtocol {
    var isSignupMethodCalled: Bool = false
    var shouldReturnError: Bool = false
    
    func signup(withForm fromModel: DI_SuiteCraft.SignupFormRequestModel, completionHandler: @escaping (DI_SuiteCraft.SignupResponseModel?, DI_SuiteCraft.SignupError?) -> Void) {
        
        isSignupMethodCalled = true
        
        if shouldReturnError {
            completionHandler(nil, SignupError.failedRequest(description: "Signup request was not successful"))
        } else {
            let responseModel = SignupResponseModel(status: "Ok")
            completionHandler(responseModel, nil)
        }
    }
}

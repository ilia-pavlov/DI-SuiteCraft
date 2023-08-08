//
//  SignupWebServiceProtocol.swift
//  DI-SuiteCraft
//
//  Created by Ilia Pavlov on 8/7/23.
//

import Foundation

protocol SignupWebServiceProtocol {
    func signup(withForm fromModel: SignupFormRequestModel,
                completionHandler: @escaping (SignupResponseModel?, SignupError?) -> Void)
}

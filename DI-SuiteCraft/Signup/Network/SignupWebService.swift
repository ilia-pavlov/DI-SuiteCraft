//
//  SignupWebService.swift
//  DI-SuiteCraft
//
//  Created by Ilia Pavlov on 8/1/23.
//

import Foundation

class SignupWebService {
    
    private var urlSession: URLSession
    private var urlString: String
    
    init(urlSession: URLSession = .shared, urlString: String) {
        self.urlSession = urlSession
        self.urlString = urlString
    }
    
    func signup(withForm fromModel: SignupFormRequestModel,
                completionHandler: @escaping (SignupResponseModel?, SignupError?) -> Void) {
        
    }
}

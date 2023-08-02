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
        
        guard let url = URL(string: urlString) else {
            completionHandler(nil, SignupError.invalidRequestURL)
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
        request.httpBody = try? JSONEncoder().encode(fromModel)
        
        let dataTask = urlSession.dataTask(with: request) { data, response, error in
            
            if let requestError = error {
                completionHandler(nil,
                                  SignupError.failedRequest(description: requestError.localizedDescription))
                return
            }
            
            if let safeData = data,
               let signupResponseModel = try? JSONDecoder().decode(SignupResponseModel.self,
                                                                   from: safeData) {
                completionHandler(signupResponseModel, nil)
            } else {
                completionHandler(nil, SignupError.invalidResponseModel)
            }
        }
        dataTask.resume()
    }
}

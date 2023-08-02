//
//  SignupError.swift
//  DI-SuiteCraft
//
//  Created by Ilia Pavlov on 8/1/23.
//

import Foundation

enum SignupError: LocalizedError, Equatable, Error {
    case invalidResponseModel
    case invalidRequestURL
    case failedRequest(description: String)
    
    var errorDescription: String? {
        switch self {
        case .failedRequest(let description):
            return description
        case .invalidResponseModel, .invalidRequestURL:
            return ""
        }
    }
}

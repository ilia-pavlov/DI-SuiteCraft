//
//  SignupConstants.swift
//  DI-SuiteCraft
//
//  Created by Ilia Pavlov on 8/1/23.
//

import Foundation

struct SignupConstants {
    static let firstNameMinChars = 2
    static let firstNameMaxChars = 7
    
    static let lastNameMinChars = 3
    static let lastNameMaxChars = 8
    
    static let passwordMinChars = 6
    static let passwordMaxChars = 11
}

enum SignupUrl {
    case signupURLString
    
    var value: String {
        switch self {
        case .signupURLString:
            return "https://blabla.com"
        }
    }
}

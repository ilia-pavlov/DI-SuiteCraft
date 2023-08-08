//
//  SignupViewDelegateProtocol.swift
//  DI-SuiteCraft
//
//  Created by Ilia Pavlov on 8/7/23.
//

import Foundation

protocol SignupViewDelegateProtocol: AnyObject {
    func successfulSignup()
    func errorHandler(error: SignupError)
}

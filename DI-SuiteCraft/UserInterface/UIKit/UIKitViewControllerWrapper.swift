//
//  UIKitViewControllerWrapper.swift
//  DI-SuiteCraft
//
//  Created by Ilia Pavlov on 8/15/23.
//

import SwiftUI
import UIKit

struct UIKitViewControllerWrapper: UIViewControllerRepresentable {
    typealias UIViewControllerType = CreateAccountVC
    
    func makeUIViewController(context: Context) -> CreateAccountVC {
        let storyboard = UIStoryboard(name: "CreateAccount", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "CreateAccountVC") as! CreateAccountVC
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: CreateAccountVC, context: Context) {
        // don't need
    }
    

    
    
}

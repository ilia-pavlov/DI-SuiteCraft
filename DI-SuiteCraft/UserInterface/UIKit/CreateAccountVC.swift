//
//  CreateAccountVC.swift
//  DI-SuiteCraft
//
//  Created by Ilia Pavlov on 8/15/23.
//

import UIKit

class CreateAccountVC: UIViewController {

    @IBOutlet weak var signupTitle: UILabel!
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!

    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var repeatPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

//
//  SignupViewController.swift
//  DI-SuiteCraft
//
//  Created by Ilia Pavlov on 8/8/23.
//

import UIKit

class SignupVC: UIViewController {

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var repeatPasswordTextField: UITextField!
    @IBOutlet weak var signupButton: UIButton!
    
    var signupPresenter: SignupPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if signupPresenter == nil {
            let signupModelValidator = SignupFormModelValidator()
            let webservice = SignupWebService(urlString: SignupUrl.signupURLString.value)
            signupPresenter = SignupPresenter(formModelValidator: signupModelValidator,
                                              webService: webservice,
                                              delegate: self)
        }
    }

    @IBAction func signupButtonTapped(_ sender: Any) {
        let signupFormModel = SignupFormModel(firstName: firstNameTextField.text ?? "",
                                              lastName: lastNameTextField.text ?? "",
                                              email: emailTextField.text ?? "",
                                              password: passwordTextField.text ?? "",
                                              repeatPassword: repeatPasswordTextField.text ?? "")
        
        signupPresenter?.processUserSignup(formModel: signupFormModel)
    }
}

extension SignupVC: SignupViewDelegateProtocol {
    func successfulSignup() {
        // TODO:
    }
    
    func errorHandler(error: SignupError) {
        // TODO:
    }
    
    
}

//
//  ViewController.swift
//  Bankey
//
//  Created by Jamie Vullo on 1/18/24.
//

import UIKit

class LoginViewController: UIViewController {
    
    var loginView = LoginView()
    let signInButton = UIButton(type: .system)
    let errorMessageLabel = UILabel()
    
    var userName: String? {
        return loginView.usernameTextField.text
    }
    
    var password: String? {
        return loginView.passwordTextField.text
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
}

extension LoginViewController {
    private func style() {
        loginView.translatesAutoresizingMaskIntoConstraints = false
        
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.configuration = .filled()
        signInButton.configuration?.imagePadding = 8
        signInButton.setTitle("Sign In", for: [])
        signInButton.addTarget(self, action: #selector(signInTapped), for: .primaryActionTriggered)
        
        errorMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        errorMessageLabel.textAlignment = .center
        errorMessageLabel.textColor = .systemRed
        errorMessageLabel.numberOfLines = 0
        errorMessageLabel.isHidden = true
    }
    
    private func layout() {
        view.addSubview(loginView)
        view.addSubview(signInButton)
        view.addSubview(errorMessageLabel)
        
        //Login View
        NSLayoutConstraint.activate([
            loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 1),
        ])
        
        //Sign In Button
        NSLayoutConstraint.activate([
            signInButton.topAnchor.constraint(equalToSystemSpacingBelow: loginView.bottomAnchor, multiplier: 2),
            signInButton.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            signInButton.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
        ])
        
        //Error Label
        NSLayoutConstraint.activate([
            errorMessageLabel.topAnchor.constraint(equalToSystemSpacingBelow: signInButton.bottomAnchor, multiplier: 2),
            errorMessageLabel.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            errorMessageLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
        ])
    }
}
//MARK: Actions

extension LoginViewController {
    @objc func signInTapped(sender: UIButton) {
        errorMessageLabel.isHidden = true
        login()
        
    }
    
    private func login() {
        guard let userName = userName, let password = password else {
            return
        }
        
        if userName.isEmpty || password.isEmpty {
            configureView(withMessage: "Username or Password cannot be blank")
            return
        }
        
        if userName == "Jamie" || password == "Welcome" {
            signInButton.configuration?.showsActivityIndicator = true
        } else {
            configureView(withMessage: "Incorrect Username or Password")
        }
    }
    
    private func configureView(withMessage message: String) {
        errorMessageLabel.isHidden = false
        errorMessageLabel.text = message
    }
}


//import UIKit
//
//class ViewController: UIViewController, UITextFieldDelegate {
//
//    let textField = UITextField()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Set up the text field
//        textField.frame = CGRect(x: 50, y: 100, width: 200, height: 30)
//        textField.borderStyle = .roundedRect
//        textField.delegate = self
//        view.addSubview(textField)
//    }
//
//    // MARK: - UITextFieldDelegate
//
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        // This method is called when the return key is pressed
//
//        // You can perform any action you want here
//        // For example, you can dismiss the keyboard
//        textField.resignFirstResponder()
//
//        return true
//    }
//}
//1. The UITextFieldDelegate is adopted by the ViewController.
//2. The textField is created and added to the view.
//3. The textField.delegate is set to self (the view controller), indicating that the view controller will handle the delegate methods of the text field.
//4. The textFieldShouldReturn method is implemented, which is called when the return key is pressed. Inside this method, you can perform any action you want, such as dismissing the keyboard.
//5. By resigning the first responder status (textField.resignFirstResponder()), you effectively dismiss the keyboard when the user presses the Enter key.

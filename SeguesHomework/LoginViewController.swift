//
//  LoginViewController.swift
//  SeguesHomework
//
//  Created by Илья Тюрин on 30.03.2021.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var loginTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    @IBOutlet weak var logInBtnOutlet: UIButton!
    @IBOutlet weak var forgotUserName: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        setRadius(for: logInBtnOutlet)
        setRadius(for: loginTF)
        setRadius(for: passwordTF)
    }
    
    // Подумать
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
        welcomeVC.userName = loginTF.text
    }
    
    @IBAction func logInButton() {
        if loginTF.text != "Alex" || passwordTF.text != "qwerty" {
            alert(title: "Wow!", message: "It looks like your credentials are incorrect!")
        }
    }
    
    @IBAction func unwindToLogin(for segue: UIStoryboardSegue) {
        loginTF.text = ""
        passwordTF.text = ""
    }
    
    @IBAction func forgotButtons(_ sender: UIButton) {
        sender == forgotUserName ?
            alert(title: "Forgot?", message: "Your login is Alex!") :
            alert(title: "Forgot?", message: "Your password is qwerty!")
    }
    
}

// MARK: - Private Methods
extension LoginViewController {
    
    private func alert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default) { _ in
            self.loginTF.text = ""
            self.passwordTF.text = ""
        }
        
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    private func setRadius(for outlet: UIView) {
        outlet.layer.cornerRadius = outlet.frame.height / 2
        
        if outlet is UITextField {
            outlet.layer.masksToBounds = true
        }
    }
}

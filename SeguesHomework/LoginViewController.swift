//
//  LoginViewController.swift
//  SeguesHomework
//
//  Created by Илья Тюрин on 30.03.2021.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var loginTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    @IBOutlet weak var logInBtnOutlet: UIButton!
    @IBOutlet weak var forgotUserName: UIButton!
    @IBOutlet weak var forgotPassword: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addAppearance(for: logInBtnOutlet)
        addAppearance(for: loginTF)
        addAppearance(for: passwordTF)
        addAppearance(for: forgotUserName)
        addAppearance(for: forgotPassword)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
        welcomeVC.userName = loginTF.text
    }
    
    @IBAction func logInButton() {
        if loginTF.text == "Alex" && passwordTF.text == "qwerty" {
            performSegue(withIdentifier: "toWelcomeScreen", sender: nil)
        } else {
            alert(title: "Wow!", message: "It looks like your credentials are incorrect😾")
            anim(for: loginTF)
            anim(for: passwordTF)
        }
    }
    
    @IBAction func forgotButtons(_ sender: UIButton) {
        sender == forgotUserName ?
            alert(title: "Forgot?", message: "Your login is Alex!") :
            alert(title: "Forgot?", message: "Your password is qwerty!")
    }
    
    @IBAction func unwindToLogin(for segue: UIStoryboardSegue) {
        loginTF.text = ""
        passwordTF.text = ""
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case loginTF: passwordTF.becomeFirstResponder()
        default: logInButton()
        }
        return true
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
    
    private func addAppearance(for outlet: UIView) {
        outlet.layer.cornerRadius = outlet.frame.height / 2
        outlet.layer.shadowOpacity = 0.25
        outlet.layer.shadowOffset = CGSize(width: 7, height: 10)
        outlet.layer.shadowColor = UIColor.black.cgColor
        outlet.layer.shadowRadius = 5.0
    }
    
    func anim(for outlet: UIView) {
        let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        animation.duration = 0.6
        animation.values = [-20.0, 20.0, -20.0, 20.0, -10.0, 10.0, -5.0, 5.0, 0.0 ]
        outlet.layer.add(animation, forKey: "shake")
    }
}

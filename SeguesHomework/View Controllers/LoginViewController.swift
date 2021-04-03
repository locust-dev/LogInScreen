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
    
    @IBOutlet weak var registrBtnOutlet: UIButton!
    @IBOutlet weak var logInBtnOutlet: UIButton!
    @IBOutlet var forgoteButtons: [UIButton]!
    
    // Default user is Admin (Ilya Turin)
    private var currentUser = allUsers.users[0]
    
    // MARK: - Overrided Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addAppearance(for: logInBtnOutlet)
        addAppearance(for: loginTF)
        addAppearance(for: passwordTF)
        addAppearance(for: forgoteButtons[0])
        addAppearance(for: forgoteButtons[1])
        addAppearance(for: registrBtnOutlet)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabBarVC = segue.destination as? UITabBarController else { return }
        guard let viewControllers = tabBarVC.viewControllers else { return }
        
        for viewController in viewControllers {
            if let welcomeVC = viewController as? WelcomeViewController {
                welcomeVC.userName = "\(currentUser.name) \(currentUser.surname)"
            } else if let navigationVC = viewController as? UINavigationController {
                _ = navigationVC.topViewController as! AboutUserViewController
                
            }
        }
    }
    
    // MARK: - IBActions
    @IBAction func logInButton() {
        
        if loginTF.text == "" || passwordTF.text == "" {
            alert(title: "Error!", message: "Please, enter your login and password!")
            addAnimationShake(for: loginTF)
            addAnimationShake(for: passwordTF)
        } else if searchUser(by: loginTF, and: passwordTF, in: allUsers) {
            performSegue(withIdentifier: "toWelcomeScreen", sender: nil)
        } else {
            alert(title: "Wow!", message: "It looks like your credentials are incorrect😾")
            addAnimationShake(for: loginTF)
            addAnimationShake(for: passwordTF)
        }
    }
    
    @IBAction func forgotButtons(_ sender: UIButton) {
        sender.tag == 0
            ? alert(title: "Forgot?", message: "Your login is \(currentUser.login)!")
            : alert(title: "Forgot?", message: "Your password is \(currentUser.password)!")
    }
    
    @IBAction func unwindToLogin(for segue: UIStoryboardSegue) {
        loginTF.text = nil
        passwordTF.text = nil
    }
    
    // MARK: - Public Functions
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == loginTF {
            passwordTF.becomeFirstResponder()
        } else {
            logInButton()
        }
        return true
    }
    
}

// MARK: - Private Methods
extension LoginViewController {
    
    private func alert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default) { _ in
            self.passwordTF.text = ""
        }
        
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    private func searchUser(by login: UITextField, and password: UITextField, in allUsers: Users) -> Bool {
        var result = false
        
        for user in allUsers.users {
            if user.login == loginTF.text, user.password == passwordTF.text {
                currentUser = user
                performSegue(withIdentifier: "toWelcomeScreen", sender: nil)
                result = true
                break
            }
        }
        return result
    }
    
    
}

// MARK: - Appearance Methods
extension LoginViewController {
    
    private func addAppearance(for outlet: UIView) {
        outlet.layer.cornerRadius = outlet.frame.height / 2
        outlet.layer.shadowOpacity = 0.25
        outlet.layer.shadowOffset = CGSize(width: 7, height: 10)
        outlet.layer.shadowColor = UIColor.black.cgColor
        outlet.layer.shadowRadius = 5.0
    }
    
    private func addAnimationShake(for outlet: UIView) {
        let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        animation.duration = 0.6
        animation.values = [-20.0, 20.0, -20.0, 20.0, -10.0, 10.0, -5.0, 5.0, 0.0 ]
        outlet.layer.add(animation, forKey: "shake")
    }
}

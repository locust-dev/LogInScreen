//
//  RegistrationViewController.swift
//  SeguesHomework
//
//  Created by Илья Тюрин on 02.04.2021.
//

import UIKit

class RegistrationViewController: UIViewController {
    
    @IBOutlet weak var aboutTF: UITextField!
    @IBOutlet weak var hobbiesTF: UITextField!
    @IBOutlet var requiredTF: [UITextField]!
    
    @IBOutlet var attributesLabels: [UILabel]!
    
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var cancelBtnOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        placeHolder(for: requiredTF, "required", .lightGray)
        placeHolder(for: [aboutTF,hobbiesTF], "optional", .lightGray)
        
        addAppearanceFor([aboutTF,
                          hobbiesTF,
                          registerButton,
                          cancelBtnOutlet],
                          attributesLabels,
                          requiredTF)
        
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    @IBAction func registerPressed() {
        if textFieldIsEmpty(for: requiredTF) {
            alert(title: "👊🏻", message: "All fields excepted About must be filled in!")
        } else if loginAlreadyRegistred(requiredTF[2], allUsers) {
            alert(title: "Oops", message: "This login is already registred!")
        } else {
            appendNewUserTo(allUsers, exit: true)
        }
    }
    
    @IBAction func cancelButton(_ sender: Any) {
        dismiss(animated: true)
    }
    
}

// MARK: - Private methods
extension RegistrationViewController {
    
    private func alert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    private func textFieldIsEmpty(for collection: [UITextField]) -> Bool {
        var result = false
        
        for textField in collection {
            if textField.text == "" {
                result = true
                break
            }
        }
        return result
    }
    
    private func appendNewUserTo(_ stackOfUsers: Users, exit: Bool) {
        
      
        
        let user = User(name: requiredTF[0].text!,
                        surname: requiredTF[1].text!,
                        login: requiredTF[2].text!,
                        password: requiredTF[3].text!,
                        aboutUser: aboutTF.text ?? "",
                        hobbies: hobbiesTF.text ?? "",
                        photo: "DefaultAvatar")
        stackOfUsers.users.append(user)
        
        if exit {
            dismiss(animated: true)
        }
    }
    
    private func loginAlreadyRegistred(_ from: UITextField, _ allUsers: Users) -> Bool {
        var isRegistred = false
        
        for user in allUsers.users {
            if from.text == user.login {
                isRegistred = true
                break
            }
        }
        return isRegistred
    }
}

// MARK: - Appearance Methods
extension RegistrationViewController {
    
    private func addAppearanceFor(_ collections: [UIView]...) {
        collections.forEach { collection in
            collection.forEach { outlet in
                outlet.layer.cornerRadius = outlet.frame.height / 2
                outlet.layer.shadowOpacity = 0.25
                outlet.layer.shadowOffset = CGSize(width: 7, height: 10)
                outlet.layer.shadowColor = UIColor.black.cgColor
                outlet.layer.shadowRadius = 5.0
            }
        }
    }
    
    private func placeHolder(for textfields: [UITextField], _ title: String, _ color: UIColor) {
        textfields.forEach { textField in
            textField.attributedPlaceholder = NSAttributedString(string: title, attributes: [NSAttributedString.Key.foregroundColor: color])
        }
    }
    
}


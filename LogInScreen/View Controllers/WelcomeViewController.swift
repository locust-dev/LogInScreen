//
//  WelcomeViewController.swift
//  SeguesHomework
//
//  Created by Илья Тюрин on 30.03.2021.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var logOutButton: UIButton!
    
    var currentUser: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userNameLabel.text = "Welcome, \(currentUser.name) \(currentUser.surname)!"
        logOutButton.layer.cornerRadius = logOutButton.frame.height / 2
    }
}



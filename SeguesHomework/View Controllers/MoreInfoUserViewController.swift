//
//  MoreInfoUserViewController.swift
//  SeguesHomework
//
//  Created by Илья Тюрин on 02.04.2021.
//

import UIKit

class MoreInfoUserViewController: UIViewController {
    
    @IBOutlet weak var hobbies: UILabel!
    
    var currentUser: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.tintColor = .white
        hobbies.text = currentUser.hobbies
    }
    
}

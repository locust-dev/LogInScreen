//
//  UserPhotoViewController.swift
//  SeguesHomework
//
//  Created by Илья Тюрин on 03.04.2021.
//

import UIKit

class UserPhotoViewController: UIViewController {

    @IBOutlet weak var userPhoto: UIImageView!
    
    var currentUser: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        userPhoto.image = UIImage(imageLiteralResourceName: currentUser.photo)
        userPhoto.layer.cornerRadius = 25
        userPhoto.clipsToBounds = true
    }
    


}

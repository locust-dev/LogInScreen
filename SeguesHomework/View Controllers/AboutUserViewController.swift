//
//  AboutUserViewController.swift
//  SeguesHomework
//
//  Created by Илья Тюрин on 02.04.2021.
//

import UIKit

class AboutUserViewController: UIViewController {

    @IBOutlet weak var moreInfo: UIButton!
    @IBOutlet weak var navigationBar: UINavigationItem!
    
    @IBOutlet weak var aboutUser: UILabel!
    
    var currentUser: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
         
        navigationBar.title = "\(currentUser.name) \(currentUser.surname)"
        aboutUser.text = currentUser.aboutUser
        
        moreInfo.layer.cornerRadius = moreInfo.frame.height / 2
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let moreInfoVC = segue.destination as? MoreInfoUserViewController else { return }
        moreInfoVC.currentUser = currentUser
    }
    
}

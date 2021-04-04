//
//  ScrollView.swift
//  SeguesHomework
//
//  Created by Илья Тюрин on 04.04.2021.
//

import UIKit

class Scroll: UIScrollView {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        endEditing(true)
    }
}

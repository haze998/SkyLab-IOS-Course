//
//  CustomMenuBlock.swift
//  Homework 6 Task 4 @eternalhaze
//
//  Created by Evgeniy Docenko on 10.12.2022.
//

import Foundation
import UIKit

class CustomMenuBlock: BaseUI {
    
    @IBOutlet weak var customMenuBlockImageView: UIImageView!
    @IBOutlet weak var customMenuBlockLabel: UILabel!
    @IBOutlet weak var viewForUIImage: UIView!
    @IBOutlet var customMenuBlockView: UIView!
    
    var delegate: MenuBlockDelegate?
    
    func configure(with text: String, image: UIImage, bgColour: UIColor) {
        customMenuBlockLabel.text = text
        customMenuBlockImageView.image = image
        
        viewForUIImage.layer.cornerRadius = viewForUIImage.frame.width / 2
        
        viewForUIImage.backgroundColor = bgColour
        
        customMenuBlockView.layer.cornerRadius = 20
    }
    
    @IBAction func menuButtonPressed(_ sender: Any) {
        delegate?.menuElementPressed(self)
    }
    
}


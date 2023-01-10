//
//  CustomTableViewCell.swift
//  mock JSON
//
//  Created by Evgeniy Docenko on 25.12.2022.
//

import UIKit
import Kingfisher

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var responseImageView: UIImageView!
    @IBOutlet weak var authorNameLabel: UILabel!
    
    func configure(model: ListOfImage) {
        guard let url = URL(string: model.downloadURL!) else { return  }
        self.responseImageView.kf.setImage(with: url)
        self.authorNameLabel.text = model.author
    }
}

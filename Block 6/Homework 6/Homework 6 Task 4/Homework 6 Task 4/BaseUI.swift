//
//  BaseUI.swift
//  Homework 6 Task 4 @eternalhaze
//
//  Created by Evgeniy Docenko on 09.12.2022.
//

import Foundation
import UIKit

class BaseUI : UIView {
    
    private var view: UIView!
    
    required init?(coder aDecoder: NSCoder) {
        super .init(coder: aDecoder)
        commonInit()
    }
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        commonInit()
    }
    
    func commonInit() {
        //        Bundle.main.loadNibNamed("CustomMenuBlock", owner: self)
        view = loadNib()
        addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        view.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        view.topAnchor.constraint(equalTo: topAnchor).isActive = true
        view.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    func loadNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        
        guard let nibName = type(of: self).description().components(separatedBy: ".").last else {
            fatalError("NibName Not Found!")
        }
        
        let nib = UINib(nibName: nibName, bundle: bundle)
        
        guard let nibView = nib.instantiate(withOwner: self, options: nil).first as? UIView else {
            fatalError("View Not Found!")
        }
        
        return nibView
    }
}


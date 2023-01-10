//
//  ViewController.swift
//  Homework 6 Task 4 @eternalhaze
//
//  Created by Evgeniy Docenko on 09.12.2022.
//

import UIKit

class ViewController: UIViewController, MenuBlockDelegate {
    
    @IBOutlet weak var firstMenuBlockView: CustomMenuBlock!
    @IBOutlet weak var secondMenuBlockView: CustomMenuBlock!
    @IBOutlet weak var thirdMenuBlockView: CustomMenuBlock!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstMenuBlockView.layer.cornerRadius = firstMenuBlockView.frame.width / 2
        secondMenuBlockView.layer.cornerRadius = secondMenuBlockView.frame.width / 2
        thirdMenuBlockView.layer.cornerRadius = thirdMenuBlockView.frame.width / 2
        
        firstMenuBlockView.delegate = self
        secondMenuBlockView.delegate = self
        thirdMenuBlockView.delegate = self
        
        firstMenuBlockView.configure(with: "Рассрочка на карту", image: UIImage(named: "chart")!, bgColour: UIColor(cgColor: .init(red: 0.1153752729, green: 0.7123912573, blue: 0.4387946725, alpha: 1)))
        secondMenuBlockView.configure(with: "Покупка частями", image: UIImage(named: "paws")!, bgColour: UIColor(cgColor: .init(red: 0.4880822897, green: 0.3760101199, blue: 0.7192229033, alpha: 1)))
        thirdMenuBlockView.configure(with: "Архив", image: UIImage(named: "checked")!, bgColour: UIColor(cgColor: .init(red: 0.4938592911, green: 0.5951737761, blue: 0.6320812106, alpha: 1)))
    }
    
    func menuElementPressed(_ sender: CustomMenuBlock) {
        print("Menu Item Pressed")
        
        switch sender {
        case firstMenuBlockView:
            print("First block Pressed!")
        case secondMenuBlockView:
            print("Second block Pressed!")
        case thirdMenuBlockView:
            print("Third block Pressed!")
        default:
            print("...")
        }
    }
    
}

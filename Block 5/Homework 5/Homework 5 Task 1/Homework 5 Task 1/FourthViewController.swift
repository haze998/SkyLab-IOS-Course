//
//  FourthViewController.swift
//  Homework 5 Task 1 @eternalhaze
//
//  Created by Evgeniy Docenko on 01.12.2022.
//

import UIKit

class FourthViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
                
        // main view
        let mainRect = CGRect(x: 25, y: 250, width: 350, height: 350)
        let mainView = UIView(frame: mainRect)
        mainView.layer.cornerRadius = mainView.frame.width / 2
        mainView.clipsToBounds = true
        view.addSubview(mainView)
        
        // red circle
        let rect = CGRect(x: -60, y: -20, width: 250, height: 250)
        let firstCircleView = UIView(frame: rect)
        
        firstCircleView.backgroundColor = .red
        
        firstCircleView.layer.cornerRadius = firstCircleView.frame.width / 2
        mainView.addSubview(firstCircleView)
        
        // yellow circle
        let secondRect = CGRect(x: 160, y: -20, width: 250, height: 250)
        let secondCircleView = UIView(frame: secondRect)
        
        secondCircleView.backgroundColor = .systemYellow
        
        secondCircleView.layer.cornerRadius = secondCircleView.frame.width / 2
        mainView.addSubview(secondCircleView)
        
        // green circle
        let thirdRect = CGRect(x: 150, y: 150, width: 250, height: 250)
        let thirdCircleView = UIView(frame: thirdRect)
        
        thirdCircleView.backgroundColor = .systemGreen
        
        thirdCircleView.layer.cornerRadius = thirdCircleView.frame.width / 2
        mainView.addSubview(thirdCircleView)
        
        // blue circle
        let fourthRect = CGRect(x: -50, y: 150, width: 250, height: 250)
        let fourthCircleView = UIView(frame: fourthRect)
        
        fourthCircleView.backgroundColor = .systemBlue
        
        fourthCircleView.layer.cornerRadius = fourthCircleView.frame.width / 2
        mainView.addSubview(fourthCircleView)
        
    }
}

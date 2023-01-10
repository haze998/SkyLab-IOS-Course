

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
                
        // first circle
        let rect = CGRect(x: 75, y: 60, width: 250, height: 250)
        let firstCircleView = UIView(frame: rect)
        
        firstCircleView.backgroundColor = .red
        
        firstCircleView.layer.cornerRadius = firstCircleView.frame.width / 2
        view.addSubview(firstCircleView)
        
        // second circle
        let secondRect = CGRect(x: 75, y: 320, width: 250, height: 250)
        let secondCircleView = UIView(frame: secondRect)
        
        secondCircleView.backgroundColor = .yellow
        
        secondCircleView.layer.cornerRadius = secondCircleView.frame.width / 2
        view.addSubview(secondCircleView)
        
        // third circle
        let thirdRect = CGRect(x: 75, y: 580, width: 250, height: 250)
        let thirdCircleView = UIView(frame: thirdRect)
        
        thirdCircleView.backgroundColor = .systemGreen
        
        thirdCircleView.layer.cornerRadius = thirdCircleView.frame.width / 2
        view.addSubview(thirdCircleView)

    }
}

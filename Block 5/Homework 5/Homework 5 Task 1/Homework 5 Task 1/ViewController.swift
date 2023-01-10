
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
                
        let rect = CGRect(x: 75, y: 250, width: 250, height: 250)
        let myView = UIView(frame: rect)
        
        myView.backgroundColor = .systemGreen
    
        myView.layer.cornerRadius = myView.frame.width / 2
        view.addSubview(myView)
    }


}


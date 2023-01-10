import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var ballView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ballView.layer.cornerRadius = ballView.frame.width / 2
    }
    
    @IBAction func bounceButtonPressed(_ sender: UIButton) {
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 4, initialSpringVelocity: 5, options: [.autoreverse, .repeat]) {
            self.ballView.center.y -= 250
        }
    }
    
}


import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var myCircleView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.myCircleView.frame = CGRect(x: 0, y: 59, width: 50, height: 50)
        self.myCircleView.layer.cornerRadius = myCircleView.frame.width / 2
    }
    
    @IBAction func runButtonPressed(_ sender: UIButton) {
        UIView.animate(withDuration: 2, delay: 0) {
            self.myCircleView.center.x += 343
        } completion: { _ in
            UIView.animate(withDuration: 2, delay: 0) {
                self.myCircleView.center.y += 719
            } completion: { _ in
                UIView.animate(withDuration: 2, delay: 0) {
                    self.myCircleView.center.x -= 343
                } completion: { _ in
                    UIView.animate(withDuration: 2, delay: 0) {
                        self.myCircleView.center.y -= 719
                    } completion: { _ in
                        self.myCircleView.removeFromSuperview()
                    }
                }
            }
        }
    }
}




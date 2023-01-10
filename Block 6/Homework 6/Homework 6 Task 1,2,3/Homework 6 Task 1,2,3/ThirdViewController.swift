
import UIKit
import Lottie

class ThirdViewController: UIViewController {

    @IBOutlet weak var appleAnimationView: LottieAnimationView!
    
    @IBOutlet weak var likeAnimationView: LottieAnimationView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func startAnimationPressed(_ sender: UIButton) {
        // first Lottie animation
        appleAnimationView.loopMode = .loop
        appleAnimationView.play()
        
        // second Lottie animation
        likeAnimationView.loopMode = .loop
        likeAnimationView.play()
        
    }
}

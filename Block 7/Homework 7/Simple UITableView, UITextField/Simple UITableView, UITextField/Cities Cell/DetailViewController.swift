
import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var botLabel: UILabel!
    
    var defaultValueForTopLabel = "no value"
    var defaultValueForBotLabel = "no value"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        topLabel.text = defaultValueForTopLabel
        botLabel.text = defaultValueForBotLabel
    }
}

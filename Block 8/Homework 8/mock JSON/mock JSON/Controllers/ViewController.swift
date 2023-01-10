import UIKit
import Alamofire

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            let nib = UINib(nibName: "CustomTableViewCell", bundle: nil)
            tableView.register(nib, forCellReuseIdentifier: "CustomTableViewCell")
        }
    }
    
    var arrayOfModelData: [ListOfImage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        let urlWithImages = "https://picsum.photos/v2/list?page=2&limit=100"
        let request = AF.request(urlWithImages, method: .get)
        request.responseDecodable(of: [ListOfImage].self) { response in
            do {
                self.arrayOfModelData = try response.result.get()
                self.tableView.reloadData()
                
            } catch {
                print(error)
            }
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arrayOfModelData.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell") as? CustomTableViewCell else { return UITableViewCell() }
        cell.configure(model: arrayOfModelData[indexPath.row])
        return cell
    }
}


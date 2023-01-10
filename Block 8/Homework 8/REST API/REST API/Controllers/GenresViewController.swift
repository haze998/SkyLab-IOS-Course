import UIKit
import Alamofire

class GenresViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var arrayOfGenres: [Genre] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Genres
        let urlGenres = "https://api.themoviedb.org/3/genre/movie/list?api_key=aef19f83a7261debd6b9b8edfd7919ce&language=en-US"
        let request = AF.request(urlGenres, method: .get)
        request.responseDecodable(of: Genres.self) { response in
            do {
                self.arrayOfGenres = try response.result.get().genres ?? []
                self.tableView.reloadData()
            } catch {
                print(error)
            }
        }
    }
}

extension GenresViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arrayOfGenres.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = arrayOfGenres[indexPath.row].name
        return cell
    }
    
    
}

//
//  ViewController.swift
//  REST API
//
//  Created by Evgeniy Docenko on 24.12.2022.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var arrayOfMovies: [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Trends
        let urlTrends = "https://api.themoviedb.org/3/trending/movie/week?api_key=aef19f83a7261debd6b9b8edfd7919ce"
        let request = AF.request(urlTrends, method: .get)
        request.responseDecodable(of: TrendsOfWeek.self) { response in
            do {
                self.arrayOfMovies = try response.result.get().results ?? []
                self.tableView.reloadData()
            } catch {
                print(error)
            }
        }
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arrayOfMovies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = arrayOfMovies[indexPath.row].originalTitle
        return cell
    }
}


//
//  TrendMoviesViewController.swift
//  Data saving (Realm)
//
//  Created by Evgeniy Docenko on 05.01.2023.
//

import UIKit
import Alamofire
import RealmSwift

class TrendMoviesViewController: UIViewController {
    
    var arrayOfMovies: [Movie] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    private let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlTrends = "https://api.themoviedb.org/3/trending/movie/week?api_key=aef19f83a7261debd6b9b8edfd7919ce"
        let request = AF.request(urlTrends, method: .get)
        request.responseDecodable(of: TrendsOfWeek.self) { response in
            do {
                self.arrayOfMovies = try! response.result.get().results ?? []
                self.tableView.reloadData()
            } catch {
                print(error)
            }
        }
    }
    
    private func saveMovie(media: Movie?) {
        let movieRealm = MovieRealm()
        movieRealm.adult = media?.adult ?? false
        movieRealm.backdropPath = media?.backdropPath ?? ""
        movieRealm.id = media?.id ?? 0
        movieRealm.title = media?.title ?? ""
        movieRealm.mediaType = media?.mediaType?.rawValue ?? ""
        movieRealm.popularity = media?.popularity ?? 0.0
        movieRealm.releaseDate = media?.releaseDate ?? ""
        movieRealm.video = media?.video ?? false
        movieRealm.voteAverage = media?.voteAverage ?? 0.0
        movieRealm.voteCount = media?.voteCount ?? 0
        
        try! realm.write {
            realm.add(movieRealm, update: .all)
        }
    }
}

extension TrendMoviesViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arrayOfMovies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = arrayOfMovies[indexPath.row].title
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {}
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let saveAction = UIContextualAction(style: .normal, title: "save") { [weak self] _, _, completion in
            self?.saveMovie(media: (self?.arrayOfMovies[indexPath.row]))
            completion(true)
        }
        saveAction.backgroundColor = .green
        return UISwipeActionsConfiguration(actions: [saveAction])
    }
}

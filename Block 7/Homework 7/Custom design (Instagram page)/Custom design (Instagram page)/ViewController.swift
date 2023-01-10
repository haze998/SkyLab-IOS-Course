/* 3. Створіть другий екран – копію стрічки Instagram. Для цього нам потрібно буде подбати про дані, це буде масив із 3-ма екземплярами структури Post, який включає:
 ● avatarImageName: String
 ● postImageName: String
 ● viewsCount: Int
 ● description: String
 ● countOfComments: Int
 ● postedAt: String
 На дизайні також є іконки - трійка зверху праворуч, серце, знак коментаря, паперовий літачок, знак закладки. */

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var arrayOfPosts: [Post] = [firstPost, secondPost, thirdPost]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let nib = UINib(nibName: "PostTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "PostTableViewCell")
        
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arrayOfPosts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PostTableViewCell") as? PostTableViewCell else { return UITableViewCell() }
        cell.configure(with: arrayOfPosts[indexPath.row])
        return cell
    }
    
}

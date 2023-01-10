//
//  ViewController.swift
//  Data saving (User Defaults)
//
//  Created by Evgeniy Docenko on 05.01.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func addButtonPressed(_ sender: Any) {
        let alertController = UIAlertController(title: "Add purchase", message: nil, preferredStyle: .alert)
        alertController.addTextField { textField in
            textField.placeholder = "Add something..."
        }
        let cancelAlert = UIAlertAction(title: "Cancel", style: .destructive)
        let okAlert = UIAlertAction(title: "Ok", style: .default) { action in
            let newItem = alertController.textFields?[0].text
            addItems(item: newItem ?? "...")
            self.tableView.reloadData()
        }
        alertController.addAction(cancelAlert)
        alertController.addAction(okAlert)
        present(alertController, animated: true)
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arrayOfItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = arrayOfItems[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            deleteItems(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            
        }
    }
}

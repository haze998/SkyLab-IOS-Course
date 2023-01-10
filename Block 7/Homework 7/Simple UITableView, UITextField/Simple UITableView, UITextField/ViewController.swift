/*   Homework 7
 Simple UITableView, UITextField
 1. Створіть екран в застосунку з tableView, яка використовуватиме нативні клітинки UITableViewCell(). А як дані, вона прийматиме array of strings, у якому зберігаються назви міст, що ви відвідали. Застосунок має вивести список міст на екран
 2. Після натискання на клітинки відкривайте другий контролер, в якому буде 2 UILabel в центрі екрана. Перша повинна відображати порядковий номер міста, який був обраний, а друга - назва міста.
 3. Зробіть можливість додавати нові міста. Ви можете реалізувати це в будь-якому дизайні. Як варіант, додати UITextField на екран, і через методи делегату додавати нові елементи до массиву з містами. Також ви можете спробувати використовувати UIAlertController, або бібліотеки (це завдання потребує самостійного пошуку інформації)
 */

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var myTableView: UITableView!
    
    var arrayOfCities: [String] = ["Kharkiv", "Kyiv", "Lviv", "Dnipro", "Mykolayiv", "Kremenchuk", "Kropivnickiy", "Ternopil", "Ivano-Frankivsk", "Rivne", "Khmelnitskiy", "Donetsk", "Luhansk", "Zaporizha", "Odessa", "Zmiyiv", "Chuguyiv", "Valki", "Lubotin", "Merefa"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myTableView.delegate = self
        myTableView.dataSource = self
        
    }
    
    @IBAction func addCityButtomPressed(_ sender: UIButton) {
        let alertController = UIAlertController(title: "Добавить город", message: nil, preferredStyle: .alert)
        let addButton = UIAlertAction(title: "Добавить", style: .default) { alert in
            let myTextField = alertController.textFields![0]
            // cheking for an empty string
            guard let emptyText = myTextField.text, !emptyText.isEmpty else { return }
            // append new value in arrayOfCities
            self.arrayOfCities.append(myTextField.text!)
            // reload cells
            self.myTableView.reloadData()
        }
        
        let dissmissButton = UIAlertAction(title: "Отмена", style: .destructive)
        alertController.addTextField { (textfield) in
            textfield.placeholder = "Введите название города"
        }
        
        alertController.addAction(addButton)
        alertController.addAction(dissmissButton)
        present(alertController, animated: true)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfCities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! CitiesTableViewCell
        cell.topLabel.text = arrayOfCities[indexPath.row]
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let viewController = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController else { return }
        viewController.defaultValueForTopLabel = "\(indexPath.row)"
        viewController.defaultValueForBotLabel = arrayOfCities[indexPath.row]
        navigationController?.pushViewController(viewController, animated: true)
    }
    
}


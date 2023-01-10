//
//  ViewController.swift
//   JSON parcing
//
//  Created by Evgeniy Docenko on 23.12.2022.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let data = self.getData() else { return }
        
        do {
            let decoder = JSONDecoder()
            let myData = try? decoder.decode(Company.self, from: data)
            print("\(myData?.company?.companyDescription ?? "emty")")
            print("\(myData?.company?.listOfData?.first?.modelNumber ?? "emty")")
            print("\(myData?.company?.listOfData?.first?.countries?.last ?? "empty")")
            print("\(myData?.company?.listOfData?.last?.price?.regions?.first?.name ?? "empty")")
            print("\(myData?.company?.listOfData?.last?.price?.regions?.last?.price ?? 0)")
            // all json
            print("All company info:\n\((myData?.company)!)")
        } catch {
            print("Error: \(error)")
        }
    }
    
    // MARK: - Private
    private func getData() -> Data? {
        
        guard let url = Bundle.main.url(forResource: "RawData",
                                            withExtension: "json") else {
            return nil
        }
        do {
            let data = try! Data(contentsOf: url)
            return data
        }
    }
}


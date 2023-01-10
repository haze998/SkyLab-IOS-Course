//
//  Model.swift
//  Data saving (User Defaults)
//
//  Created by Evgeniy Docenko on 05.01.2023.
//

import Foundation

var arrayOfItems: [String] {
    set {
        UserDefaults.standard.set(newValue, forKey: "newItem")
        UserDefaults.standard.synchronize()
    }
    
    get {
        guard let array = UserDefaults.standard.array(forKey: "newItem") as? [String] else { return [] }
        return array
    }
}

func addItems(item: String) {
    arrayOfItems.append(item)
}

func deleteItems(at item : Int) {
    arrayOfItems.remove(at: item)
}

//
//  Fixer.swift
//  Homework 3 Task 2 @eternalhaze
//
//  Created by Evgeniy Docenko on 19.11.2022.
//

import Foundation

protocol Fixer {
    var name: String { get set }
    var fraction: String { get set }
    
    func giveContract(contractName: String) -> String?
    
    func whereFixer()
}

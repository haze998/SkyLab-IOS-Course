
import Foundation

struct JudyAlvarez: Fixer {
    func whereFixer() {
        print("Judy in the server room on the ground floor")
    }
    
    var name: String = "Judy Alvarez"
    
    var fraction: String = "Fixer"
    
    func giveContract(contractName: String) -> String? {
        let statusContract = "Judy give a contract"
        print("Contract name: \(contractName)")
        print(statusContract)
        return statusContract
    }
    
    
    
}


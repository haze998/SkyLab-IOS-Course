import Foundation

struct Bestiya: Fixer {
    func whereFixer() {
        print("Bestiya in VIP zone")
    }
    
    var name: String = "Bestiya"
    
    var fraction: String = "Fixer"
    
    func giveContract(contractName: String) -> String? {
        var statusContract = "Bestiya give a contract"
        print("Contract name: \(contractName)")
        print(statusContract)
        return statusContract
    }
    
    
}

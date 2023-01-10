
import Foundation

struct JackieWells: Hero {
    var name: String = "Jackie Wells"
    
    var fraction: String = "Mercenary"
    
    func go() {
        print("\(name) move to the VIP zone")
    }
    
    func fight() {
        print("\(name) fight")
    }
    
    func getContract(name: String, conractName: String) -> Bool? {
        let statusContract = true
        
        print("\(name) get a contract: \(conractName)")
        print("Status of contract: \(statusContract)")
        
        return statusContract
    }
    
    func contractFinish() {
        print("Success. Contract finished. Your reputation was increased. You can get more contracts!")
    }
    
    func contractLose() {
        print("You lost your mission. Your reputation is low. Fixers ignoring you!")
    }
    
}


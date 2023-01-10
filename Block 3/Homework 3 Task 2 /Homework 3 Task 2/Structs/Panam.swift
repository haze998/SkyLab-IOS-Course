
import Foundation

struct Panam: Hero {
    var name: String = "Panam Palmer"
    
    var fraction: String = "nomad Aldecaldo"
    
    func go() {
        print("\(name) move to the VIP zone")
    }
    
    func fight() {
        print("\(name) fight")
    }
    
    func hack(name: String) {
        print("\(name) start hacking")
    }
    
    func hackingRandom<T: ExpressibleByIntegerLiteral>(_ type: T.Type) -> T {
        var r: T = 0
        arc4random_buf(&r, MemoryLayout<T>.size)
        return r
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

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let vi = Vi(name:"Vi", fraction: "Corporat")
        let jackie = JackieWells(name: "Jackie Wells", fraction: "Mercenary)")
        let judy = JudyAlvarez(name: "Judy Alvarez", fraction: "Fixer")
        let bestiya = Bestiya(name: "Bestiya", fraction: "Fixer")
        let panam = Panam(name: "Panam Palmer", fraction: "nomad Aldecalda")
        let afterlife = AfterLife(fixers: [judy, bestiya])
        
        afterlife.whoInTheAfterLife(fixers: [judy, bestiya])
        vi.go()
        judy.giveContract(contractName: "Whatch brain dance")
        vi.getContract(name: "Vi", conractName: "Watch brain dance")
        vi.contractFinish()
        
        jackie.go()
        bestiya.giveContract(contractName: "Kill robo psycho")
        jackie.getContract(name: "Jackie", conractName: "Kill robo psycho")
        jackie.go()
        jackie.fight()
        jackie.contractLose()
        
        panam.go()
        bestiya.giveContract(contractName: "Let's hack them all")
        panam.getContract(name: "Panam", conractName: "Let's hack them all")
        panam.hack(name: "Panam Palmers")
        print("The secret code is:")
        print(panam.hackingRandom(Int.self))
        panam.contractFinish()
    }
}


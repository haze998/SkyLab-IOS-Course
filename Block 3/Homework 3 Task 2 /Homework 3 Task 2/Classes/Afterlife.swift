
import Foundation

class AfterLife {
    var fixers: [Fixer] = []
    
    init(fixers: [Fixer]) {
        self.fixers = fixers
    }
    
    func whoInTheAfterLife(fixers: [Fixer]) {
        print("In Afterlife now next fixers: ")
        let judy = JudyAlvarez()
        judy.whereFixer()
        
        let bestiya = Bestiya()
        bestiya.whereFixer()
    }
}


import Foundation

protocol Hero: Movable, Fightable, Contractable {
    var name: String { get set }
    var fraction: String { get set }
}

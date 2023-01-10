import Foundation

/* Protocols, Optionals
 Task 1. (Відкрийте презентацію про протоколи, наприкінці ви знайдете блок із практикою. Виконайте практику, створивши просту ігрову ситуацію за допомогою протоколів) */


protocol Movable {
    func run()
}

protocol Fightable {
    func fight()
}

protocol Hero: Movable, Fightable {
    var name: String { get set }
}

struct Sherif: Fightable {
    func fight() {
        print("\(hero): Fight")
    }
    
    var hero: String = "Sherif"
}

struct Butcher: Movable {
    func run() {
        print("\(hero): Run")
    }
    
    var hero: String = "Butcher"
}

struct Policeman: Hero {
    var name: String = "Policeman"
    
    func run() {
        print("\(name): Run")
    }
    
    func fight() {
        print("\(name): Fight")
    }
}

struct SherifHelper: Hero {
    var name: String = "Sherif helper"
    
    func run() {
        print("\(name): Fight")
    }
    
    func fight() {
        print("\(name): Fight")
    }
}

struct Farmer: Movable {
    func run() {
        print("\(name): Fight")
    }
    
    var name: String = "Farmer"
}

struct StreetCleaner: Fightable {
    func fight() {
        print("\(name): Fight")
    }
    
    var name: String = "Street cleaner"
}

class Tavern {
    var fighters: [Fightable] = []
    var movers: [Movable] = []
    
    init(fighters: [Fightable], movers: [Movable]) {
        self.fighters = fighters
        self.movers = movers
    }
    
    func enterTavern(hero: Hero) {
        hero.fight()
        for element in movers {
            element.run()
        }
        
        for element in fighters {
            element.fight()
        }
    }
}

let sherif = Sherif() // Fightable
let butcher = Butcher() // Movable
let policeman = Policeman() // Hero
let sherifHelper = SherifHelper() // Hero
let farmer = Farmer() // Movable
let streetCleaner = StreetCleaner() // Fightable
let tavern = Tavern(fighters: [sherif, streetCleaner], movers: [butcher, farmer])

tavern.enterTavern(hero: policeman)
tavern.enterTavern(hero: sherifHelper)


/* Task 2. Найкращий спосіб закріпити інформацію, придумати свій спосіб застосування протоколів. Відкрийте останній слайд практики за протоколами та виконайте завдання. Необхідно створити свою міні гру, де ви могли б використовувати протоколи, але буде мінімальний набір вимог:
 Повинні бути функції, що повертають опціональні значення
 Ці функції повинні викликатись і опціонали мають бути “розгорнуті”
 Перенесіть цю гру в проект XCode
 Організуйте красиву файлову структуру, різні типи різних файлів. Використовуйте папки. Цей проект ми будемо завантажувати на github як домашнє завдання в наступному блоці */


// -- Решение в отдельном ПРОЭКТЕ!

/* Protocols, Extensions
 Task 3. Напишіть розширення на такі типи:
 Int - Функція зводить число N ступінь. Спробуйте вирішити задачу без використання стандартної функції pow(), розв'яжіть її з використанням циклів
 String - Обчислювана властивість isPalindrome. Повертає Bool, залежно від того, чи є рядок паліндромом
 *Не забувайте, що ви можете шукати інформацію в інтернеті
 Протестуйте нові розширення з різними даними, використовуйте не менше трьох тестів на кожен тип, які максимально відрізняються між собою */

// POW int
extension Int {
    func powIntenger(inPow: Int) -> Int{
        var counter = 1
        for _ in 1...inPow {
            counter = counter * self
        }
        return counter
    }
}

var number = 2 // тест
print(number.powIntenger(inPow: 3))

// string is Palindrom ?
extension String {
    func isPalindrome(someString: String) -> Bool {
        return self == String(self.reversed())
    }
}

var myString = "арозаупаланалапуазора" // тест
print(myString.isPalindrome(someString: myString))

/* Task 4. Поверніться до створеної вами гри у другому завданні та додайте для всіх протоколів реалізацію методів за замовчуванням */

// -- Решение в отделньмом ПРОЭКТЕ!

/* Generics
 Відкрийте презентацію по Generics, наприкінці презентації ви знайдете практику
 
 Task 5. Виконайте практику першому слайді. */

// Generic:
// Функция, принимающую два параметра и меняющую местами их значения
func swapValues<T>(a: inout T, b: inout T) {
    (a, b) = (b, a)
}

var kiwi = "Kiwi"
var mango = "Mango"
swap(&kiwi, &mango)
print(kiwi) // в переменную Киви записалось значение переменной Манго
print(mango) // в переменную Манго записалось значение переменной Киви

// Функция, принимающую два параметра и возвращающую typle с ними же
func returnTuple<T>(a: T, b: T) -> (a: T, b: T) {
    return (a, b)
}
let myTuple = returnTuple(a: 13, b: 120)
print(myTuple)

// Функция сложения, которая принимает два параметра и возвращает их сумму
func additionValues<T: Numeric>(firstValue: T, secondValue: T) -> T {
    return firstValue + secondValue
}

let resOfValues = additionValues(firstValue: 2, secondValue: 4)
print(resOfValues)

// Тип, который содержит свойство - Dictionary с данными. Напишите функции, которые добавляют в этот словарь значение по ключу и достают значение по ключу
struct MyDict<K:Hashable, V> {
    var dict: [K:V] = [:]
    
    mutating func addValue(_ value: V, forKey key: K) {
        dict[key] = value
    }
    
    func getValue(forKey key: K) -> V? {
        dict[key]
    }
}

var myDictIntString = MyDict<Int, String>()
myDictIntString.addValue("First", forKey: 1)
myDictIntString.addValue("Second", forKey: 2)
myDictIntString.addValue("Third", forKey: 3)
let myIntKey = myDictIntString.getValue(forKey: 3)
print(myIntKey ?? 0)

var myDictDoubleBool = MyDict<Double, Bool>()
myDictDoubleBool.addValue(true, forKey: 13.0)
myDictDoubleBool.addValue(false, forKey: 1.00)
let myDoubleKey = myDictDoubleBool.getValue(forKey: 13)
print(myDoubleKey ?? 0)

/* Task 6. Виконайте практику другого слайду. Тут ви можете реалізувати або стек або пов'язаний список (stack / linked list)
 
 Завдання складніше, ніж здаються. Не забувайте, що ви можете шукати інформацію в інтернеті (інформацію, але не рішення ;)
 */

// linked list

class Node<T> {

    var value: T
    var next: Node<T>?

    init(value: T, next: Node<T>? = nil) {
        self.value = value
        self.next = next
    }
}   

struct LinkedList<T> {
 
  var head: Node<T>?
  var tail: Node<T>?
  
  var isEmpty: Bool { head == nil }
  
  init() {}
    
    mutating func push(_ value: T) {
         head = Node(value: value, next: head)

         if tail == nil {
             tail = head
         }
     }
    
    mutating func append(_ value: T) {
        let node = Node(value: value)

        tail?.next = node
        tail = node
      }
    
    func node(at index: Int) -> Node<T>? {
          var currentIndex = 0
          var currentNode = head

          while currentNode != nil && currentIndex < index {
              currentNode = currentNode?.next
              currentIndex += 1
          }

          return currentNode
      }
    
    func insert(_ value: T, after index: Int) {
       guard let node = node(at: index) else { return }
       
       node.next = Node(value: value, next: node.next)
     }
    
    mutating func pop() -> T? {
        defer {
          head = head?.next
          
          if isEmpty {
            tail = nil
          }
        }
        
        return head?.value
      }
    
    mutating func removeLast() -> T? {
      guard let head = head else { return nil }
      
      var previousNode = head
      var currentNode = head
      
      while let next = currentNode.next {
        previousNode = currentNode
        currentNode = next
      }
      
      previousNode.next = nil
      tail = previousNode
      
      return currentNode.value
    }
    
    mutating func remove(after index: Int) -> T? {
        guard let node = node(at: index) else { return nil }
        
        defer {
          if node.next === tail {
            tail = node
          }
          
          node.next = node.next?.next
        }
        
        return node.next?.value
      }
}

var list = LinkedList<Int>()

list.push(10)
list.push(22)

print(list) // 22 -> 10
list.append(5)
list.append(2)

print(list) // 22 -> 10 -> 5 -> 2
list.insert(15, after: 1)

print(list) // 22 -> 10 -> 15 -> 5 -> 2
list.pop()

print(list) // 10 -> 15 -> 5 -> 2
list.removeLast()

print(list) // 10 -> 15 -> 5
list.remove(after: 0)

print(list) // 10 -> 5


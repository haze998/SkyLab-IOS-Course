// -- Class
// -- Task 1. Створіть клас Матрос (Sailor), в якому буде ініціалізатор, одна властивість - ім'я матроса та один метод "introduce Myself". При виклику цього методу, в консоль буде виводитися повідомлення "Привіт, мене звуть *ім'я матроса*!"

class Sailor {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func introducwMyself() {
        print("Привіт, мене звуть \(name)!")
    }
}

let sailorIntroduce = Sailor(name: "Bob")
sailorIntroduce.introducwMyself()

// -- Task 2. Створіть клас Корабель, у якому буде ініціалізатор, дві властивості: назва корабля та масив "матроси". Додайте також функцію "introduceAll", яка виводитиме вітання від імені всіх матросів, після чого виводитиме повідомлення "Ми з корабля *ім'я корабля*"

class Ship {
    var shipName: String
    var sailorsArr = [String]()
    
    init(shipName: String, sailorsArr: [String]) {
        self.shipName = shipName
        self.sailorsArr = sailorsArr
    }
    
    func introduceAll() {
        for sailors in sailorsArr {
            print("Привіт, мене зовуть \(sailors)!\nЯ з корабля \(shipName)")
        }
    }
}

let ship = Ship(shipName: "Чорна Перлина", sailorsArr: ["Jack Sparrow", "Black Beard", "Barbossa", "David Jhons"])
ship.introduceAll()

// -- Task 3. Через ініціалізатор створіть 5 екземплярів класу Матрос та клас Корабель, до якого передайте список створених матросів. Викличте функцію introduceAll. Ви повинні отримати в консолі вітання від імені всіх матросів та назву корабля

class  SecondShip {
    let shipName: String
    var sailors = [String]()
    
    init(shipName: String, sailors: [String]) {
        self.shipName = shipName
        self.sailors = sailors
    }
    
    func introduceAll() {
        for sailor in sailors {
            print("Привіт, я \(sailor)!\nЯ з корабля \(shipName)")
        }
    }
}

let firstSailor = Sailor(name: "Sparrow")
let secondSailor = Sailor(name: "Black Beard")
let thirdSailor = Sailor(name: "Barbossa")
let fourthSailor = Sailor(name: "Jhons")
let fiveSailor = Sailor(name: "Morgan")

let secondShip = SecondShip(shipName: "Pearl", sailors: [firstSailor.name, secondSailor.name, thirdSailor.name, fourthSailor.name, firstSailor.name])
secondShip.introduceAll()

// -- Class: Inheritance
// -- Task 4. Створіть клас Titanic, дочірній від класу Ship. І клас TitanicSailor, дочірній від  Sailor. Нехай TitanicSailor матиме ту саму функцію introduseMyself, але повідомлення буде виводити англійською. Аналогічно клас Titanic, тільки нехай його функція introduceAll виводить на двох мовах: те ж повідомлення що і Ship, а потім - таке ж повідомлення англійською. Не змінюйте існуючі класи Ship та Sailor

class Titanic : Ship {
    override func introduceAll() {
        for sailors in sailorsArr {
            print("Привіт, мене зовуть \(sailors)!\nЯ з корабля \(shipName)")
        }
        for sailors in sailorsArr {
            print("Hello, mu name is \(sailors)!\nI am from ship \(shipName)")
        }
    }
    
}

class TitanicSailor : Sailor {
    override func introducwMyself() {
        print("Hello, my name is \(name)!")
    }
}

let titanic = Titanic(shipName: "Pearl", sailorsArr: ["Morgan"])
titanic.introduceAll()

let titnacSailor = TitanicSailor(name: "Joe")
titnacSailor.introducwMyself()
            
// -- Task 5. Створіть клас Calculator, з функціями +-*/. Створіть клас CalculatorPro, який також буде вираховувати відсоток від числа і зводитиме число в ступінь

class Calculator {
    func add(operand1: Double, operand2: Double) -> Double {
        let res = operand1 + operand2
        return res
    }
    
    func sub(operand1: Double, operand2: Double) -> Double {
        let res = operand1 - operand2
        return res
    }
    
    func mul(operand1: Double, operand2: Double) -> Double {
        let res = operand1 * operand2
        return res
    }
    
    func div(operand1: Double, operand2: Double) -> Double {
        let res = operand1 / operand2
        return res
    }
}

class CalculatorPro {
    func percent(number: Double, percent: Double) -> Double{
        let res = (number * percent) / 100
        return res
    }
    
    func mathPow(number: Int, inPow: Int) -> Int{
        var counter = 1
        for _ in 1...inPow {
            counter = counter * number
        }
        return counter
    }
}

let calculator = Calculator()
calculator.add(operand1: 1, operand2: 2)
calculator.div(operand1: 312, operand2: 33)
calculator.mul(operand1: 2, operand2: 12)
calculator.sub(operand1: 123, operand2: 13)

let calcPro = CalculatorPro()
calcPro.percent(number: 14, percent: 4)
calcPro.mathPow(number: 2, inPow: 3)

// -- Task 5.1* Створіть клас SuperProCalc, дочірній від CalculatorPro, який буде рахувати складні відсотки для розрахунку суми депозиту на вказаний період часу із зазначеною процентною ставкою

class SuperCalc : CalculatorPro {
    
    //Формула: сумма вклада / 100% * % ставку / количество дней в году * количество дней действия вклада.
    
    func superDeposit(deposit: Double, period: Double = 365, bankProcent: Double, term: Double) -> Double {
        let sumOfDeposit = deposit / 100 * bankProcent / period * term
        return sumOfDeposit
    }
}

let superCalc = SuperCalc()
superCalc.superDeposit(deposit: 1000, bankProcent: 5, term: 365)

// -- Class: Inheritance
// -- Task 6. Придумайте свій приклад використання наслідування. Найпростіший спосіб - уявити, що ви створюєте комп'ютерну гру. Наприклад: вам потрібно створити персонажів, які будуть вміти щось робити (це функції) та мати якісь властивості (var/let …) Створіть основу для персонажа - батьківський клас, а потім додайте дочірні класи. Спробуйте спроектувати систему так, щоб дочірні персонажі мали перевизначати методи батьківського класу (override func) Додайте ситуації, в яких дочірні персонажі мають використовувати виклик батьківського методу (super.*), і в яких не мають цього робити Використовуйте init для ваших класів. Створіть екземпляри ваших класів, та протестуйте їх. Це творче завдання і воно буде прийняте при будь-якому рішенні, навіть дуже простому. Але це також ваша можливість створити щось масштабне та цікаве

class Heroes {
    
    let name: String
    let heroClass: String
    
    init(name: String, heroClass: String) {
        self.name = name
        self.heroClass = heroClass
    }
    
    func go() {
        print("\(name) go ahead!")
    }
    
    func turnRight() {
        print("\(name) turn right!")
    }
    
    func turnLeft() {
        print("\(name) turn left!")
    }
    
    func turnAround() {
        print("\(name) turn around!")
    }
    
    func earnExpirience() {
        print("\(name) earned 1 exp of \(heroClass)")
    }
    
    func deadHero() {
        print("\(name) was dead! Remaine until return 30 sec!")
    }
}

class Doom : Heroes {
    override func deadHero() {
        super.deadHero()
        print("\(name) Respawns immediately at once after the first death")
    }
    
    func atack() {
        print("\(name) atacked enemy!")
    }
    
    func useUltimate() {
        print("\(name) use DOOM. Prevents one enemy from using abilities and items, and also deals 100 periodic damage for a minute ")
    }
}

class Invoker : Heroes {
    func useUltimate() {
        print("\(name) Skillfully combines spells from a vast arsenal")
    }
}

class TemplarAssasin : Heroes{
    func useUltimate() {
        print("\(name) Slows down enemies with its traps")
    }
}

class Juggernaut : Heroes {
    func useUltimate() {
        print("\(name) Cuts enemies with precise swings of the sword")
    }
}

class WinOrLose {
    func direVictory() {
        print("Dire victory! Enemy throne was destroyed!")
    }
    
    func radiantVictory() {
        print("Radiant victory! Enemy throne was destroyed!")
    }
    
    func startGame() {
        print("Game will be start after 15 seconds. Prepare to battle!")
    }
    
    func battleStart() {
        print("Start Battle!")
    }
}

// -- Create heroes.
let doom = Doom(name: "Doom", heroClass: "Strength")
let invoker = Invoker(name: "Invoker", heroClass: "Intelligence")
let temlarAssasin = TemplarAssasin(name: "Temlar Assasin", heroClass: "Agillity")
let juggernaut = Juggernaut(name: "Juggernaut", heroClass: "Agillity")
let winOrLose = WinOrLose()
print("-------------------------------------------------------")
winOrLose.startGame()
winOrLose.battleStart()
doom.go()
doom.atack()
doom.earnExpirience()
invoker.useUltimate()
doom.useUltimate()
temlarAssasin.turnAround()
temlarAssasin.earnExpirience()
temlarAssasin.useUltimate()
juggernaut.turnRight()
invoker.earnExpirience()
invoker.useUltimate()
doom.deadHero()
juggernaut.earnExpirience()
juggernaut.useUltimate()
temlarAssasin.deadHero()
invoker.deadHero()
winOrLose.radiantVictory()

// -- Switch
// -- Task 7. Створіть функцію, яка приймає 1 параметр, відсоток заряду батареї. Нехай функція поверне повідомлення користувача залежно від цього відсотка:
// -- якщо 100%: "Пристрій заряджений",
// -- якщо 70-80%, “Необхідно зарядити пристрій протягом 6 годин”
// -- якщо 20-40%, "Поставте пристрій на зарядку"
// -- якщо 0%, "Пристрій повністю розряджений".
// -- В інших випадках не виводьте нічого. Використовуйте switch case.

func batteryPower(batteryPower: Int = 100) -> Int {
    switch batteryPower {
    case 100: print("Пристрій заряджений")
    case 70...80: print("Необхідно зарядити пристрій протягом 6 годин")
    case 20...40: print("Поставте пристрій на зарядку")
    case 0: print("Пристрій повністю розряджений")
    default:
        print("Акамулятор ще живий, але залишилось кілька хвилин")
    }
    return batteryPower
}

let myBattery = batteryPower(batteryPower: 100)

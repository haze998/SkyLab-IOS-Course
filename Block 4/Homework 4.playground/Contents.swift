// -- Enum
/* 1. Практикуємося у використанні enum:
 -- У презентації з теми Enum та в playgrounds файлі були наведені варіанти перерахувань. Ключова ідея Enum – кожен case може стати значенням enum. Якщо значеннями є дні тижня, то enum має називатися “День тижня”
 Спробуйте вигадати два своїх перерахування, кожен з яких повинен відповідати ключовій ідеї, описаній вище
 -- У першому з вашого enum додайте RawValue. Вкажіть його тільки для частини case та протестуйте, створивши кілька екземплярів цього enum
 -- У другому enum додайте функцію, в якій буде switch. Нехай функція повертає
 якесь значення залежно від значення enum (це може будь-яка функція, на ваш розсуд)
 -- Створіть enum з асоціативними значеннями для кожного його case.
 
 Протестуйте його, додавши функцію, яка приймає значення enum і повертає значення, що залежить від прийнятого, за аналогією з прикладом у Playgrounds */

enum Cofe: Int {
    case expresso = 1
    case late = 2
    case americano = 3
    case capuccino
    case frappe
}

var cofeAmericano = Cofe(rawValue: 3)
var cofeCapuccino = Cofe.capuccino
var cofeExpresso = Cofe(rawValue: 1)

print(cofeExpresso!)
print(cofeCapuccino)
print(cofeAmericano!)

enum Planets {
    case mercury
    case earth
    case venera
    case mars
    
    func whatIsPlanet() -> String {
        switch self {
        case .mercury:
            return "Мерку́рий — наименьшая планета Солнечной системы и самая близкая к Солнцу."
        case .earth:
            return "Земля́ — третья по удалённости от Солнца планета Солнечной системы."
        case .mars:
            return "Марс — четвёртая по удалённости от Солнца и седьмая по размеру планета Солнечной системы."
        case .venera:
            return "Вене́ра — вторая по удалённости от Солнца и шестая по размеру планета Солнечной системы."
        }
    }
}

var myPlanet = Planets.mercury
let myPlanetAnswer = myPlanet.whatIsPlanet()
print(myPlanetAnswer)

enum Colors {
    case purple(Int)
    case black(String)
    case red(Float)
    case yellow(Bool)
    
    func wichColor(color: Self) -> String{
        switch self {
        case .purple(let purpShade):
            return "Purple shade = \(purpShade)"
        case .black(let blackClr):
            return "Just a \(blackClr)"
        case .red(let redShade):
            return "Red shade = \(redShade)"
        case .yellow(let yellBool):
            return "Yellow is \(yellBool)"
        }
    }
}

var myColor = Colors.purple(13)
var mySecondColor = Colors.black("Black color")

let blackColorRes = mySecondColor.wichColor(color: mySecondColor)
let colorRes = myColor.wichColor(color: .purple(13))

print(colorRes)
print(blackColorRes)


/* Protocol-oriented programming
 2. Створюємо персонажів для гри:
 -- Створіть enum VehicleType: electric / nonElectric
 -- Створіть протокол Vehicle, який включатиме властивості: weight: Float, speed: Float, type: VehicleType, canFly: Bool. Всі ці властивості можна позначити як { get }. Додайте функцію prepare()
 -- Розширте протокол Vehicle з реалізацією функції prepare: якщо Vehicle electric, виводимо в консоль повідомлення "Charge", якщо noElectric, виводимо повідомлення "Refuel". Також задайте значення false для властивості canFly
 -- Створіть протокол FlyableVehicle з функцією getMaxHight -> Float
 
 -- Створіть протокол Vehicle для об'єктів, що реалізують FlyableVehicle, додайте за замовчуванням для canFly значення true, type - nonElectric. Реалізуйте функцію getMaxHight. Якщо це електричний об'єкт, нехай він повертає weight + speed, якщо ні, то weight * speed
 
 -- Створіть структури Car, ElectricCar, AirPlane та створіть їх екземпляри. Всередині структур задавати значення за замовчуванням не обов'язково, ініціалізатор буде присутній у структурах за умовчанням
 -- Виведіть в консоль властивості у Car і electricalCar: type canFly. У airPlane виведіть властивість canFly та викличте функцію getMaxHight
 -- Створіть структуру ElectricalAirplane, її екземпляр з тими самими даними, які ви використовували створення звичайного літака. Виведіть у консоль значення, яке повертає функція getMaxHight() */

enum VehicleType {
    case electric
    case nonElectric
}

protocol Vehicle {
    var weight: Float { get }
    var speed: Float { get }
    var type: VehicleType { get }
    var canFly: Bool { get }
    
    func prepare()
}

extension Vehicle {
    var canFly: Bool {
        return false
    }
    
    func prepare() {
        switch type {
        case .electric:
            print("Charge")
        case .nonElectric:
            print("Refuel")
        }
    }
}

protocol FlyableVehicle {
    func getMaxHight() -> Float
}

extension Vehicle where Self: FlyableVehicle {
    var canFly: Bool {
        return true
    }
    
    var type: VehicleType {
        return .nonElectric
    }
    
    func getMaxHight() -> Float {
        switch type {
        case .electric:
            return weight + speed
        case .nonElectric:
            return weight * speed
        }
    }
}

struct Car: Vehicle {
    var weight: Float
    
    var speed: Float
    
    var type: VehicleType
}

struct ElectricCar: Vehicle {
    var weight: Float
    
    var speed: Float
    
    var type: VehicleType
    
    
}

struct AirPlane: Vehicle, FlyableVehicle {
    var weight: Float
    
    var speed: Float
    
    var type: VehicleType
}

struct ElectricalAirplane: Vehicle, FlyableVehicle {
    var weight: Float
    
    var speed: Float
    
    var type: VehicleType
}

var mercedesGle = Car(weight: 2655.0, speed: 250.0, type: .nonElectric)
var teslaModelS = ElectricCar(weight: 2263.0, speed: 350.0, type: .electric)
var boeing = AirPlane(weight: 440.000, speed: 917.0, type: .nonElectric)
let electricalAirplane = ElectricalAirplane(weight: 907.0, speed: 556.0, type: .electric)

// Mercedes
print("Mercedes-Benz GLE can fly? Answer: \(mercedesGle.canFly)")
// Tesla
print("Tesla Model S can fly? Answer: \(teslaModelS.canFly)")
// Boeing
print("Boeing 747-8 Intercontinental can fly? Answer: \(boeing.canFly)")
let boeingMaxHight = boeing.getMaxHight()
print(boeingMaxHight)
// ElectricalAirplane
let electricalAirplaneMaxHight = electricalAirplane.getMaxHight()
print(electricalAirplaneMaxHight)


/* Git
 3. Зареєструйте безкоштовний обліковий запис на github.com. Створіть репозиторій із проектом “Protocol Practice”. Завантажте програму Sourcetree і додайте до неї ваш репозиторій. Додайте файлик Readme з вашим ім'ям і зробіть перший commit */


/* 4. Минулого домашнього завдання ми створювали “гру” у тому, щоб краще зрозуміти як використовуються протоколи (завдання #2).
 Завантажте свою гру на створений вами репозиторій git. Для цього достатньо перенести її в папку з репозиторієм і зробити commit
 Для виконання наступного завдання необхідно мати доступ до нашого репозиторія. По наступному лінку ви можете додати свій нік/email в git в таблицю: Список GIT акаунтів (https://docs.google.com/spreadsheets/d/1xYDn0GsPNPpXTlKRhwTW4TVfhDVmNNSvPK2Advbd7So/edit#gid=17422459)
 Наприкінці тижня я додам всіх, хто буде в цій таблиці до нашого репозиторію та ви зможете виконати наступне завдання */

/* 5. Стягніть цей проект на ваш мак через source tree або за допомогою консолі:
 https://github.com/alexdneprin/ac-group-2
 Створіть гілку з будь-якою назвою.
 Відкрийте проект файлу ViewController. Додайте у функцію viewDidLoad рядок з вашим ім'ям та ніком у telegram та закоментуйте його.
 Зробіть commit у свою гілку і створіть pull-request.
 Якщо немає конфліктів, виконайте merge. Якщо є – потрібно їх зарезолвити 😉
 */

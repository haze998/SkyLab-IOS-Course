import Foundation

//    Массивы и циклы
// -- Task 1 (Замените все отрицательные числа на 0 и выведите массив в консоль)

var myArray = [ -20, -5, -8, -13, -1, 8, 24, 15, 12, 37 ]

let defaulValue = 0

for i in myArray.indices {
    
    if myArray[i] < 0 {
        myArray[i] = defaulValue
    }
}

print(myArray)


// -- Task 2 (Найдите минимальный и максимальный элемент в массиве и выведите его в консоль)

var myArray1 = [ -20, -5, -8, -13, -1, 8, 24, 15, 12, 37 ]

let maxNumber = myArray1.max()
print(maxNumber!)

let minNumber = myArray1.min()
print(minNumber!)


// -- Task 3 (Найдите сумму элементов массива чисел и выведите ее в консоль)

var myArray2 = [ -20, -5, -8, -13, -1, 8, 24, 15, 12, 37 ]

let sumOfArray = myArray2.reduce(0, +)
print(sumOfArray)


//    Массивы, словари и циклы
// -- Task 4 (Создайте массив с названиями всех месяцев, типа String. Затем создайте словарь и с помощью цикла задайте ему значения на основании массива: где в качестве ключей будут выступать цифры (индексы), а в качестве значений - элементы массива.)

var monthArr = [
    "January", "Fabruary", "March",
    "April", "May", "June", "July",
    "August", "September", "October",
    "November", "December" ]

var monthDict : [Int: String] = [:]

for (key, value) in monthArr.enumerated() {
    
    monthDict[key] = value
}

print(monthDict)


// -- Task 5 (Создайте словарь:
//    var dictionary = ["first": 1, "second": 2, "third": 3, "fourth": 4]
//    Поменяйте местами значения по ключам “first” и “fourth”. Выведите в консоль итоговый словарь )

var dictionary = ["first": 1, "second": 2, "third": 3, "fourth": 4]

dictionary.updateValue(4, forKey: "first")
dictionary.updateValue(1, forKey: "fourth")

print(dictionary)


// -- Словари и циклы
// -- Task 6 (Создайте пустой словарь calendar, так же вам понадобиться массив с месяцами из четвертого задания. С помощью цикла от 1970 до 2022 задайте значения для словаря. В качестве ключа пусть будет год, а значение это массив с месяцами.)


var calendar: [Int: [String]] = [:]

for i in 1970...2022 {
    
    calendar[i] = monthArr
}

print(calendar)


// -- Task 7 (С помощью другого цикла добавьте в calendar на каждый год по одному месяцу с вашим названием, чтобы в каждом году вышло 13 месяцев.)


for key in calendar.keys {
    
    calendar[key]?.append("Swiftery:)")
}

print(calendar)


// -- Словари и циклы*
// -- Task 7.1

var someDays = Array(1...31)
var simpleCalendar: [String: [Int]] = [:]
var calendarPro: [Int:[String:[Int]]] = [:]

for i in monthArr {
    simpleCalendar.updateValue(someDays, forKey: i)
}

for keys in calendar.keys {
    calendarPro.updateValue(simpleCalendar, forKey: keys)
}

print(calendarPro)
print(calendarPro[2019]!["September"]![0])


// -- Условные операторы и Примитивные типы данных
// -- Task 8 (Создайте 2 переменные с числами. Если значения равны, выведите в консоль их сумму умноженную на 3, если нет, выведите в консоль их сумму в случае если она четное число.)

let number1 = 14
let number2 = 24

if number1 == number2 {
    print((number1 + number2) * 3)
} else if (number1 + number2) % 2 == 0 {
    print(number1 + number2)
} else {
    print("Число не четное")
}



// -- Task 9 (Создайте строку, в которой будет храниться любая фраза из трех или более слов c восклицательным знаком в конце. Выведите в консоль первое и последнее слово из этой строки (без восклицательного знака). В этом задании необходимо найти способ доставать слова из вашей строки, погуглите методы с помощью которых это возможно реализовать. Задание сложнее чем кажется :))

var sentence = "Swift is the best programming language"

let words = sentence.byWords
let firstWord = words.first
let lastWord = words.last

print("First word is: \(firstWord!)\nSecond word is: \(lastWord!)")

extension StringProtocol {
    var byWords: [SubSequence] {
        var byWords: [SubSequence] = []
        enumerateSubstrings(in: startIndex..., options: .byWords) { _, range, _, _ in
            byWords.append(self[range])
        }
        return byWords
    }
}


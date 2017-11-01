//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

let possibleNumber = "123"
let convertedNumber = Int(possibleNumber)

//let possibleString = "hello, world"
//let converedString = Int(possibleString)
//
//print("number is \(convertedNumber)")
//print("string is \(converedString)")

/** 可选类型*/
var resCode:Int? = 404
resCode = nil

if resCode != nil {
    print("has res code")
} else {
    print("do not has res code")
}

if let constantName = resCode {
    print("constantName:\(constantName)")
} else {
    print("constantName:\(resCode)")
}

/** 可选绑定 */
if let actualNumber = Int(possibleNumber) {
    //如果转换成功，actualNumber 常量可以在 if 语句的第一个分支中使用。它已经被可选类型 包含的 值初始化过，所以不需要再使用 ! 后缀来获取它的值。在这个例子中，actualNumber 只被用来输出转换结果。
    print("\'\(possibleNumber)\' has an integer value of \(actualNumber)")
} else {
    print("\'\(possibleNumber)\' could not be converted to an integer")
}

//if let actualString = Int(possibleString) {
//    print("\'\(possibleString)\' has an integer value of \(actualString)")
//} else {
//    print("\'\(possibleString)\' could not be converted to an integer")
//}

/** 隐式解析可选类型---可选类型 String 和隐式解析可选类型 String */
let possibleString: String? = "An optional string."
let forcedString: String = possibleString! // 需要感叹号来获取值

let assumedString: String! = "An implicitly unwrapped optional string."
let implicitString: String = assumedString  // 不需要感叹号

if assumedString != nil {
    print(assumedString)
}

enum SandwichError {
    case outOfCleanDishes
    case missingIngredients
}

func eatASandwich() {
    print("eatASandwich")
}

func washDishes() {
    print("washDishes")
}

//func buyGroceries(_:) {
//    print("buyGroceries:ingredients\(ingredients)")
//}
//let age = -3
//assert(age >= 0, "A person's age cannot be less than zero")

func makeASandwich() throws {
    // ...
   // throw SandwichError.outOfCleanDishes
}

do {
    try makeASandwich()
    eatASandwich()
} catch SandwichError.outOfCleanDishes {
    washDishes()
}

var name = "world"
if name == "world" {
    print("hello, world")
} else {
    print("I'm sorry \(name), but I don't recognize you")
}

for index in 1..<5 {
    print("\(index) * 5 = \(index * 5)")
}

let string1 = "hello"
let string2 = " there"
var welcome = string1 + string2
let exclamationMark: Character = "!"
welcome.append(exclamationMark)


//let greeting = "Guten Tag!"
//greeting[greeting.startIndex]
//greeting[greeting.index(before: greeting.endIndex)]
//greeting[greeting.index(after: greeting.startIndex)]
//greeting[greeting.index(greeting.startIndex, offsetBy: 7)]
//for index in greeting.characters.indices {
//    print("\(greeting[index])", terminator:" ")
//}

var quotation = "We're a lot alike, you and I."
let sameQuotation = "We're a lot alike, you and I."
if quotation == sameQuotation {
    print("These two strings are considered equal")
}

let latinCapitalLetterA: Character = "\u{41}"
print("\(latinCapitalLetterA)")
let cyrillicCapitalLetterA: Character = "\u{0410}"
print("\(cyrillicCapitalLetterA)")
if latinCapitalLetterA != cyrillicCapitalLetterA {
    print("These two characters are not equivalent")
}


var someInts = [Int]()
someInts.append(3)
someInts.append(4)
print("\(someInts)")

var othersInts: [Int] = [1, 2, 3]
print("\(othersInts)")

var mixArray = ["abc"]
if mixArray.isEmpty {
    print("empty")
} else {
    print("not empty")
}

mixArray.removeAll()
if mixArray.isEmpty {
    print("empty")
} else {
    print("not empty")
}

func greet(person: [String: String]) {
    guard let name = person["name"] else {
        return
    }
    print("Hello \(name)")
    guard var location = person["location"] else {
        print("I hope the weather is nice near you.")
        return

    }
    print("I hope the weather is nice in \(location).")
}

greet(person: ["name": "John"])
// 输出 "Hello John!"
// 输出 "I hope the weather is nice near you."
greet(person: ["name": "Jane", "location": "Cupertino"])
// 输出 "Hello Jane!"
// 输出 "I hope the weather is nice in Cupertino."

func printAndCount(string: String) -> Int {
    print(string)
    return string.characters.count
}
func printWithoutCounting(string: String) {
    let _ = printAndCount(string: string)
}
printAndCount(string: "hello, world")
// 打印 "hello, world" 并且返回值 12
printWithoutCounting(string: "hello, world")
// 打印 "hello, world" 但是没有返回任何值


func minMax(array: [Int]) -> (min: Int, max: Int)? {
    if array.isEmpty { return nil }
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}
if let bounds = minMax(array: [8, -6, 2, 109, 3, 71]) {
    print("min is \(bounds.min) and max is \(bounds.max)")
}
//let bounds = minMax(array: [8, -6, 2, 109, 3, 71])
//print("min is \(bounds.min) and max is \(bounds.max)")
// 打印 "min is -6 and max is 109"

func addTwoInts(_ a: Int, _ b: Int) -> Int {
    return a + b
}
func multiplyTwoInts(_ a: Int, _ b: Int) -> Int {
    return a * b
}

var mathFunction: (Int, Int) -> Int = addTwoInts
print("Result: \(mathFunction(2, 3))")

mathFunction = multiplyTwoInts
print("Result: \(mathFunction(2, 3))")
// Prints "Result: 5"

func printMathResult(_ mathFunction: (Int, Int) -> Int, _ a: Int, _ b: Int) {
    print("Result: \(mathFunction(a, b))")
}
printMathResult(addTwoInts, 3, 5)
// 打印 "Result: 8"

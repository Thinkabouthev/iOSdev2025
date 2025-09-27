import UIKit

//Problem 1: FizzBuzz
func fizzBuzz () {
    for i in 1...100{
        if i % 15 == 0 {
            print( "FizzBuzz")
        }
        if i % 3 == 0 {
            print( "Fizz")
        }
        if i % 5 == 0 {
            print( "Buzz")
        }
    }
}
fizzBuzz()

//Problem 2: Prime Numbers
func isPrime(_ n: Int) -> Bool {
    if n < 2 {
        return false
    }
    for i in 2..<n {
        if n % i == 0 {
            return false
        }
    }
    return true
}
print(isPrime(11))

// Temperature Converter
func temperatureConverter(temp: Double, scale: String) {
    func celsiusToFahrenheit(_ celsius: Double) -> Double {
        return (celsius * 9.0 / 5.0) + 32.0
    }
    func fahrenheitToCelsius(_ fahrenheit: Double) -> Double {
        return (fahrenheit - 32.0) * 5.0 / 9.0
    }
    func celsiusToKelvin(_ celsius: Double) -> Double {
        return celsius + 273.15
    }
    func kelvinToCelsius(_ kelvin: Double) -> Double {
        return kelvin - 273.15
    }
    func fahrenheitToKelvin(_ f: Double) -> Double {
        return celsiusToKelvin(fahrenheitToCelsius(f))
    }
    func kelvinToFahrenheit(_ k: Double) -> Double {
        return celsiusToFahrenheit(kelvinToCelsius(k))
    }
    
    if scale == "C" {
        print("\(temp) C = \(celsiusToFahrenheit(temp)) F, \(celsiusToKelvin(temp)) K")
    }
    if scale == "F" {
        print("\(temp) F = \(fahrenheitToCelsius(temp)) C, \(fahrenheitToKelvin(temp)) K")
    }
    if scale == "K" {
        print("\(temp) K = \(kelvinToCelsius(temp)) C, \(kelvinToFahrenheit(temp)) F")
    }
}

temperatureConverter(temp: 30, scale: "C")
temperatureConverter(temp: 86, scale: "F")
temperatureConverter(temp: 300, scale: "K")


//Problem 4: Shopping List Manager

func shoppingList() {
    var shoppingList = ["Milk", "Bread", "Eggs"]
    shoppingList.append("Butter")
    print("Shopping list: \(shoppingList)")
    shoppingList.remove(at: 1)
    print("After removal: \(shoppingList)")
}

//Problem 5: Word Frequency Counter
func wordFrequency(sentence: String) {
    let words = sentence.lowercased().components(separatedBy: " ")
    var frequency: [String: Int] = [:]
    for word in words {
        frequency[word, default: 0] += 1
    }
    print(frequency)
}


//Problem 6: Fibonacci Sequence
func fibonacci(_ n: Int) -> [Int] {
    if n <= 0 { return [] }
    if n == 1 { return [0] }
    var seq = [0, 1]
    while seq.count < n {
        seq.append(seq[seq.count-1] + seq[seq.count-2])
    }
    return seq
}
func problem6_Fibonacci(n: Int) {
    print(fibonacci(n))
}

//Problem 7: Grade Calculator
func grades(students: [String: Int]) {
    let scores = Array(students.values)
    let average = scores.reduce(0, +) / scores.count
    let maxScore = scores.max()!
    let minScore = scores.min()!
    print("Average = \(average), Max = \(maxScore), Min = \(minScore)")
    for (name, score) in students {
        let status = score >= average ? "above" : "below"
        print("\(name): \(score) (\(status) average)")
    }
}

//Problem 8: Palindrome Checker
func isPalindrome(_ text: String) -> Bool {
    let cleaned = text.lowercased().filter { $0.isLetter }
    return cleaned == String(cleaned.reversed())
}
func problem8_Palindrome(text: String) {
    print(isPalindrome(text))
}

//Problem 9: Simple Calculator
func problem9_Calculator(a: Double, b: Double, op: String) {
    func add(_ x: Double, _ y: Double) -> Double { return x + y }
    func sub(_ x: Double, _ y: Double) -> Double { return x - y }
    func mul(_ x: Double, _ y: Double) -> Double { return x * y }
    func div(_ x: Double, _ y: Double) -> Double { return y != 0 ? x / y : Double.nan }

    switch op {
    case "+": print(add(a, b))
    case "-": print(sub(a, b))
    case "*": print(mul(a, b))
    case "/": print(div(a, b))
    default: print("Invalid operation")
    }
}

//Problem 10: Unique Characters
func hasUniqueCharacters(_ text: String) -> Bool {
    var set: Set<Character> = []
    for ch in text {
        if set.contains(ch) { return false }
        set.insert(ch)
    }
    return true
}
func problem10_Unique(text: String) {
    print(hasUniqueCharacters(text))
}

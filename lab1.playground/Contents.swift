import UIKit

//step 1
let firstName: String = "Dariya"
let lastName: String = "Zhaxylykova"
//var age: Int = 20
let birthYear: Int = 2006
let currentYear : Int = 2025
var age: Int = currentYear - birthYear //bonus
var isStudent: Bool = true
var height: Double = 1.67


//step 2
var hobby: String = "Reading"
var numberOfHobbies: Int = 3
var hobbies: [String] = ["Coding", "Dancing", "Reading"]
let favouriteNumber: Int = 45
var isHobbyCreative: Bool = false
var favouriteShow: String = "Supernatural"
var favouriteBook: String = "The Frankenstein"

//step3
let studentStatus = isStudent ? "a student" : "not a student"
let hobbyType = isHobbyCreative ? "creative" : "not creative"
var lifeStory = "Hello! my name is \(firstName) \(lastName) and I am \(age) years old, born in \(birthYear) year. I am \(studentStatus). I am \(height) meters tall. I like \(hobby) and \(favouriteShow). My hobby is \(hobbyType). I like to read \(favouriteBook). In total I have \(numberOfHobbies) hobbies: \(hobbies). My favourite number is \(favouriteNumber). "

print(lifeStory)

//bonus
var futureGoals: String = "In the future I want to become iOS developer"
lifeStory += "\(futureGoals)"
print(lifeStory)

import UIKit

let constant0 = 10
var y = 10
var x = constant0 + y

let constant1: Int = 10
var number: Int = 10
var result: Int = number + constant1

var number2: Double = 10.5

var mess1 = "The best way to ge started is to stop talking and code."

var mess2 = "hello"
var mess3 = "world"
var mess4 = mess2 + " " +  mess3

mess1.uppercased()
var mess5 = mess1.uppercased()
var mess6 = mess5.lowercased()

mess1.count

var bookPrice = 39
var numOfCopies = 5
var totalPrice = bookPrice * numOfCopies
var totalPriceMessage = "The price of book is $" + String(totalPrice)
var totalPriceMessage1 = "The price of book is $\(totalPrice)"

//==============================

var timeYouWakeUp = 6

if timeYouWakeUp == 6{
    print("Cook yourself a big breakfast!")
}else{
    print("Go out for breakfast!")
}

switch timeYouWakeUp{
case 6:
    print("Cook yourself big breakfast!")
default:
    print("Go out for breakfast!")
}

//==============================

var book1 = "Tools of Titans"
var book2 = "Rework"
var book3 = "Your Move"

var bookCollection = ["Tool of Titans", "Rework", "Your Move"]
bookCollection[0]
bookCollection.append("Athority")
bookCollection.count

for index in 0...3{
    print(bookCollection[index])
}

for book in bookCollection{
    print(book)
}

var bookCollection1 = [10: "Tool of Titans",20: "Rework",30: "Your Move"]
bookCollection1[10]

var emojiDict = ["Ghost": "👻", "Poop":"💩","Angry":"😤","Scream":"😱","Alien monster":"👾"]

var wordToLookup = "Ghost"
var meaning = emojiDict[wordToLookup]

print(meaning!) // un safy way

if let meaning = meaning {  // optinal binding --> safe way
    print(meaning)
}

var jobTitle: String?

jobTitle = "IOS developer"

//var message_optional = "Your job title is " + jobTitle

if jobTitle != nil{
    var message_optional = "Your job title is " + jobTitle!
}

if let jobTitleWithValue = jobTitle {
    var message_optinal = "Your job title is " + jobTitleWithValue
}else{
    print("no")
}

if let jobTitle = jobTitle {
    var message_optinal = "Your job title is " + jobTitle
}else{
    print("no")
}


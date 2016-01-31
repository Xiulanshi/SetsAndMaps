//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

/*
1) For each of these hash functions, say whether they are good, bad, or invalid. Justify your answer. Supply an example of a collision if you can.


//a)
func hash(s: String) -> Int {
// Character code of first letter
return Int(s.unicodeScalars.first!.value)
}

//Bad: any two strings with the same first letter collide; 
hash("foo") == hash("fritter")


//b)
func hash<T>(obj: T) -> Int {
    return 123
}

//Really bad" everything collides.
hash(1)
hash("foo")
hash([1, 2, 3])

//c)
func hash1(s: String) -> Int {
// Sum of all character codes in s
return Int(s.unicodeScalars.map{$0.value}.reduce(0, combine: {$0 + $1}))
}

// kinda bad: anagrams collide. 
hash("hello")
hash("helol")



//d)
func hash2(s: String) -> Int {
return Int(s.unicodeScalars.map{$0.value}.reduce(0, combine: {$0 + 256 * $1}))
}

//good: additional multiplication solves above collision

"Hello".nulTerminatedUTF8




//e)
//func hash(p: Person) -> Int {
//return p.age
//}

//bad: any two people with the same age collide


//f)
func hash3(date: NSDate) -> Int {
return Int(date.timeIntervalSinceNow)
}
//Invalid: depends on current time, so might not be equal for two equal dates
//hash(NSDate.init(string:"2016-01-31 10:45:32 + 06:00"!))
*/
/*
2) Use our set implementation from in class to write a simple spellCheck function that returns true if the string has no spelling errors. Use a dictionary of 6 words, and test your method both with a string that passes and a string that fails

protocol SetProtocol {
    typealias ItemType
    mutating func add(item: ItemType)
    mutating func remove(item: ItemType)
    func contains(item: ItemType) -> Bool
}

func hash(x: String) -> Int {
    return Int(x.unicodeScalars.first!.value)
}

struct StringHashSet: SetProtocol, CustomStringConvertible {
    private var elements = [String?](count: 128, repeatedValue: nil)
    // SetProtocol
    typealias ItemType = String
    mutating func add(item: String) {
        elements[hash(item)] = item
    }
    mutating func remove(item: String) {
        elements[hash(item)] = nil
    }
    func contains(item: String) -> Bool {
        return elements[hash(item)] == item
    }
    // CustomStringConvertible
    var description: String {
        return "{\(elements.filter{$0 != nil}.map{$0!})}"
    }
}

var spellDict = StringHashSet()

for word in ["the", "quick", "brown", "fox", "jumps", "over"] {
    spellDict.add(word)
}

spellDict

func spellCheck(str: String) -> Bool {
    for word in str.componentsSeparatedByString(" ") {
        if !spellDict.contains(word) {
            return false
        }
    }
    return true
}

spellCheck("the quick brown fox jumps over fox brown jumps quick")
spellCheck("the quick brwon fox jumps over fox brown jumps quick")
*/
var spellDict = Set<String>()

for word in ["the", "quick", "brown", "fox", "jumps", "over", "truck"] {
    spellDict.insert(word)
}

spellDict

func spellCheck(str: String) -> Bool {
    for word in str.componentsSeparatedByString(" ") {
        if !spellDict.contains(word) {
            return false
        }
    }
    return true
}

spellCheck("the quick brown truck jumps over fox brown jumps quick")
spellCheck("the quick brwon truck jumps over fox brown jumps quick")

/*
3) Rewrite spellCheck using a built-in Swift set.


4) Choose two of the set to set operations from the slides and write them for ArraySet (without duplicate checking)

func union<T>(a: ArraySet<T>, with b: ArraySet<T>) -> ArraySet<T> { }
func intersect<T>(a: ArraySet<T>, with b: ArraySet<T>) -> ArraySet<T> { }
func difference(a: ArraySet<T>, with b: ArraySet<T>) -> ArraySet<T> { }
func subset(a: ArraySet<T>, isSubsetOf b: ArraySet<T>) -> Bool { }

*/

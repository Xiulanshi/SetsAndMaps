//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

/*
1) For each of these hash functions, say whether they are good, bad, or invalid. Justify your answer. Supply an example of a collision if you can.
*/

//a)
func hash(s: String) -> Int {
// Character code of first letter
return Int(s.unicodeScalars.first!.value)
}

//good
var example = "Hello"
print(hash(example))


//b)
func hash<T>(obj: T) {
//    return 123;
}

//invalid

//c)
func hash1(s: String) -> Int {
// Sum of all character codes in s
return Int(s.unicodeScalars.map{$0.value}.reduce(0, combine: {$0 + $1}))
}

print(hash1(example))



//d)
func hash2(s: String) -> Int {
return Int(s.unicodeScalars.map{$0.value}.reduce(0, combine: {$0 + 256 * $1}))
}

print(hash2(example))


//e)
//func hash(p: Person) -> Int {
//return p.age
//}

//Invalid


//f)
func hash3(date: NSDate) -> Int {
return Int(date.timeIntervalSinceNow)
}
//Invalid

/*
2) Use our set implementation from in class to write a simple spellCheck function that returns true if the string has no spelling errors. Use a dictionary of 6 words, and test your method both with a string that passes and a string that fails
*/
func spellCheck(str: String) -> Bool {
//    if
    return true
}
spellCheck("the quick brown fox jumps over fox brown jumps quick")
spellCheck("the quick brwon fox jumps over fox brown jumps quick")

/*
3) Rewrite spellCheck using a built-in Swift set.


4) Choose two of the set to set operations from the slides and write them for ArraySet (without duplicate checking)

func union<T>(a: ArraySet<T>, with b: ArraySet<T>) -> ArraySet<T> { }
func intersect<T>(a: ArraySet<T>, with b: ArraySet<T>) -> ArraySet<T> { }
func difference(a: ArraySet<T>, with b: ArraySet<T>) -> ArraySet<T> { }
func subset(a: ArraySet<T>, isSubsetOf b: ArraySet<T>) -> Bool { }

*/
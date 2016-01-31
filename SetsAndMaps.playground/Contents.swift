//: Playground - noun: a place where people can play

import UIKit

/*
var primaryColors: Set<String> = ["red", "green"]
primaryColors.insert("blue")

var secondaryColors: Set<String> = ["yellow", "cyan"]

var myFavoriteColors: Set<String> = ["red", "yellow"]

let allColors = primaryColors.union(secondaryColors)

primaryColors.intersect(myFavoriteColors)

allColors.subtract(secondaryColors)

allColors.isSubsetOf(secondaryColors)

secondaryColors.isSubsetOf(myFavoriteColors)

secondaryColors.isDisjointWith(primaryColors)

secondaryColors.intersect(primaryColors).isEmpty

myFavoriteColors.isDisjointWith(primaryColors)
*/

/*
protocol SetProtocol {
    typealias ItemType
    mutating func add(item: ItemType)
    mutating func remove(item: ItemType)
    func contains(item: ItemType) -> Bool
}

struct ArraySet<T: Equatable>: SetProtocol, CustomStringConvertible {
    var elements = [T]()
    //Set Protocol
    typealias ItemType = T
    mutating func add(item: T) {
        if !contains(item) {
        elements.append(item)
        }
    }
    
    mutating func remove(item: T) {
        if let idx = elements.indexOf(item) {
            elements.removeAtIndex(idx)
        }
    }
//    mutating func remove(item: T) {
//        elements.removeAtIndex(elements.indexOf(item)!)
//    }
    
    func contains(item: T) -> Bool {
        for element in elements {
            if element == item {
                return true
            }
        }
        return false
    }
    
//    func contains(item: T) -> Bool {
//        return elements.contains(item)
//    }
    //CustomStringConvertible
    var description: String {
        return "{\(elements)}"
    }
    
}


var colors = ArraySet<String>()
colors.add("blue")
colors.contains("blue")
colors.contains("red")
colors.add("green")
colors.add("orange")

colors.remove("blue")
colors.contains("blue")

colors.add("brown")
colors.add("brown")

colors.remove("brown")
colors.remove("not present")

*/

//"Hello".nulTerminatedUTF8
//
//"Hello".unicodeScalars.first!.value
//"Hello".unicodeScalars.first?.value

/*
func hash(x: String) -> Int {
    return Int(x.unicodeScalars.first!.value)
}

hash("Hello")
hash("Goodbye")
hash("Rock")
hash("Pop")
hash("R&B")

"Hello".hashValue
"R&B".hashValue

*/

/*
protocol SetProtocol {
    typealias ItemType
    mutating func add(item: ItemType)
    mutating func remove(item: ItemType)
    func contains(item: ItemType) -> Bool
}
func hash(x: String) -> Int {
    return Int(x.unicodeScalars.first!.value)
}

//struct StringHashSet: SetProtocol {
//    // SetProtocol
//    typealias ItemType = String
//    mutating func add(item: String) { }
//    mutating func remove(item: String) { }
//    func contains(item: String) -> Bool { return false }
//}

struct StringHashSet: SetProtocol,CustomStringConvertible {
    var elements = [String?](count: 128, repeatedValue: nil)
    // SetProtocol
    typealias ItemType = String
    mutating func add(item: String) {
       elements[hash(item)] = item
    }
    mutating func remove(item: String) {
        elements[hash(item)] = nil
    }
    func contains(item: String) -> Bool { return false }
    
    //CustomStringConvertible
    var description: String {
        return "{\(elements.filter{$0 != nil}.map{$0!})}"
    }
}

var genres = StringHashSet()

genres.add("Rock")
genres.add("Pop")
genres.add("Pop")
genres.add("Funk")

//print(genres.elements.filter{$0 != nil})

genres.contains("Rock")

/*
let items = ["Aardvark", "Adam", "Apple", "Bear", "Cat"]

func startsWithA(item: String) -> Bool {
    return item.characters.first! == Character("A")
}

startsWithA("Apple")
startsWithA("Bear")

items.filter(startsWithA)

print(items.filter({ (item) in item.characters.first! == Character("A")}))

print(items.filter({ $0.characters.first! == Character("A")}))

func dropFirstChar(s: String) -> String {
    return String(s.characters.dropFirst())
}
dropFirstChar("Apple")

*/


let furniture = ["Chair", "Desk", "Lamp", "Table", "Ottoman", "sofa", "bed"]

print(furniture.filter{$0.characters.count > 4})

print(furniture.map{$0.characters.count})


func numberOfcharacters(item: String) -> Int {
    return item.characters.count
}

print(furniture.map(numberOfcharacters))

print(furniture.map{$0.characters.count})

print(furniture.reduce("", combine: {$0 + $1}))

*/

/*

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
    var elements = [String?](count: 128, repeatedValue: nil)
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

var genres = StringHashSet()

genres.add("Pop")
genres.add("Pop")
genres.add("Rock")
genres.add("Funk")

genres.contains("Rock")
genres.contains("Western")

genres.remove("Pop")
genres.contains("Pop")

genres.add("R&B") // Uh-oh

*/
/*
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
    private var elements: [String?]
    
    init(capacity: Int) {
        elements = [String?](count: capacity, repeatedValue: nil)
    }
    
    // SetProtocol
    typealias ItemType = String
    mutating func add(item: String) {
        let hashValue = hash(item)
        if (contains(item)) { return }
        for i in 0..<elements.count {
            if (elements[(hashValue + i) % elements.count] == nil) {
                elements[(hashValue + i) % elements.count] = item
                return
            }
        }
        print("Out of room!")
    }
    mutating func remove(item: String) {
        
    }
    func contains(item: String) -> Bool {
        let hashValue = hash(item)
        for i in 0..<elements.count {
            if let element = elements[(hashValue + i) % elements.count] {
                if (element == item) {
                    return true
                }
            } else {
                return false
            }
        }
        return false
    }
    // CustomStringConvertible
    var description: String {
        return "{\(elements.filter{$0 != nil}.map{$0!})}"
        //return "{\(elements)}"
    }
}

var genres = StringHashSet(capacity: 16)

genres.add("Pop")
genres.add("Pop")
genres.add("Rock")
genres.add("R&B")
genres.add("Funk")

genres.contains("Rock")
genres.contains("Western")

//genres.remove("Pop")
genres.contains("Pop")
*/


protocol MapProtocol {
    typealias KeyType
    typealias ValueType
    subscript(k: KeyType) -> ValueType? {get set}
    mutating func remove(k: KeyType)
}

// An array of elements where each element is
//    An array of elements where each element is
//        A tuple of K, V

struct HashMap<K: Hashable, V>: MapProtocol, CustomStringConvertible {
    var table: [[(K, V)]]
    init(capacity: Int = 8) {
        table = [[(K, V)]](count: capacity, repeatedValue: [])
    }
    // MapProtocol
    typealias KeyType = K
    typealias ValueType = V
    subscript(k: K) -> V? {
        get {
            let hashValue = abs(k.hashValue % table.count)
            for item in table[hashValue] {
                if (item.0 == k) {
                    return item.1
                }
            }
            //return table[hashValue].filter({$0.0 == k}).first?.1
            return nil
        }
        
        set(v) {
            let hashValue = abs(k.hashValue % table.count)
            table[hashValue].append((k, v!))
        }
    }
    
    mutating func remove(k: K) {
        let hashValue = abs(k.hashValue % table.count)
        if let idx = table[hashValue].indexOf({$0.0 == k}) {
            table[hashValue].removeAtIndex(idx)
        }
    }
    
    // CustomStringConvertible
    var description: String {
        var str = ""
        for entry in table {
            str += "\(entry)"
            str += "\n"
        }
        return str
    }
}

var nicknames = HashMap<String, String>()

nicknames["Michael"] = "Mike"
nicknames["Barbara"] = "Babs"
nicknames["Janet"] = "Jenny"
nicknames["Matthew"] = "Matt"
nicknames["Fredrick"] = "Fred"
print(nicknames)

nicknames["Michael"]

nicknames.remove("Michael")
nicknames["Michael"]

//struct HashMap<K, V>: MapProtocol {
//    //MapProtocol
//    typealias KeyType = K
//    typealias ValueType = V
//    subscript(k: K) -> V? {
//        get {
//            return "Hi" as? V
//        }
//        set(v) {
//            
//        }
//    }
//    mutating func remove(k: K) {
//        
//    }
//
//}

//var nickNames = HashMap<String, String>()
//
//nickNames["Michael"] = "Mike" //nicknames.subscript("Michael") = "Mike"
//nickNames["Michael"]          //nicknames.subscript("Michael")
//
//var nickNames = Dictionary<String, String>()
//
//nickNames["Michael"] = "Mike"
//nickNames["Margaret"] = "Peggy"
//nickNames["William"] = "Bill"
//
//nickNames["Michael"]
//
//nickNames
//
//  main.swift
//  OopDemos
//
//  Created by Doncho Minkov on 3/15/17.
//  Copyright © 2017 Doncho Minkov. All rights reserved.
//

import Foundation

typealias A = Animal

//let namelessAnimal = Animal()
//namelessAnimal.sayName()
//
//let gosho = Animal(withName: "G", andAge: 17)
//gosho.name = "Gesha"
//
//gosho.name = "Gosho 2"
//print(gosho.name)

//gosho.sayName()
//animal.age = 5
//animal.name = "Sharo"
//
//class DerivedAnimal: Animal {
//    
//}
//
//let animals: [Animal] = [
//    Animal(),
//    DerivedAnimal(),
//    Cat(withName: "Gosho",
//        age: 3,
//        andGender: .other),
//    WildCat(withName: "Goshka",
//        age: 5,
//        andGender: .female)
//]
//for a in animals {
//    a.sayName()
//}

//
//
//
//let cat = Cat(withName: "Stamat",
//              age: 2,
//              andGender: .male)
//
//cat.sayName()
//
//let mauables: [Mauable] = [
//    Cat(withName: "Gosho", age: 2, gender: .male, andMausCount: 5),
//    WildCat(withName: "Goshka", age: 3, andGender: .female),
//    Cat(withName: "John", age: 5, andGender: .other)
//]
//
//for mauable in mauables {
//    mauable.mau()
//}

let animal = Cat(withName: "Pesho",
                 age: 3,
                 andGender: .male)
print(animal.toDict())

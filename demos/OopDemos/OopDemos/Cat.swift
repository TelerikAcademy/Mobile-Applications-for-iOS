//
//  Cat.swift
//  OopDemos
//
//  Created by Doncho Minkov on 3/15/17.
//  Copyright © 2017 Doncho Minkov. All rights reserved.
//

import Foundation

enum Gender {
    case male
    case female
    case other
}

class Cat: Animal, Mauable {
    var gender: Gender
    var mausCount: Int
    
    convenience init(withName name: String,
         age: Int,
         andGender gender: Gender){
        self.init(withName : name,
                  age: age,
                  gender: gender,
                  andMausCount: 4)
    }
    
    init(withName name: String,
         age: Int,
         gender: Gender,
         andMausCount mausCount: Int) {
        self.gender = gender;
        self.mausCount = mausCount
        super.init(withName: name, andAge: age)
    }
    
    override func sayName() {
        print("Mau")
        super.sayName()
    }
    
    func mau() {
        var mausString = ""
        
        for _ in 0..<self.mausCount {
            mausString += "mau "
        }
        
        print(mausString)
    }
    
    //    func mau(){
    //        print("Mau mau")
    //    }
}

class WildCat : Cat {
    
}

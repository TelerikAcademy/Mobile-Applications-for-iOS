//
//  File.swift
//  OopDemos
//
//  Created by Doncho Minkov on 3/15/17.
//  Copyright © 2017 Doncho Minkov. All rights reserved.
//

import Foundation

let name = "Gosho"

class Animal {
    var name: String {
        willSet(newName) {
            if(newName.characters.count < 3){
                fatalError()
            }
            
            print("Setting value \(newName)")
        }
        
        didSet(o){
            print("Value \(o) set")
        }
    }
    
    var age: Int = 0
    
    convenience init() {
        
        self.init(withName: "[Pesho]", andAge: 0);
    }
    
    init(withName name: String, andAge age: Int){
        self.name = name
        self.age = age
    }
    
    func sayName() {
        print("I am \(self.name)")
    }
}

//
//  Superhero.swift
//  SQLiteExplore
//
//  Created by Doncho Minkov on 3/27/17.
//  Copyright © 2017 Doncho Minkov. All rights reserved.
//

import Foundation

class Superhero {
    var id: Int64
    var name: String?
    var secretIdentity: String?
    
    convenience init(withName name: String, andSecretIdentity secretIdentity: String) {
        let id =  Int64(arc4random())
        self.init(withId: id, name: name, andSecretIdentity: secretIdentity)
    }
    
    init(withId id: Int64, name: String, andSecretIdentity secretIdentity: String){
        self.id = id
        self.name = name
        self.secretIdentity = secretIdentity
    }
}

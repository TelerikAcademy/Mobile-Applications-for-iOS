//
//  Superhero.swift
//  SuperheroesApp
//
//  Created by Doncho Minkov on 3/31/17.
//  Copyright © 2017 Doncho Minkov. All rights reserved.
//

import UIKit

class Superhero {
    var id: String
    var name: String
    var secretIdentity: String
    
    var image: UIImage?
    
    var imgUrl: String
    
    convenience init(withName name: String,
         secretIdentity: String,
         andImageUrl imgUrl: String) {
        self.init(withId: "sh-\(arc4random())",
            name: name,
            secretIdentity: secretIdentity,
            andImageUrl: imgUrl)
    }
    init(withId id: String,
         name: String,
         secretIdentity: String,
         andImageUrl imgUrl: String) {
        self.id = id
        self.name = name
        self.secretIdentity = secretIdentity
        self.imgUrl = imgUrl
    }

}

//
//  SuperheroesData.swift
//  SuperheroesApp
//
//  Created by Doncho Minkov on 3/31/17.
//  Copyright © 2017 Doncho Minkov. All rights reserved.
//

import UIKit

class SuperheroesData: HttpRequesterDelegate  {
    var http: HttpRequester?
    
    var delegate: SuperheroesDataDelegate?
    
    init() {
        http = HttpRequester()
        http?.delegate = self
    }
    
    var superheroesUrl: String {
        get {
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            return "\(appDelegate.baseUrl)/superheroes"
        }
    }
    
    func getAll() {
        self.http?.get(fromUrl: self.superheroesUrl)
    }
    
    func didReceive(data: Any) {
        let superheroes = (data as! [Dictionary<String, Any>])
            .map() {Superhero(withDict: $0)}
        
        delegate?.didReceivedAll(superheroes: superheroes)
    }
}

//
//  DiConfig.swift
//  SQLiteExplore
//
//  Created by Doncho Minkov on 3/27/17.
//  Copyright © 2017 Doncho Minkov. All rights reserved.
//

import Foundation

import Swinject
import SwinjectStoryboard

let dbPath:String = {
    let documentsDir = NSSearchPathForDirectoriesInDomains(.documentDirectory,
                                                           .userDomainMask, true)[0]
    print(documentsDir)
    return "\(documentsDir)/superheroes.db"
}()

class DiConfigData {
    public static func setup(container: Container){
        container.register(BaseSuperheroesData.self) {_ in
            return SuperheroesData(withPath: dbPath)
        }
    }
}

class DiConfigViewControllers {
    public static func setup(container: Container) {
        container.storyboardInitCompleted(ViewController.self) { (r:Resolver, c: ViewController) in
            var data = r.resolve(BaseSuperheroesData.self)
            c.data = data
            data?.delegate = c
        }
    }
}

extension SwinjectStoryboard {
    public static func setup() {
        DiConfigData.setup(container: defaultContainer)
        DiConfigViewControllers.setup(container: defaultContainer)
    }
}

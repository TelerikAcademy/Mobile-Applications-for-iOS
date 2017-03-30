//
//  BaseData.swift
//  SQLiteExplore
//
//  Created by Doncho Minkov on 3/27/17.
//  Copyright © 2017 Doncho Minkov. All rights reserved.
//

import Foundation

protocol BaseSuperheroesData {
    var delegate: SuperheroesDataDelegate? {get set}
    
    func getAll()
}

//
//  SuperheroesDataDelegate.swift
//  SuperheroesApp
//
//  Created by Doncho Minkov on 3/31/17.
//  Copyright © 2017 Doncho Minkov. All rights reserved.
//

import UIKit

protocol SuperheroesDataDelegate {
    func didReceivedAll(superheroes: [Superhero])
}

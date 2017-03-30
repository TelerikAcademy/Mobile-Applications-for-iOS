//
//  Mauable.swift
//  OopDemos
//
//  Created by Doncho Minkov on 3/15/17.
//  Copyright © 2017 Doncho Minkov. All rights reserved.
//

import Foundation

protocol Mauable {
    var mausCount: Int {get}
    
    func mau() -> Void
}

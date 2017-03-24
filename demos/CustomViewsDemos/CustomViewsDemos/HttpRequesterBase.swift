//
//  httpRequesterBase.swift
//  DependencyInjectionDemos
//
//  Created by Doncho Minkov on 3/24/17.
//  Copyright © 2017 Doncho Minkov. All rights reserved.
//

import Foundation

protocol HttpRequesterBase {
    var delegate: HttpRequesterDelegate? {get set}
    
    func get(fromUrl urlString: String, withHeaders headers: Dictionary<String, String>?)
    
    func post(toUrl urlString: String, withBody body: Any, andHeaders headers: Dictionary<String, String>?)
    
    func postJson(toUrl urlString: String, withBody body: Any, andHeaders headers: Dictionary<String,String>?)
}

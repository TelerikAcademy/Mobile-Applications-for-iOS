//
//  HttpRequesterDelegate.swift
//  DependencyInjectionDemos
//
//  Created by Doncho Minkov on 3/24/17.
//  Copyright © 2017 Doncho Minkov. All rights reserved.
//

import Foundation

protocol HttpRequesterDelegate {
    func didCompleteGet(result: Data)
    func didCompletePost(result: Any)
}

extension HttpRequesterDelegate {
    func didCompleteGet(result: Any) {
        
    }
    
    func didCompletePost(result: Any) {
        
    }
}

//
//  HttpRequesterDelegate.swift
//  HttpDemos
//
//  Created by Doncho Minkov on 3/22/17.
//  Copyright © 2017 Doncho Minkov. All rights reserved.
//

import UIKit

protocol HttpRequesterDelegate {
    func didReceiveData(data: Any)
    func didReceiveError(error: HttpError)
    func didDeleteData()
}

extension HttpRequesterDelegate {
    func didReceiveData(data: Any) {
        
    }
    
    func didReceiveError(error: HttpError) {
        
    }
    
    func didDeleteData() {
        
    }
}

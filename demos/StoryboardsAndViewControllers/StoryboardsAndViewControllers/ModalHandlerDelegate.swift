//
//  ModalHandler.swift
//  StoryboardsAndViewControllers
//
//  Created by Doncho Minkov on 3/17/17.
//  Copyright © 2017 Doncho Minkov. All rights reserved.
//

import UIKit

protocol ModalHandlerDelegate {
    func ok(data: Any)
    
    func cancel()
}

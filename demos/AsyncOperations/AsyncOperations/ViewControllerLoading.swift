//
//  ViewControllerLoading.swift
//  AsyncOperations
//
//  Created by Doncho Minkov on 3/20/17.
//  Copyright © 2017 Doncho Minkov. All rights reserved.
//

import UIKit

var loading = UIActivityIndicatorView()

extension UIViewController {
    func showLoading(){
        loading.frame = self.view.frame
        loading.activityIndicatorViewStyle = .whiteLarge
        loading.backgroundColor = .black
        self.view.addSubview(loading)
        loading.startAnimating()
    }
    
    func hideLoading(){
        loading.stopAnimating()
        loading.removeFromSuperview()
    }
}

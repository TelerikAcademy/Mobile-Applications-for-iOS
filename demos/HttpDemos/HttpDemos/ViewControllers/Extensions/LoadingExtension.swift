//
//  LoadingExtension.swift
//  HttpDemos
//
//  Created by Doncho Minkov on 3/22/17.
//  Copyright © 2017 Doncho Minkov. All rights reserved.
//

import UIKit

var loadingScreen = UIActivityIndicatorView()

extension UIViewController {
    func showLoadingScreen() {
        loadingScreen.frame = self.view.frame
        loadingScreen.activityIndicatorViewStyle = .whiteLarge
        loadingScreen.backgroundColor = .gray
        self.view.addSubview(loadingScreen)
        loadingScreen.startAnimating()
    }
    
    func hideLoadingScreen() {
        loadingScreen.stopAnimating()
        loadingScreen.removeFromSuperview()
    }
}

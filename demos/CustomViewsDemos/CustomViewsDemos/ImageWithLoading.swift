//
//  ImageWithLoading.swift
//  CustomViewsDemos
//
//  Created by Doncho Minkov on 3/24/17.
//  Copyright © 2017 Doncho Minkov. All rights reserved

import UIKit

class ImageWithLoading: UIView, HttpRequesterDelegate {
    private var loadingView: UIActivityIndicatorView?
    private var imageView: UIImageView?
    private var http: HttpRequester?
    
    var imageUrl: String? {
        willSet (imageUrl) {
            self.initialize()
            
            DispatchQueue.main.async {
                self.loadingView?.isHidden = false
                self.imageView?.isHidden = true
                self.loadingView?.startAnimating()
            }
            
            // if imageUrl starts with http....
            // then use http
            // else
            // ....
            
            let timeout = DispatchTime.now() + .seconds(3)
            DispatchQueue.main.asyncAfter(deadline: timeout){
                self.http?.get(fromUrl: imageUrl!, withHeaders: nil)
            }
        }
    }
    
    func initialize(){
        if(http == nil) {
            self.http = HttpRequester()
            self.http?.delegate = self
        }
        
        if(self.loadingView == nil) {
            self.loadingView = UIActivityIndicatorView(frame: self.frame)
            self.loadingView?.isHidden = false
            self.loadingView?.activityIndicatorViewStyle = .gray
            self.addSubview(self.loadingView!)
        }
        
        if(self.imageView == nil) {
            self.imageView = UIImageView(frame: self.frame)
            self.imageView?.isHidden = true
            self.addSubview(self.imageView!)
        }
    }
    
    func didCompleteGet(result: Data) {
        DispatchQueue.main.async {
            self.imageView?.image = UIImage(data: result)
            self.loadingView?.isHidden = true
            self.imageView?.isHidden = false
            self.loadingView?.stopAnimating()
        }
    }
}

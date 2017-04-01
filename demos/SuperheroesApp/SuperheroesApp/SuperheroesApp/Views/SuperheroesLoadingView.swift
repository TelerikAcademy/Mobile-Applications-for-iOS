//
//  SuperheroesLoadingView.swift
//  SuperheroesApp
//
//  Created by Doncho Minkov on 3/31/17.
//  Copyright © 2017 Doncho Minkov. All rights reserved.
//

import UIKit
import CoreGraphics

class SuperheroesLoadingView: UIView {
    var imageView: UIImageView?
    var dimView: UIView?
    
    var imagesUrls: [String]?
    var images: [UIImage]?
    
    var animationBar: UIView?
    var textLabel: UILabel?
    
    var loadingText: String = "Loading..."
    var isLoading = false
    
    func startLoading(){
        isLoading = true
        isHidden = false
        loadImages()
        
        initializeDimView()
        initializeAnimationBar()
        initializeImageView()
        initializeTextLabel()
        
        resetConstaints()
        
        textLabel?.text = loadingText
        scale = 0.9
        let firstImage = images?[1]
        imageView?.image = firstImage
        animate()
    }
    
    func stopLoading() {
//        isHidden = true
        isLoading = false
        UIView.animate(withDuration: 2, animations: { 
            self.layer.opacity = 0
        }, completion: { animated in
            self.isHidden = true
            self.layer.opacity = 1
        })
    }
    
    var imageIndex = 0
    var scale: CGFloat = 0.9
    var updateDir: CGFloat = -1
    let update: CGFloat = 0.05
    let animationTimeout = 50
    
    func animate() {
        if !isLoading {
            return
        }
        
        if scale < 0 {
            imageIndex +=  1
            imageIndex = imageIndex % (images?.count)!
            imageView?.image = self.images?[imageIndex]
        }
        
        if scale < 0 || scale > 1 {
            updateDir *= -1
            scale = scale + (0.1 * self.updateDir)
        }
        
        let timeout = DispatchTime.now() + .milliseconds(animationTimeout)
        weak var weakSelf = self
        DispatchQueue.main.asyncAfter(deadline: timeout) {
            let scale = (weakSelf?.scale)!
            weakSelf?.imageView?.transform = CGAffineTransform(scaleX: scale, y: 1)
            
            weakSelf?.scale = scale + ((weakSelf?.update)! * (weakSelf?.updateDir)!)
            weakSelf?.animate()
        }
    }
    
    private func loadImages() {
        images = [
            #imageLiteral(resourceName: "batman"),
            #imageLiteral(resourceName: "superman"),
            #imageLiteral(resourceName: "wonder-woman"),
            #imageLiteral(resourceName: "green-lantern"),
            #imageLiteral(resourceName: "flash")
        ]
        //        , ##imageLiteral(resourceName: "flash"), ##imageLiteral(resourceName: "green-lantern"), ##imageLiteral(resourceName: "superman")
    }
    
    var needConstraints = false
    
    func initializeDimView(){
        if(dimView == nil) {
            needConstraints = true
            dimView = UIView(frame: frame)
            dimView?.backgroundColor = UIColor(colorLiteralRed: 0, green: 0, blue: 0, alpha: 0.4)
            
            addSubview(dimView!)
        }
    }
    func initializeAnimationBar() {
        if(animationBar == nil) {
            needConstraints = true
            animationBar = UIView(frame: CGRect(
                x: 0,
                y: frame.height - 150,
                width: frame.width,
                height: 150
            ))
//            animationBar = UIView()
            animationBar?.backgroundColor = UIColor(colorLiteralRed: 1, green: 1, blue: 1, alpha: 0.4)
            addSubview(animationBar!)
        }
    }
    func initializeImageView() {
        if(imageView == nil) {
            needConstraints = true
            imageView = UIImageView(frame: CGRect(
                x: 0,
                y: frame.maxY - 100,
                width: 100,
                height: 100))
            //            imageView?.backgroundColor = UIColor(colorLiteralRed: 1, green: 1, blue: 1, alpha: 0.4)
            addSubview(imageView!)
        }
    }
    
    func initializeTextLabel() {
        if(textLabel == nil) {
            needConstraints = true
            textLabel = UILabel(frame: CGRect(
                x: 120,
                y: frame.maxY - 100,
                width: 100,
                height: 100))
            textLabel?.font = UIFont(name: "Arial", size: 20)
            textLabel?.textColor = .white
            addSubview(textLabel!)
        }
    }
    
    func resetConstaints() {
        removeConstraints(constraints)
        
        let constaintMiddleYImageView = NSLayoutConstraint(item: imageView!, attribute: .centerY,
                                           relatedBy: .equal,
                                           toItem: animationBar, attribute: .centerY,
                                           multiplier: 1, constant: 0)
        
        let constaintMiddleYTextLabel = NSLayoutConstraint(item: textLabel!, attribute: .centerY,
                                                           relatedBy: .equal,
                                                           toItem: animationBar, attribute: .centerY,
                                                           multiplier: 1, constant: 0)
        
        addConstraints([constaintMiddleYImageView, constaintMiddleYTextLabel])
        
        
//        addBottomConstraint(item: animationBar!)
//        addLeadingConstraint(item: animationBar!)
//        addTrailingConstraint(item: animationBar!)
//        
        // imageView: bottom, left, height
        // textLabel: left of imageView, bottom, right, height
    }
    
    func addTopConstraint(item: UIView, toItem: UIView? = nil) {
        let toItemView = (toItem == nil)
            ? self
            : toItem
        let constraint = NSLayoutConstraint(item: item, attribute: .top,
                                            relatedBy: .equal,
                                            toItem: toItemView, attribute: .top,
                                            multiplier: 1, constant: 0)
        addConstraint(constraint)
    }
    
    func addBottomConstraint(item: UIView, toItem: UIView? = nil) {
        let toItemView = (toItem == nil)
            ? self
            : toItem
        let constraint = NSLayoutConstraint(item: item, attribute: .bottom,
                                            relatedBy: .equal,
                                            toItem: toItemView, attribute: .bottom,
                                            multiplier: 1, constant: 0)
        addConstraint(constraint)
    }
    
    func addLeadingConstraint(item: UIView, toItem: UIView? = nil) {
        let toItemView = (toItem == nil)
            ? self
            : toItem
        let constraint = NSLayoutConstraint(item: item, attribute: .leading,
                                            relatedBy: .equal,
                                            toItem: toItemView, attribute: .leading,
                                            multiplier: 1, constant: 0)
        addConstraint(constraint)
    }
    
    func addTrailingConstraint(item: UIView, toItem: UIView? = nil) {
        let toItemView = (toItem == nil)
            ? self
            : toItem
        let constraint = NSLayoutConstraint(item: item, attribute: .trailing,
                                            relatedBy: .equal,
                                            toItem: toItemView, attribute: .trailing,
                                            multiplier: 1, constant: 0)
        addConstraint(constraint)
    }
    
    func addHeightConstraint(item: UIView, height: CGFloat, toItem: UIView? = nil) {
        let toItemView = (toItem == nil)
            ? self
            : toItem
        let constraint = NSLayoutConstraint(item: item, attribute: .height,
                                            relatedBy: .equal,
                                            toItem: toItemView, attribute: .height,
                                            multiplier: 1, constant: height)
        addConstraint(constraint)
    }
    
}

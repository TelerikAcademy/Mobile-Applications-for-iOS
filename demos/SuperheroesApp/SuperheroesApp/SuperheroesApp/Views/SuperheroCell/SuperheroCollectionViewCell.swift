//
//  SuperheroCollectionViewCell.swift
//  SuperheroesApp
//
//  Created by Doncho Minkov on 3/31/17.
//  Copyright © 2017 Doncho Minkov. All rights reserved.
//

import UIKit
import CoreGraphics

class SuperheroCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var dimView: UIView!
    @IBOutlet weak var btnAddToFavorites: UIButton!
    
    var longPressGesture: UILongPressGestureRecognizer?
    
    var btnText = "+"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        addLabelConstraints()
        addImageViewConstraints()
        addImageDimViewConstraints()
        addBtnAddToFavoritesConstraints()
        
        btnAddToFavorites?.isHidden = true
        
        longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(showHideBtnAddToFavorites))
        btnAddToFavorites.addTarget(self, action: #selector(addRemoveFromFavorites), for: .touchUpInside)
        addGestureRecognizer(longPressGesture!)
    }
    
    func showHideBtnAddToFavorites(withHiding isHiding: Bool = false) {
        removeGestureRecognizer(longPressGesture!)
        btnAddToFavorites.isUserInteractionEnabled = true
        btnAddToFavorites?.isHidden = false
        //        btnAddToFavorites.layer.opacity = 0
        //        btnAddToFavorites.frame.size = CGSize(width: 100, height: 0)
        
        let initialX =
            isHiding
                ? self.frame.width - self.btnAddToFavorites.frame.width
                : self.frame.width
        
        let finalX =
            isHiding
                ? self.frame.width
                :self.frame.width - self.btnAddToFavorites.frame.width
        
        btnAddToFavorites.frame.origin = CGPoint(x: initialX, y: 0)
        UIView.animate(withDuration: 4, animations: {
            self.btnAddToFavorites.frame.origin = CGPoint(x: finalX, y: 0)
        })
    }
    
    @IBAction func addRemoveFromFavorites(sender: Any) {
        btnText =  btnText == "-"
            ? "+"
            : "-"
        let timeout = DispatchTime.now() + .seconds(1)
        DispatchQueue.main.asyncAfter(deadline: timeout){
            self.showHideBtnAddToFavorites(withHiding: true)
            self.addGestureRecognizer(self.longPressGesture!)
        }
    }
    
    func addImageDimViewConstraints() {
        dimView.translatesAutoresizingMaskIntoConstraints = false
        let bottomConstraint =
            NSLayoutConstraint(item: dimView, attribute: .bottom,
                               relatedBy: .equal,
                               toItem: contentView, attribute: .bottom,
                               multiplier: 1, constant: 0)
        
        let topConstraint =
            NSLayoutConstraint(item: dimView, attribute: .top,
                               relatedBy: .equal,
                               toItem: contentView, attribute: .top,
                               multiplier: 1, constant: 0)
        
        let leftConstraint =
            NSLayoutConstraint(item: dimView, attribute: .leading,
                               relatedBy: .equal,
                               toItem: contentView, attribute: .leading,
                               multiplier: 1, constant: 0)
        
        let rightConstraint =
            NSLayoutConstraint(item: dimView, attribute: .trailing,
                               relatedBy: .equal,
                               toItem: contentView, attribute: .trailing,
                               multiplier: 1, constant: 0)
        
        addConstraint(topConstraint)
        addConstraint(bottomConstraint)
        addConstraint(leftConstraint)
        addConstraint(rightConstraint)
    }
    
    func addImageViewConstraints() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        let topConstraint =
            NSLayoutConstraint(item: imageView, attribute: .top,
                               relatedBy: .equal,
                               toItem: contentView, attribute: .top,
                               multiplier: 1, constant: 0)
        
        let heightConstraint = NSLayoutConstraint(item: imageView, attribute: .height,
                                                  relatedBy: .equal,
                                                  toItem: contentView, attribute: .height,
                                                  multiplier: 1, constant: 0)
        addConstraint(topConstraint)
        addConstraint(heightConstraint)
    }
    
    func addLabelConstraints() {
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        let bottomConstraint =
            NSLayoutConstraint(item: textLabel, attribute: .bottom,
                               relatedBy: .equal,
                               toItem: contentView, attribute: .bottom,
                               multiplier: 1, constant: -15)
        
        
        let leftConstraint =
            NSLayoutConstraint(item: textLabel, attribute: .leading,
                               relatedBy: .equal,
                               toItem: contentView, attribute: .leading,
                               multiplier: 1, constant: 0)
        
        let rightConstraint =
            NSLayoutConstraint(item: textLabel, attribute: .trailing,
                               relatedBy: .equal,
                               toItem: contentView, attribute: .trailing,
                               multiplier: 1, constant: 0)
        
        addConstraint(bottomConstraint)
        addConstraint(leftConstraint)
        addConstraint(rightConstraint)
    }
    
    func addBtnAddToFavoritesConstraints() {
        btnAddToFavorites.translatesAutoresizingMaskIntoConstraints = false
        
        let topConstraint =
            NSLayoutConstraint(item: btnAddToFavorites, attribute: .top,
                               relatedBy: .equal,
                               toItem: contentView, attribute: .top,
                               multiplier: 1, constant: 0)
        
        let rightConstraint =
            NSLayoutConstraint(item: btnAddToFavorites, attribute: .trailing,
                               relatedBy: .equal,
                               toItem: contentView, attribute: .trailing,
                               multiplier: 1, constant: 0)
        
        addConstraints([topConstraint, rightConstraint])
    }
}

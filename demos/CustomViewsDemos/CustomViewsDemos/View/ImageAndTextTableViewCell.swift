//
//  ImageAndTextTableCellTableViewCell.swift
//  CustomViewsDemos
//
//  Created by Doncho Minkov on 3/24/17.
//  Copyright © 2017 Doncho Minkov. All rights reserved.
//

import UIKit

class ImageAndTextTableViewCell: UITableViewCell {
    @IBOutlet weak var theImage: ImageWithLoading!
    @IBOutlet weak var theLabel: UILabel!

    override var textLabel: UILabel? {
        get {
            return self.theLabel
        }
        set(textLabel) {
            self.theLabel = textLabel
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.theLabel.baselineAdjustment = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if selected {
            self.backgroundColor = .black
            self.theLabel.textColor = .white
        } else {
            self.backgroundColor = .white
            self.theLabel.textColor = .black
        }
    }
}

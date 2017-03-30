//
//  DetailsViewController.swift
//  StoryboardsAndViewControllers
//
//  Created by Doncho Minkov on 3/17/17.
//  Copyright © 2017 Doncho Minkov. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    var name: String = ""
    var labelName: UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let topOffeset = self.navigationController?.navigationBar.bounds.size.height
        let origin = CGPoint(x: self.view.bounds.origin.x, y: self.view.bounds.origin.y + topOffeset!)
        
        
        self.labelName = UILabel(frame: CGRect(origin: origin,
                                               size: CGSize(width: 100, height: 50)))
        self.labelName?.text = self.name
        self.labelName?.backgroundColor = .purple
        self.labelName?.textColor = .yellow
        
        self.view.addSubview(self.labelName!)
        
        print(self.name)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func unwindToMainTableViewController(segue: UIStoryboardSegue) {
        print("fired!");
    }
    
    @IBAction func goBacl(_ sender: UIButton) {
        print("Tapped")
        self.performSegue(withIdentifier: "unwind", sender: self)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

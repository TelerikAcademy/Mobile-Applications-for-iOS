//
//  SampleModalViewController.swift
//  StoryboardsAndViewControllers
//
//  Created by Doncho Minkov on 3/17/17.
//  Copyright © 2017 Doncho Minkov. All rights reserved.
//

import UIKit

class SampleModalViewController: UIViewController {
    var label: UILabel?
    var delegate: ModalHandlerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.label = UILabel(frame: CGRect(x: 100, y: 100, width: 200, height: 100))
        self.label?.text = "It works"
        
        self.view.addSubview(self.label!)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func ok() {
        self.dismiss(animated: true, completion: nil)
        self.delegate?.ok(data: "It works!")
    }
    
    @IBAction func cancel() {
        self.dismiss(animated: true, completion: nil)
        self.delegate?.cancel()
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

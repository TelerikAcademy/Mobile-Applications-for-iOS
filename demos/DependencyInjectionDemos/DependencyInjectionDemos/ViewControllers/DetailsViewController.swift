//
//  DetailsViewController.swift
//  DependencyInjectionDemos
//
//  Created by Doncho Minkov on 3/24/17.
//  Copyright © 2017 Doncho Minkov. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController, BooksDataDelegate {
    var data: BooksData?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

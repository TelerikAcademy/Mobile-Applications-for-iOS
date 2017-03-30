//
//  ViewController.swift
//  StoryboardsAndViewControllers
//
//  Created by Doncho Minkov on 3/17/17.
//  Copyright © 2017 Doncho Minkov. All rights reserved.

import UIKit

import Presentr

class ViewController: UIViewController, ModalHandlerDelegate {
    @IBOutlet weak var textFieldMessage: UITextField!
    @IBOutlet weak var labelMessage: UILabel!
    @IBOutlet weak var button: UIButton!
    
    let presenter: Presentr = {
        
        let presenter = Presentr(presentationType: .popup)
        presenter.transitionType = TransitionType.coverVerticalWithSpring
        return presenter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.textFieldMessage.text = "I am sample text";
        
        self.button.addTarget(self, action: #selector(ViewController.changeText(_:)), for: .touchUpInside)
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func changeText(_ sender: UIButton) {
        let message = self.textFieldMessage.text
        self.labelMessage.text = message
        
        let alert = UIAlertController(title: "New Message", message: message, preferredStyle: .alert)
    
        
        let okAction = UIAlertAction(title: "Ok", style: .default) { (action) in
            print("Ok")
        }
        
        let okAction2 = UIAlertAction(title: "Ok", style: .default) { (action) in
            print("Ok")
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel){(action) in
            print("Cancel")
        }
        
        alert.addAction(okAction)
        alert.addAction(okAction2)
        alert.addAction(cancelAction)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    
    @IBAction func showMOdal(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let modal = storyboard.instantiateViewController(withIdentifier: "samplemodal") as! SampleModalViewController
        modal.delegate = self;
        customPresentViewController(presenter, viewController: modal, animated: true, completion: nil)
    }
    
    func ok(data: Any) {
        print(data)
    }
    
    func cancel() {
        print("canceled")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "GoToTableView"){
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let data = appDelegate.data
            
            let nextVC = segue.destination as! MainTableViewController
            nextVC.data = data
        }
    }
}


//
//  MasterViewControllerTableViewController.swift
//  AsyncOperations
//
//  Created by Doncho Minkov on 3/20/17.
//  Copyright © 2017 Doncho Minkov. All rights reserved.

import UIKit

class MasterTableViewController: UITableViewController, BooksDataDelegate {
    var books: [Book]?
    //    var booksData: BooksData?
    
    var booksData: BooksData? {
        get{
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            return appDelegate.booksData
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.booksData?.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "book-cell")
        
        self.books = []
        //        self.booksData = BooksData(withDelegate: self)
        
        self.showLoading()
        self.booksData?.getAll()
        
        //        weak var weakSelf = self
        
        //        self.booksData?.getAllWithCompletionCallback({ (books) in
        //            weakSelf?.books = books
        //            weakSelf?.tableView.reloadData()
        //        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.books!.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "book-cell")
        
        cell?.textLabel?.text = self.books?[indexPath.row].title
        
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let book = self.books?[indexPath.row]
        
        let nextVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "details") as! DetailsViewController
        nextVC.bookId = book?.id
        
        self.show(nextVC, sender: self)
        
        //        nextVC.book = book
    }
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
    func onDataReceived(books: [Book]) {
        print(books.map(){$0.id} )
        self.books = books
        self.tableView.reloadData()
        self.hideLoading()
    }
}

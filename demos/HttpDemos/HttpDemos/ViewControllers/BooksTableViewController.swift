//
//  BooksTableViewController.swift
//  HttpDemos
//
//  Created by Doncho Minkov on 3/22/17.
//  Copyright © 2017 Doncho Minkov. All rights reserved.
//

import UIKit
import Presentr

class BooksTableViewController: UITableViewController, HttpRequesterDelegate, AddBookModalDelegate {
    var books: [Book] = []
    
    let presenter: Presentr = {
        let presenter = Presentr(presentationType: .popup)
        presenter.transitionType = .coverHorizontalFromRight // Optional
        return presenter
    }()
    
    var url: String {
        get{
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            return "\(appDelegate.baseUrl)/books"
        }
    }
    
    var http: HttpRequester? {
        get{
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            return appDelegate.http
        }
    }
    
    func didCreateBook(book: Book?) {
        self.books.append(book!)
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    
    func loadBooks () {
        self.http?.delegate = self
        self.showLoadingScreen()
        
        self.http?.get(fromUrl: self.url)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "book-cell")
        
        self.navigationItem.rightBarButtonItem =
            UIBarButtonItem(barButtonSystemItem: .add,
                            target: self,
                            action: #selector(BooksTableViewController.showAddModal))
        self.loadBooks()
    }
    
    func showAddModal(){
        let nextVC = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(withIdentifier: "modal-add-book") as! AddBookModalViewController
        
        nextVC.delegate = self
        
        self.customPresentViewController(self.presenter, viewController: nextVC, animated: true, completion: nil)
        
        // self.present(nextVC, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func didReceiveData(data: Any) {
        let dataArray = data as! [Dictionary<String, Any>]
        
        self.books = dataArray.map(){Book(withDict: $0)}
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
            self.hideLoadingScreen()
        }
    }
    
    func didDeleteData() {
        self.loadBooks()
    }
    
    func deleteBookAt(index: Int) {
        self.http?.delegate = self
        let book = self.books[index]
        let url = "\(self.url)/\(book.id!)"
        self.showLoadingScreen()
        self.http?.delete(atUrl: url)
        //        self.http?.delete(
    }
    
    func showDetails(of book: Book){
        let nextVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "book-details") as! BookDetailsViewController
        nextVC.bookId = book.id
        
        self.navigationController?.show(nextVC, sender: self)
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.books.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "book-cell", for: indexPath)
        cell.textLabel?.text = self.books[indexPath.row].title
        
        return cell
    }
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.deleteBookAt(index: indexPath.row)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.showDetails(of: self.books[indexPath.row])
    }
    
    
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
    
}

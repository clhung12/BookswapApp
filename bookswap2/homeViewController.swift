//
//  homeViewController.swift
//  bookswap2
//
//  Created by Chloe Hung on 12/3/23.
//

import UIKit
import SwiftUI

import FirebaseFirestore

class homeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {


    @IBOutlet weak var exploreTableView:UITableView!
    @IBOutlet var topicButtons:[UIButton]!
    
    let topics = ["textbooks", "chemistry", "history", "fiction", "idk"]
    let db: Firestore = Firestore.firestore()
    var books: [Book] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var booksCollection: CollectionReference = db.collection("publicbooks")
        fetchFirstFiveBooks(booksCollection: booksCollection)
        
        // Do any additional setup after loading the view.
        exploreTableView.dataSource = self
        exploreTableView.delegate = self
        
        for i in 0...topics.count-1{
            topicButtons[i].setTitle(topics[i], for: .normal)
        }
        
        let nib = UINib(nibName: "bookCell", bundle: nil)
        exploreTableView.register(nib, forCellReuseIdentifier: "bookCell")
    }
    
    func fetchFirstFiveBooks(booksCollection: CollectionReference) {
        booksCollection
            .limit(to: 1)
            .getDocuments { [weak self] (querySnapshot, error) in
                guard let self = self else { return }
                if let error = error {
                    print("Error getting documents: \(error)")
                } else {
                    guard let documents = querySnapshot?.documents else {
                        print("No documents found")
                        return
                    }
                    
                    self.books = documents.compactMap { document in
                        guard let title = document.data()["title"] as? String,
                              let author = document.data()["author"] as? String else {
                            return nil
                        }
                        return Book(title: title, author: author, owner: User(name: "me", email: "me.com", location: "here"))
                    }
                    
                    // Process books array or perform any other action
                    for book in self.books {
                        print("Title: \(book.title), Author: \(book.author)")
                    }
                    DispatchQueue.main.async {
                        self.exploreTableView.reloadData()
                    }

                }
            }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "bookCell", for: indexPath) as! bookCell

        // Configure the cell with book information
        let book = books[indexPath.row]
        cell.configure(with: book)

        return cell
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 121
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 121
    }
    //UITableViewDelegate override
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("exploreIndexPath --\(indexPath)-")
        tableView.deselectRow(at: indexPath, animated: true)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let bookDetailsVC = storyboard.instantiateViewController(withIdentifier: "BookDetailsViewController") as? bookDetailsViewController {

            bookDetailsVC.selectedBook = books[indexPath.row]
            navigationController?.pushViewController(bookDetailsVC, animated: true)
        }

    }
}

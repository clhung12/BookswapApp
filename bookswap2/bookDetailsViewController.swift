//
//  bookDetailsViewController.swift
//  bookswap2
//
//  Created by Chloe Hung on 12/29/23.
//

import UIKit

class bookDetailsViewController: UIViewController {
    
    var selectedBook: Book!
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var authorLabel: UILabel!
    @IBOutlet var ownerLocationLabel: UILabel!
    @IBOutlet var ownerNameLabel: UILabel!
    @IBOutlet var ownerEmail: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let book = selectedBook{
            self.selectedBook = book
        }
        // Do any additional setup after loading the view.
        
        titleLabel.text = selectedBook.title
        authorLabel.text = selectedBook.author
        ownerLocationLabel.text = selectedBook.owner.location
        ownerNameLabel.text = selectedBook.owner.name
        ownerEmail.text = selectedBook.owner.email
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

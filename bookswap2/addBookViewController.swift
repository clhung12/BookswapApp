//
//  addBookViewController.swift
//  bookswap2
//
//  Created by Chloe Hung on 12/3/23.
//

import UIKit
import FirebaseFirestore

class addBookViewController: UIViewController, UITextFieldDelegate {

    let database = Firestore.firestore()
    @IBOutlet weak var addTitle:UITextField!
    @IBOutlet weak var addAuthor:UITextField!
    
    @IBAction func addNewBook(_ sender: Any){
        let newTitle = addTitle.text ?? ""
        let newAuthor = addAuthor.text ?? ""
        
        if !newTitle.isEmpty && !newAuthor.isEmpty {
            saveBookData(title: newTitle, author: newAuthor)
            print("add book: \(String(describing:newTitle)), \(String(describing: newAuthor)) SUCCESSFUL")
        }
        else{
            print("FAILED to add book: missing arguments")
        }
        
        /*
        let storyboard = self.storyboard?.instantiateViewController(withIdentifier:
            "libraryViewController") as! libraryViewController
        self.navigationController?.pushViewController(storyboard, animated: true)
         */
    }
    
    func saveBookData(title: String, author: String){
        let docRef = database.document("publicbooks/\(title),\(author)")
        docRef.setData(["title": title,
                        "author": author])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        addTitle.delegate = self
        addAuthor.delegate = self
        
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

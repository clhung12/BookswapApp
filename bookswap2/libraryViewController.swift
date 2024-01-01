//
//  libraryViewController.swift
//  bookswap2
//
//  Created by Chloe Hung on 12/3/23.
//

import UIKit

class libraryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    @IBOutlet weak var libraryTableView:UITableView!
    
    @IBAction func addButtonPressed(_ sender: Any){
        let storyboard = self.storyboard?.instantiateViewController(withIdentifier:
            "addBook") as! addBookViewController
        self.navigationController?.pushViewController(storyboard, animated: true)
        print("add button pressed")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        libraryTableView.delegate = self
        libraryTableView.dataSource = self
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
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "bookCell", for: indexPath)

        
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
        print("libraryIndexPath --\(indexPath)-")
    }
    
}

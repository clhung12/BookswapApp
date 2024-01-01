//
//  profileViewController.swift
//  bookswap2
//
//  Created by Chloe Hung on 12/3/23.
//

import UIKit

class profileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var historytTableView:UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        historytTableView.delegate = self
        historytTableView.dataSource = self
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    //UITableViewDataSource override
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
        print("historyIndexPath --\(indexPath)-")
    }
}


//
//  bookCell.swift
//  bookswap2
//
//  Created by Chloe Hung on 12/29/23.
//

import UIKit

class bookCell: UITableViewCell {
    
    var book: Book?
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var authorLabel: UILabel!
    @IBOutlet var locationLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(with book: Book) {
        titleLabel.text = book.title
        authorLabel.text = book.author
        locationLabel.text = book.owner.location
        // Additional configurations if needed
    }


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

//
//  Data.swift
//  bookswap2
//
//  Created by Chloe Hung on 12/29/23.
//

import Foundation

// Owner class
class User {
    let name: String
    let email: String
    let location: String
    

    init(name: String, email: String, location: String) {
        self.name = name
        self.email = email
        self.location = location
    }
}

// Book structure with Title, Author, and Owner
struct Book {
    let title: String
    let author: String
    let owner: User

    init(title: String, author: String, owner: User) {
        self.title = title
        self.author = author
        self.owner = owner
    }
}



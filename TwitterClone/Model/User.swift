//
//  User.swift
//  TwitterClone
//
//  Created by Andrii Boichuk on 08/10/2020.
//

import Foundation

struct User {
    let uid: String
    let email: String
    let username: String
    let fullname: String
    let profileImageUrl: String
    
    init(uid: String, dictionary: [String : AnyObject]) {
        self.uid = uid
        self.email = dictionary["email"] as? String ?? ""
        self.username = dictionary["username"] as? String ?? ""
        self.fullname = dictionary["fullname"] as? String ?? ""
        self.profileImageUrl = dictionary["profileImageUrl"] as? String ?? ""
    }
}

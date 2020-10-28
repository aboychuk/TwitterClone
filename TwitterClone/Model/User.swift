//
//  User.swift
//  TwitterClone
//
//  Created by Andrii Boichuk on 08/10/2020.
//

import Foundation
import Firebase

struct User {
    let uid: String
    let email: String
    let username: String
    let fullname: String
    var profileImageUrl: URL?
    var isCurrentUser: Bool {
        return Auth.auth().currentUser?.uid == uid
    }
    var isFollowed = false
    var stats: UserRelationStats?
    
    init(uid: String, dictionary: [String : AnyObject]) {
        self.uid = uid
        self.email = dictionary["email"] as? String ?? ""
        self.username = dictionary["username"] as? String ?? ""
        self.fullname = dictionary["fullname"] as? String ?? ""
        guard let urlString = dictionary["profileImageUrl"] as? String else { return }
        self.profileImageUrl = URL(string: urlString)
    }
}

struct UserRelationStats {
    var followers: Int
    var following: Int
}

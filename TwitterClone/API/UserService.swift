//
//  UserService.swift
//  TwitterClone
//
//  Created by Andrii Boichuk on 08/10/2020.
//

import Firebase

struct UserService {
    static let shared = UserService()
    
    func fetchUser() {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        REF_USERS.child(uid).observeSingleEvent(of: .value) { (snapshot) in
            guard let dictionary = snapshot as? [String: AnyObject] else { return }
            let user = User(uid: uid, dictionary: dictionary)
        }
    }
}

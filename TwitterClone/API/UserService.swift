//
//  UserService.swift
//  TwitterClone
//
//  Created by Andrii Boichuk on 08/10/2020.
//

import Firebase

struct UserService {
    static let shared = UserService()
    
    func fetchCurrentUser(completion: @escaping (User) -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        fetchUser(uid: uid, completion: completion)
    }
    
    func fetchUser(uid: String, completion: @escaping (User) -> Void) {
        
        REF_USERS.child(uid).observeSingleEvent(of: .value) { (snapshot) in
            guard let dictionary = snapshot.value as? [String: AnyObject] else { return }
            let user = User(uid: uid, dictionary: dictionary)
            
            completion(user)
        }
    }
}

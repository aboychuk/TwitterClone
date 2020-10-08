//
//  AuthService.swift
//  TwitterClone
//
//  Created by Andrii Boichuk on 08/10/2020.
//

import UIKit
import Firebase

struct AuthCredentials {
    let email: String
    let password: String
    let fullName: String
    let userName: String
    let image: UIImage
}

struct AuthService {
    static let shared = AuthService()
    
    func registerUser(credentials: AuthCredentials, completion: @escaping(Error?, DatabaseReference) -> Void) {
        let email = credentials.email
        let password = credentials.password
        let fullname = credentials.fullName
        let userName = credentials.userName

        guard let imageData = credentials.image.jpegData(compressionQuality: 0.3) else { return }
        let fileName = NSUUID().uuidString
        let storageRef = STORAGE_PROFILE_IMAGES.child(fileName)
        
        storageRef.putData(imageData, metadata: nil) { (metaData, error) in
            storageRef.downloadURL { (url, error) in
                guard let downloadURL = url?.absoluteString else { return }
                
                Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
                    if let error = error {
                        print("DEBUG: \(error.localizedDescription)")
                        return
                    } else {
                        guard let uid = result?.user.uid else { return }
                        let values = ["email": email,
                                      "password": password,
                                      "fullname": fullname,
                                      "userName": userName,
                                      "profileImageURL": downloadURL]
                        REF_USERS.child(uid).updateChildValues(values, withCompletionBlock: completion)
                    }
                }
            }
        }
    }
}

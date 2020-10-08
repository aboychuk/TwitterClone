//
//  Constants.swift
//  TwitterClone
//
//  Created by Andrii Boichuk on 07/10/2020.
//

import Firebase

let DB_REF = Database.database().reference()
let REF_USERS = DB_REF.child("users")

let STORAGE_REF = Storage.storage().reference()
let STORAGE_PROFILE_IMAGES = STORAGE_REF.child("profile_images")

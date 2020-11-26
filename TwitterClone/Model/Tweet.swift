//
//  Tweet.swift
//  TwitterClone
//
//  Created by Andrii Boichuk on 14/10/2020.
//

import Foundation

struct Tweet {
    
    // MARK: - Properties
    
    let caption: String
    let tweetID: String
    let uid: String
    var likes: Int
    let retweetCount: Int
    var timestamp: Date
    var user: User
    var didLike: Bool = false
    
    // MARK: - Lifecycle
    
    init(user: User, tweetID: String, dictionary: [String: Any]) {
        self.tweetID = tweetID
        self.user = user
        
        self.caption = dictionary["caption"] as? String ?? ""
        self.uid = dictionary["uid"] as? String ?? ""
        self.likes = dictionary["likes"] as? Int ?? 0
        self.retweetCount = dictionary["retweets"] as? Int ?? 0
        
        if let timestamp = dictionary["timestamp"] as? Double {
            self.timestamp = Date(timeIntervalSince1970: timestamp)
        } else {
            self.timestamp = Date()
        }
    }
}

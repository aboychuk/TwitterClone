//
//  UploadTweetViewModel.swift
//  TwitterClone
//
//  Created by Andrii Boichuk on 09/11/2020.
//

import Foundation

enum UploadTweetConfiguration {
    case tweet
    case reply(Tweet)
}

struct UploadTweetViewModel {
    
    // MARK: - Properties
    
    let actionButtonTitle: String
    let placeholderText: String
    let shouldShowReplyLabel: Bool
    var replyText: String?
    
    // MARK: - Init
    
    init(config: UploadTweetConfiguration) {
        switch config {
        case .tweet:
            self.actionButtonTitle = "Tweet"
            self.placeholderText = "Whats happening?"
            self.shouldShowReplyLabel = false
        case .reply(let tweet):
            self.actionButtonTitle = "Reply"
            self.placeholderText = "Tweet your reply"
            self.shouldShowReplyLabel = true
            self.replyText = "Replying to @\(tweet.user.username)"
        }
    }
}
 

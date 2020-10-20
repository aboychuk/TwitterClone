//
//  ProfileHeaderViewModel.swift
//  TwitterClone
//
//  Created by Andrii Boichuk on 20/10/2020.
//

import UIKit

enum ProfileFilterOptions: Int, CaseIterable {
    case tweets
    case replies
    case likes
    
    var description: String {
        switch self {
        case .tweets: return "Tweets"
        case .replies: return "Tweets & Replies"
        case .likes: return "Likes"
        }
    }
}

struct ProfileHeaderViewModel {
    
    // MARK: - Properties
    
    private let user: User
    var usernameText: String {
        return "@" + user.username
    }
    var followersString: NSAttributedString {
        return attributedText(withValue: 0, text: "followers")
    }
    var followingString: NSAttributedString {
        return attributedText(withValue: 2, text: "following")
    }
    var actionButtonTitle: String {
        if user.isCurrentUser {
            return "Edit Profile"
        } else {
            return "Follow"
        }
    }
    
    // MARK: - Lifecycle
    
    init(user: User) {
        self.user = user
    }
    
    fileprivate func attributedText(withValue value: Int, text: String) -> NSAttributedString {
        let attributedTitle = NSMutableAttributedString(string: "\(value) ",
                                                        attributes: [.font: UIFont.boldSystemFont(ofSize: 14)])
        attributedTitle.append(NSAttributedString(string: "\(text)",
                                                  attributes: [.font : UIFont.systemFont(ofSize: 14),
                                                                                  .foregroundColor: UIColor.lightGray]))
        return attributedTitle
    }
}

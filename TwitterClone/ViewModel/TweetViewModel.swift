//
//  TweetViewModel.swift
//  TwitterClone
//
//  Created by Andrii Boichuk on 19/10/2020.
//

import UIKit

struct TweetViewModel {
    
    // MARK: - Properties
    
    let tweet: Tweet
    let user: User
    var profileImageUrl: URL? {
        return user.profileImageUrl
    }
    var usernameText: String {
        return "@\(user.username)"
    }
    var userInfoText: NSAttributedString {
        let title = NSMutableAttributedString(string: user.fullname, attributes: [.font: UIFont.boldSystemFont(ofSize: 14)])
        title.append(NSAttributedString(string: " @\(user.username)", attributes: [.font: UIFont.systemFont(ofSize: 14),
                                                                                  .foregroundColor: UIColor.lightGray]))
        title.append(NSAttributedString(string: " ・ \(timestamp)", attributes: [.font: UIFont.systemFont(ofSize: 14),
                                                                                  .foregroundColor: UIColor.lightGray]))
        return title
    }
    var retweetsAttributedString: NSAttributedString? {
        return attributedText(withValue: tweet.retweetCount, text: "Retweets")
    }
    var likesAttributedString: NSAttributedString? {
        return attributedText(withValue: tweet.likes, text: "Likes")
    }
    var timestamp: String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.second, .minute, .hour, .day, .weekOfMonth]
        formatter.maximumUnitCount = 1
        formatter.unitsStyle = .abbreviated
        let now = Date()
        let timestamp = tweet.timestamp
        
        return formatter.string(from: timestamp, to: now) ?? "0s"
    }
    
    var headerTimestamp: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "h:mm a • MM/dd/yyyy"
        
        return formatter.string(from: tweet.timestamp)
    }
    
    // MARK: - Lifecycle
    
    init(tweet: Tweet) {
        self.tweet = tweet
        self.user = tweet.user
    }
    
    // MARK: - Helpers
    
    fileprivate func attributedText(withValue value: Int, text: String) -> NSAttributedString {
        let attributedTitle = NSMutableAttributedString(string: "\(value) ",
                                                        attributes: [.font: UIFont.boldSystemFont(ofSize: 14)])
        attributedTitle.append(NSAttributedString(string: "\(text)",
                                                  attributes: [.font : UIFont.systemFont(ofSize: 14),
                                                                                  .foregroundColor: UIColor.lightGray]))
        return attributedTitle
    }
    
    func size(forWidth width: CGFloat) -> CGSize {
         let measurementLabel = UILabel()
        measurementLabel.text = tweet.caption
        measurementLabel.numberOfLines = 0
        measurementLabel.lineBreakMode = .byWordWrapping
        measurementLabel.translatesAutoresizingMaskIntoConstraints = false
        measurementLabel.widthAnchor.constraint(equalToConstant: width).isActive = true
        
        return measurementLabel.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
    }
}

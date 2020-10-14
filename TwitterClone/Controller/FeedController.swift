//
//  FeedController.swift
//  TwitterClone
//
//  Created by Andrii Boichuk on 05/10/2020.
//

import UIKit
import SDWebImage

class FeedController: UIViewController {
    
    // MARK: - Properties
    var count = 0
    var user: User? {
        didSet {
//            print("DEBUG: user set in \(FeedController.self) name is \(String(describing: user?.fullname))")
            configureLefBarButtonItem()
        }
    }
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        fetchTweets()
    }
    
    // MARK: - Helpers
    
    func fetchTweets() {
        TweetService.shared.fetchTweets { (tweets) in
            print("DEBUG: Tweets are \(tweets)")
            self.count += 1 
            print("count is \(self.count)")
        }
    }
    
    // MARK: - Helpers
    
    func configureUI() {
        view.backgroundColor = .white
        let imageView = UIImageView(image: UIImage(named: "twitter_logo_blue"))
        imageView.contentMode = .scaleAspectFit
        imageView.setDimensions(width: 44, height: 44)
        navigationItem.titleView = imageView
    }
    
    func configureLefBarButtonItem() {
        guard let user = user else { return }
        let profileImageView = UIImageView()
        profileImageView.setDimensions(width: 32, height: 32)
        profileImageView.layer.cornerRadius = 32 / 2
        profileImageView.layer.masksToBounds = true
        profileImageView.sd_setImage(with: user.profileImageUrl)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: profileImageView)
    }
}

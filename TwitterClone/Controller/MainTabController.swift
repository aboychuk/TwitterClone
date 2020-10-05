//
//  MainTabController.swift
//  TwitterClone
//
//  Created by Andrii Boichuk on 05/10/2020.
//

import UIKit

class MainTabController: UITabBarController {
    
    // MARK: - Properties
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .purple
        
        configureViewControllers()
    }
    
    // MARK: - Helpers
    
    func configureViewControllers() {
        let feed = FeedController()
        let explore = ExploreController()
        let notifications = NotificationsController()
        let conversations = ConversationsController()
        
        viewControllers = [feed, explore, notifications, conversations]
    }
}

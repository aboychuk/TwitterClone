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
        let feedImage = UIImage(named: "home_unselected")
        let nav1 = templateNavigationController(image: feedImage, rootController: feed)
        
        let explore = ExploreController()
        let exploreImage = UIImage(named: "search_unselected")
        let nav2 = templateNavigationController(image: exploreImage, rootController: explore)
        
        let notifications = NotificationsController()
        let notificationsImage = UIImage(named: "like_unselected")
        let nav3 = templateNavigationController(image: notificationsImage, rootController: notifications)
        
        
        let conversations = ConversationsController()
        let conversationsImage = UIImage(named: "ic_mail_outline_white_2x-1")
        let nav4 = templateNavigationController(image: conversationsImage, rootController: conversations)
        
        viewControllers = [nav1, nav2, nav3, nav4]
    }
    
    func templateNavigationController(image: UIImage?, rootController: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: rootController)
        nav.tabBarItem.image = image
        nav.navigationBar.tintColor = .white
        
        return nav
    }
}

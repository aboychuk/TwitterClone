//
//  MainTabController.swift
//  TwitterClone
//
//  Created by Andrii Boichuk on 05/10/2020.
//

import UIKit
import Firebase

class MainTabController: UITabBarController {
    
    // MARK: - Properties
    
    let actionButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .white
        button.backgroundColor = .twitterBlue
        button.setImage(UIImage(named: "new_tweet"), for: .normal)
        button.addTarget(self, action: #selector(actionButtonTapped), for: .touchUpInside)
        
        return button
    }()
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .twitterBlue
//        logUserOut()
        authenticateUserAndConfigureUI()
    }
    
    // MARK: - Selectors
    
    @objc func actionButtonTapped() {
        print("123")
    }
    
    // MARK: - Helpers
    
    func authenticateUserAndConfigureUI() {
        if Auth.auth().currentUser == nil {
            DispatchQueue.main.async {
                let nav = UINavigationController(rootViewController: LoginController())
                nav.modalPresentationStyle = .fullScreen
                self.present(nav, animated: true)
            }
        } else {
            fetchUser()
            configureViewControllers()
            configureUI()
        }
    }
    
    func fetchUser() {
        UserService.shared.fetchUser(completion: { user in
            print("DEBUG: User name is \(user.fullname)")
        })
    }
    
    func logUserOut() {
        do {
            try Auth.auth().signOut()
            print("DEBUG: User succesfully logged out")
        } catch let error {
            print("DEBUG: User sign out ended with error \(error)")
        }
    }
    
    func configureUI() {
        view.addSubview(actionButton)
        actionButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.safeAreaLayoutGuide.rightAnchor, paddingBottom: 64, paddingRight: 16, width: 56, height: 56)
        actionButton.layer.cornerRadius = 56 / 2
    }
    
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

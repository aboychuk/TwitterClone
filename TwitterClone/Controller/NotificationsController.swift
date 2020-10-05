//
//  NotificationsController.swift
//  TwitterClone
//
//  Created by Andrii Boichuk on 05/10/2020.
//

import UIKit

class NotificationsController: UIViewController {
    
    // MARK: - Properties
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - Helpers
    
    func configureUI() {
        view.backgroundColor = .white
        navigationItem.title = "Notifications"
    }
}

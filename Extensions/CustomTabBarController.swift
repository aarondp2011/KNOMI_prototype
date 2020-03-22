//
//  CustomTabBarController.swift
//  KNOMIv2
//
//  Created by Aaron Peterson on 1/10/20.
//  Copyright © 2020 Aaron Peterson. All rights reserved.
//

import UIKit

class CustomTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup Custom View Controllers
        let layout = UICollectionViewFlowLayout()
        
        let usersViewController = UsersViewController(collectionViewLayout: layout)
        let usersNavigationController = UINavigationController(rootViewController: usersViewController)
        usersNavigationController.tabBarItem.title = "People"
        //usersNavigationController.tabBarItem.image = UIImage(named: "")
        
        let messengerViewController = MessengerViewController(collectionViewLayout: layout)
        let messengerNavigationController = UINavigationController(rootViewController: messengerViewController)
        messengerNavigationController.tabBarItem.title = "Messages"
        //messengerViewController.tabBarItem.image = UIImage(named: "")
        
        viewControllers = [usersNavigationController, messengerNavigationController, createTabViewControllers(title: "Settings")]
    }
    
    private func createTabViewControllers(title: String) -> UINavigationController {
        let viewController = UIViewController()
        let navController = UINavigationController(rootViewController: viewController)
        navController.tabBarItem.title = title
        //navController.tabBarItem.image = UIImage(named: imageName)
        return navController
    }
}

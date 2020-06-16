//
//  AppDelegate.swift
//  Dominos11_Starter
//
//  Created by Lee on 2020/05/26.
//  Copyright © 2020 Kira. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    let categoryVC = UINavigationController(rootViewController: CategoryViewController())
    categoryVC.tabBarItem = UITabBarItem(title: "Category", image: UIImage(named: "domino's"), tag: 0)
    
    let wishListVC = UINavigationController(rootViewController: WishListViewController())
    wishListVC.tabBarItem = UITabBarItem(title: "Wish List", image: UIImage(named: "wishlist"), tag: 1)
    
    let tabBarC = UITabBarController()
    tabBarC.viewControllers = [categoryVC, wishListVC]
    
    window = UIWindow(frame: UIScreen.main.bounds)
    window?.backgroundColor = .systemBackground
    window?.rootViewController = tabBarC
    window?.makeKeyAndVisible()
    
    return true
  }
}


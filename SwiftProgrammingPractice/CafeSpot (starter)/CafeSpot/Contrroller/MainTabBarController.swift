//
//  MainTabBarController.swift
//  CafeSpot
//
//  Created by 성단빈 on 2020/07/10.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import UIKit

final class MainTabBarController: UITabBarController {
  // MARK: - Properties
  let mainNavigationController = UINavigationController(
    rootViewController: HomeViewController()
  )
  let mapSearchNavigationController = UINavigationController(
    rootViewController: MapSearchViewController()
  )
  
  
  // MARK: - View LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupUI()
  }
  
  // MARK: - Layout
  private func setupUI() {
    mainNavigationController.tabBarItem = UITabBarItem(
      title: "홈",
      image: UIImage(systemName: "house"),
      tag: 0
    )
    
    mapSearchNavigationController.tabBarItem = UITabBarItem(
      title: "지도 보기",
      image: UIImage(systemName: "map"),
      tag: 1
    )
    
    viewControllers = [
      mainNavigationController,
      mapSearchNavigationController
    ]
    
    view.backgroundColor = .systemBackground
  }
  // MARK: - Action Handler
}


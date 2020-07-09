//
//  WindowManager.swift
//  Chat
//
//  Created by 성단빈 on 2020/07/08.
//  Copyright © 2020 seong. All rights reserved.
//

import UIKit

class WindowManager {
  enum VisibleViewControllerType {
    case sign
    case chat
    
    var controller: UIViewController {
      switch self {
      case .sign: return SignInViewController()
      case .chat: return UINavigationController(rootViewController: ChatViewController())
      }
    }
  }
  class func set(_ type: VisibleViewControllerType) {
    guard let delegate = UIApplication.shared.delegate as? AppDelegate else { return }
    
    let window = UIWindow(frame: UIScreen.main.bounds)
    window.rootViewController = type.controller
    window.makeKeyAndVisible()
    
    delegate.window = window
  }
}

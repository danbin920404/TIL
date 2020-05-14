//
//  LoginViewController.swift
//  LoginPage
//
//  Created by 성단빈 on 2020/05/14.
//  Copyright © 2020 seong. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UIAdaptivePresentationControllerDelegate {
  let label = UILabel()
  let button = UIButton(type: .system)
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    viewSeting()
  }
  private func viewSeting() {
    view.backgroundColor = .systemBackground
    
    label.frame.size = CGSize(width: 200, height: 100)
    label.center = CGPoint(x: view.center.x, y: 100)
    label.text = UserDefaults.standard.string(forKey: "userID")
    label.backgroundColor = .systemGray
    label.layer.cornerRadius = 10
    label.textAlignment = .center
    view.addSubview(label)
    
    button.frame.size = CGSize(width: 300, height: 40)
    button.center = CGPoint(x: view.center.x, y: view.center.y)
    button.setTitle("Sing Out", for: .normal)
    button.setTitleColor(.white, for: .normal)
    button.backgroundColor = .gray
    button.layer.cornerRadius = 10
    button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
    view.addSubview(button)
    
    self.presentationController?.delegate = self
  }
  @objc private func buttonAction(_ sender: UIButton) {
    if let _ = presentingViewController as? ViewController {
      UserDefaults.standard.set(false, forKey: "isLogin")
      
      dismiss(animated: true)
    }
  }
}

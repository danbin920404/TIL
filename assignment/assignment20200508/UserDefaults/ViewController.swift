//
//  ViewController.swift
//  UserDefaults
//
//  Created by 성단빈 on 2020/05/09.
//  Copyright © 2020 seong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  let imageView: UIImageView = UIImageView()
  let swit = UISwitch()
  let ud = UserDefaults.standard
  
  private struct Key {
    static let isBool = "isBool"
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    imageSet(bool: ud.bool(forKey: Key.isBool))
    ViewSeting()
  }
  
  private func ViewSeting() {
    imageView.frame.size = CGSize(width: 300, height: 300)
    imageView.center = CGPoint(x: view.center.x, y: view.center.y)
    view.addSubview(imageView)
    
    swit.center = CGPoint(x: view.center.x, y: 600)
    swit.addTarget(self, action: #selector(switchAction), for: .valueChanged)
    view.addSubview(swit)
  }
  
  private func imageSet(bool: Bool) {
    if bool {
      imageView.image = UIImage(named: "dog")
      swit.setOn(true, animated: true)
    } else {
      imageView.image = UIImage(named: "cat")
    }
  }
  
  @objc private func switchAction(_ sender: UISwitch) {
    if sender.isOn {
      ud.set(true, forKey: Key.isBool)
    } else {
      ud.set(false, forKey: Key.isBool)
    }
    
    imageSet(bool: ud.bool(forKey: Key.isBool))
  }
}


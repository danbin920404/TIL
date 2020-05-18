//
//  SecondViewController.swift
//  SelfTextFieldDelegate
//
//  Created by 성단빈 on 2020/05/18.
//  Copyright © 2020 seong. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, TextFieldDelegate {
  
  
  let label: UILabel = UILabel()
  let button: UIButton = UIButton(type: .system)
  
  func textFieldForText(_ text: String?) {
    label.text = text!
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
//    if let vc = presentingViewController as? ViewController {
//      vc.delegate = self
//    }
    
    viewSeting()
  }
  private func viewSeting() {
    label.frame.size = CGSize(width: 100, height: 50)
    label.center = CGPoint(x: view.center.x, y: 150)
    label.text = "Test"
    label.textAlignment = .center
    view.addSubview(label)
    
    button.setTitle("Dismiss", for: .normal)
    button.frame.size = CGSize(width: 100, height: 30)
    button.center = CGPoint(x: view.center.x, y: view.center.y)
    button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
    view.addSubview(button)
  }
  
  @objc private func buttonAction(_ sender: UIButton) {
    if let _ = presentingViewController as? ViewController {
      dismiss(animated: true)
    }
  }
}

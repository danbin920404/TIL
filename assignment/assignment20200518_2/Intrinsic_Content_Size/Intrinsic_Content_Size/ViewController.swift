//
//  ViewController.swift
//  Intrinsic_Content_Size
//
//  Created by 성단빈 on 2020/05/18.
//  Copyright © 2020 seong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  let grayView = UIView()
  let button = UIButton(type: .system)
  var centerY: NSLayoutConstraint?
  var isDownState = true
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.addSubview(grayView)
    view.addSubview(button)
    
    seting()
  }
  private func seting() {
    grayView.translatesAutoresizingMaskIntoConstraints = false
    grayView.backgroundColor = .systemGray
    centerY = grayView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100)
    centerY?.isActive = true
    grayView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 100).isActive = true
    grayView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -100).isActive = true
    grayView.heightAnchor.constraint(equalToConstant: 100).isActive = true
    
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle("내리기", for: .normal)
    button.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
    button.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 150).isActive = true
    button.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -150).isActive = true
    button.heightAnchor.constraint(equalToConstant: 100).isActive = true
    button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
    
  }
  @objc private func buttonAction(_ sender: UIButton) {
    UIView.animate(withDuration: 1) {
      if self.isDownState {
        self.centerY?.constant = 300
      } else {
        self.centerY?.constant = 100
      }
      self.view.layoutIfNeeded()
      self.isDownState = !self.isDownState
    }
  }
}


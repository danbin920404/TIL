//
//  ViewController.swift
//  AutolayOutCode
//
//  Created by 성단빈 on 2020/05/18.
//  Copyright © 2020 seong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  let firstView = UIView()
  let secondView = UIView()

  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.addSubview(firstView)
    view.addSubview(secondView)
    autoLayout()
  }
  
  private func autoLayout() {
    firstView.translatesAutoresizingMaskIntoConstraints = false
    firstView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
    firstView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
    firstView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
    firstView.trailingAnchor.constraint(equalTo: secondView.leadingAnchor, constant: -10).isActive = true
    firstView.widthAnchor.constraint(equalTo: secondView.widthAnchor, multiplier: 1).isActive = true
    firstView.backgroundColor = .systemRed
    
    
    secondView.translatesAutoresizingMaskIntoConstraints = false
    secondView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
    secondView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
    secondView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
    secondView.backgroundColor = .systemBlue
  }

}


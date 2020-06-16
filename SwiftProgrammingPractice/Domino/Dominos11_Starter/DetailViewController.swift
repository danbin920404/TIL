//
//  DetailViewController.swift
//  Dominos11_Starter
//
//  Created by Lee on 2020/05/26.
//  Copyright © 2020 Kira. All rights reserved.
//

import UIKit

final class DetailViewController: UIViewController {
  private struct Standard {
    static let space: CGFloat = 48
  }
  
  private let menuImageView = UIImageView()
  private let tempView = UIView()
  private let displayLabel = UILabel()
  private let plusBtn = UIButton()
  private let minusBtn = UIButton()
  var naviTitle = ""
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupNavi()
    setupView()
    setupConstraint()
  }
  
  private func setupNavi() {
    navigationItem.title = naviTitle
  }
  
  private func setupView() {
    view.backgroundColor = .systemBackground
    view.addSubview(menuImageView)
    view.addSubview(tempView)
    tempView.addSubview(displayLabel)
    tempView.addSubview(plusBtn)
    tempView.addSubview(minusBtn)
    
    tempView.layer.borderColor = UIColor.black.cgColor
    tempView.layer.borderWidth = 1.0
    
    displayLabel.backgroundColor = .gray
    displayLabel.text = "0 개"
    displayLabel.textAlignment = .center
    
    plusBtn.setTitle("-", for: .normal)
    plusBtn.setTitleColor(.black, for: .normal)
    
    minusBtn.setTitle("+", for: .normal)
    minusBtn.setTitleColor(.black, for: .normal)
  }
  
  private func setupConstraint() {
    menuImageView.image = UIImage(named: naviTitle)
    menuImageView.translatesAutoresizingMaskIntoConstraints = false
    menuImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60).isActive = true
    menuImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    menuImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    menuImageView.heightAnchor.constraint(equalToConstant: view.frame.width).isActive = true
    
    tempView.translatesAutoresizingMaskIntoConstraints = false
    tempView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Standard.space).isActive = true
    tempView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Standard.space).isActive = true
    tempView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -Standard.space).isActive = true
    tempView.heightAnchor.constraint(equalToConstant: Standard.space).isActive = true
    
    minusBtn.translatesAutoresizingMaskIntoConstraints = false
    minusBtn.topAnchor.constraint(equalTo: tempView.topAnchor).isActive = true
    minusBtn.leadingAnchor.constraint(equalTo: tempView.leadingAnchor).isActive = true
    minusBtn.bottomAnchor.constraint(equalTo: tempView.bottomAnchor).isActive = true
    minusBtn.widthAnchor.constraint(equalTo: tempView.widthAnchor, multiplier: 0.2).isActive = true
    
    displayLabel.translatesAutoresizingMaskIntoConstraints = false
    displayLabel.topAnchor.constraint(equalTo: tempView.topAnchor).isActive = true
    displayLabel.leadingAnchor.constraint(equalTo: minusBtn.trailingAnchor).isActive = true
    displayLabel.bottomAnchor.constraint(equalTo: tempView.bottomAnchor).isActive = true
    displayLabel.widthAnchor.constraint(equalTo: tempView.widthAnchor, multiplier: 0.6).isActive = true
    
    plusBtn.translatesAutoresizingMaskIntoConstraints = false
    plusBtn.topAnchor.constraint(equalTo: tempView.topAnchor).isActive = true
    plusBtn.leadingAnchor.constraint(equalTo: displayLabel.trailingAnchor).isActive = true
    plusBtn.trailingAnchor.constraint(equalTo: tempView.trailingAnchor).isActive = true
    plusBtn.bottomAnchor.constraint(equalTo: tempView.bottomAnchor).isActive = true
    plusBtn.widthAnchor.constraint(equalTo: tempView.widthAnchor, multiplier: 0.2).isActive = true
    
  }
  
}

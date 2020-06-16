//
//  CategoryCell.swift
//  Dominos11_Starter
//
//  Created by 성단빈 on 2020/06/16.
//  Copyright © 2020 Kira. All rights reserved.
//

import UIKit

class CategoryCell: UITableViewCell {
  static let identifier = "CategoryTableViewCell"
  
  let categoryImageView = UIImageView()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    setupView()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setupView() {
    contentView.addSubview(categoryImageView)
    categoryImageView.translatesAutoresizingMaskIntoConstraints = false
    categoryImageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
    categoryImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
    categoryImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
    categoryImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    
  }
  
  func configure(image Name: String) {
    categoryImageView.image = UIImage(named: Name)
  }
  
}

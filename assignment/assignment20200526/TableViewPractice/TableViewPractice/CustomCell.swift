//
//  CustomCell.swift
//  TableViewPractice
//
//  Created by 성단빈 on 2020/05/26.
//  Copyright © 2020 seong. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {
  
  let button = UIButton(type: .system)
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    button.setTitle("Button", for: .normal)
    button.backgroundColor = .systemYellow
    contentView.addSubview(button)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    button.frame = CGRect(
      x: frame.width - 120, y: 15,
      width: 100, height: frame.height - 30)
  }
  
}

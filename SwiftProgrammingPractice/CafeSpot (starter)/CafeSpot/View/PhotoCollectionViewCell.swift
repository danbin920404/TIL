//
//  PhotoCollectionViewCell.swift
//  CafeSpot
//
//  Created by 성단빈 on 2020/07/10.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
  // MARK: - Properties
  static let identifier = "PhotoCollectionViewCell"
  let cellView = CellView()
  
  // MARK: LifeCycle
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    setUI()
    setupConstraints()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setUI() {
    contentView.addSubview(cellView)
  }
  
  private func setupConstraints() {
    cellView.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      cellView.topAnchor.constraint(equalTo: topAnchor),
      cellView.leadingAnchor.constraint(equalTo: leadingAnchor),
      cellView.trailingAnchor.constraint(equalTo: trailingAnchor),
      cellView.bottomAnchor.constraint(equalTo: bottomAnchor)
    ])
  }
  
  // MARK: Configure Cell
  func configureCell(name: String, comment: String) {
    cellView.imageView.image = UIImage(named: name)
    cellView.titleName.text = name
    cellView.comment.text = comment
    buttonSet(name)
  }
  
  private func buttonSet(_ title: String) {
    let check = UserDefaults.standard.bool(forKey: title)
    print(check)
    let image = check ? UIImage(systemName: "heart.fill") : UIImage(systemName: "heart")
    let tintColor = check ? UIColor.red : UIColor.white

    cellView.favoriteBtn.setImage(image, for: .normal)
    cellView.favoriteBtn.tintColor = tintColor
  }
}

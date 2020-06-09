//
//  CollectionViewCell.swift
//  CollectionView
//
//  Created by 성단빈 on 2020/06/09.
//  Copyright © 2020 seong. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
  var collectionImageView = UIImageView()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    contentView.addSubview(collectionImageView)
    collectionImageView.translatesAutoresizingMaskIntoConstraints = false
    collectionImageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
    collectionImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
    collectionImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
    collectionImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}



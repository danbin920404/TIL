//
//  PhotoCollectionViewLayout.swift
//  CafeSpot
//
//  Created by 성단빈 on 2020/07/10.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import UIKit

class PhotoCollectionViewLayout: UICollectionViewLayout {
  // MARK: - Properties
  struct Layout {
    let numberOfColumns: Int
    let itemSize: CGSize
    let lineSpacing: CGFloat
    let interItemSpacing: CGFloat
    
    static let `default` = Layout(
      numberOfColumns: 2,
      itemSize: CGSize(width: 160, height: 120),
      lineSpacing: 10,
      interItemSpacing: 10
    )
  }
  
  
  
  // MARK: - View LifeCycle

  
  // MARK: - Layout
  
  // MARK: - Action Handler
}

// MARK: - Extension



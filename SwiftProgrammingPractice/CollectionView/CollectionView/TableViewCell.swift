//
//  TableViewCell.swift
//  CollectionView
//
//  Created by 성단빈 on 2020/06/09.
//  Copyright © 2020 seong. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
  var collectionView: UICollectionView!
  let flowLayout = UICollectionViewFlowLayout()
  
//  let col: UICollectionView = {
//    let layout = UICollectionViewFlowLayout()
//    layout.scrollDirection = .horizontal
//    return UICollectionView(frame: .zero, collectionViewLayout: layout)
//  }()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    flowLayout.scrollDirection = .horizontal
    
    collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
    collectionView.dataSource = self
    collectionView.delegate = self
    contentView.addSubview(collectionView)
    collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "CollectionViewCell")
    
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    collectionView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
    collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
    collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
    collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension TableViewCell: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 100
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
    
    cell.collectionImageView.image = UIImage(named: "3")
    
    return cell
  }
}

extension TableViewCell: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    8
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    8
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

    return CGSize(width: 200, height: 200)
  }
}

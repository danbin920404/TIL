//
//  CellView.swift
//  CafeSpot
//
//  Created by 성단빈 on 2020/07/11.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import UIKit

class CellView: UIView {
  // MARK: - Properties
  let imageView = UIImageView()
  let titleName = UILabel()
  let comment = UILabel()
  let favoriteBtn = UIButton()
  
  // MARK: LifeCycle
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    setUI()
    setLayout()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - Layout
  private func setUI() {
    [imageView, titleName, comment, favoriteBtn].forEach {
      addSubview($0)
      $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    imageView.layer.cornerRadius = 20
    imageView.clipsToBounds = true
    imageView.contentMode = .scaleToFill
    
    titleName.font = .boldSystemFont(ofSize: 15)
    
    comment.font = UIFont.systemFont(ofSize: 13)
    
    favoriteBtn.addTarget(self, action: #selector(favoriteBtnDidTap), for: .touchUpInside)
    print(UserDefaults.standard.dictionaryRepresentation().keys)
  }
  
  private func setLayout() {
    NSLayoutConstraint.activate([
      imageView.topAnchor.constraint(equalTo: topAnchor),
      imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
      imageView.leadingAnchor.constraint(equalTo: leadingAnchor)
    ])
    
    NSLayoutConstraint.activate([
      titleName.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 2),
      titleName.leadingAnchor.constraint(equalTo: leadingAnchor),
      titleName.bottomAnchor.constraint(equalTo: comment.topAnchor),
      titleName.heightAnchor.constraint(equalToConstant: 15)
    ])
    
    NSLayoutConstraint.activate([
      comment.topAnchor.constraint(equalTo: titleName.bottomAnchor),
      comment.leadingAnchor.constraint(equalTo: leadingAnchor),
      comment.bottomAnchor.constraint(equalTo: bottomAnchor),
      comment.heightAnchor.constraint(equalToConstant: 15)
    ])
    
    NSLayoutConstraint.activate([
      favoriteBtn.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: -10),
      favoriteBtn.bottomAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -10),
    ])
  }
  
  @objc private func favoriteBtnDidTap(_ sender: UIButton) {
    if UserDefaults.standard.bool(forKey: titleName.text!) {
      favoriteBtn.setImage(UIImage(systemName: "heart"), for: .normal)
      favoriteBtn.tintColor = .white
      UserDefaults.standard.removeObject(forKey: titleName.text!)
    } else {
      favoriteBtn.setImage(UIImage(systemName: "heart.fill"), for: .normal)
      favoriteBtn.tintColor = .red
      UserDefaults.standard.set(true, forKey: titleName.text!)
    }

    print(UserDefaults.standard.dictionaryRepresentation().keys)
  }
}

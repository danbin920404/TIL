//
//  ViewController.swift
//  CafeSpot
//
//  Copyright © 2020 Giftbot. All rights reserved.
//

import UIKit

final class HomeViewController: UIViewController {
  // MARK: - Properties
  let dataList = CafeParsing.shared.dataList
  
  private let titleLabel = UILabel()
  private let searchController: UISearchController = {
    let searchController = UISearchController(searchResultsController: nil)
    searchController.searchBar.placeholder = "검색..."
    return searchController
  }()
  
  lazy var collectionView = UICollectionView(
    frame: view.frame,
    collectionViewLayout: layout
  )
  
  let layout = UICollectionViewFlowLayout()
  
  // MARK: - View LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupUI()
    setupCollectionView()
    setLayout()
  }
  
  // MARK: - Layout
  private func setupUI() {
    view.backgroundColor = .systemBackground
    
    titleLabel.text = "CafeSpot"
    navigationItem.titleView = titleLabel
    navigationItem.searchController = searchController
    
    view.addSubview(collectionView)
  }
  
  private func setupCollectionView() {
    let itemSpacing: CGFloat = 8
    let itemCount: CGFloat = 2
    let sectionInset = UIEdgeInsets(top: 8, left: 20, bottom: 8, right: 20)
    
    layout.sectionInset = sectionInset
    layout.minimumInteritemSpacing = itemSpacing
    layout.minimumLineSpacing = itemSpacing
    
    let contentWidth = collectionView.bounds.width - (itemSpacing * (itemCount - 1)) - (sectionInset.left + sectionInset.right)
    let cellWidth = contentWidth / itemCount

    layout.itemSize = CGSize(width: cellWidth, height: cellWidth + 20)
    
    collectionView.register(
      PhotoCollectionViewCell.self,
      forCellWithReuseIdentifier: PhotoCollectionViewCell.identifier
    )
    collectionView.dataSource = self
    collectionView.backgroundColor = .systemBackground
  }
  
  private func setLayout() {
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
    ])
  }
  
  // MARK: - Action Handler
}

// MARK: - Extension
extension HomeViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    guard let count = dataList?.count else { return 0 }
    
    return count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(
      withReuseIdentifier: PhotoCollectionViewCell.identifier,
      for: indexPath
    ) as! PhotoCollectionViewCell
    if let data = dataList?[indexPath.row] {
      cell.configureCell(name: data.title, comment: data.description)
    }
    
    return cell
  }
}

//extension HomeViewController: IndexPathDelegate {
//  func cellIndexPath(cell: PhotoCollectionViewCell) -> String {
//    return cell.cellView.title
//  }
//  
//  
//}


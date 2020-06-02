//
//  WishListViewController.swift
//  Dominos11_Starter
//
//  Created by Lee on 2020/05/26.
//  Copyright © 2020 Kira. All rights reserved.
//

import UIKit

class WishListViewController: UIViewController {
  
  let wishListTableView = UITableView()
  var wishMenuName: [String] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    title = "Wish List"
    setupWishTableView()
  }
  override func viewWillAppear(_ animated: Bool) {
    for (key, _) in DataWishListDics {
      if !wishMenuName.contains(key) {
        wishMenuName.append(key)
      }
    }
    wishListTableView.reloadData()
  }
  private func setupWishTableView() {
    wishListTableView.frame = view.frame
    wishListTableView.dataSource = self
    wishListTableView.delegate = self
    wishListTableView.rowHeight = 120
    view.addSubview(wishListTableView)
    
    let listDeleteBtn = UIBarButtonItem(title: "목록 지우기", style: .done, target: self, action: #selector(listDeleteBtnAction))
    let oderDeleteBtn = UIBarButtonItem(title: "주문", style: .done, target: self, action: #selector(oderDeleteBtnAction))
    
    navigationItem.leftBarButtonItem = listDeleteBtn
    navigationItem.rightBarButtonItem = oderDeleteBtn
  }
  
  @objc private func listDeleteBtnAction(_ sender: UIBarItem) {
    DataWishListDics.removeAll()
    wishMenuName.removeAll()
    wishListTableView.reloadData()
  }
  
  @objc private func oderDeleteBtnAction(_ sender: UIBarItem) {
    
    let alert = UIAlertController (title: "결제내역", message: totalMenuCount(), preferredStyle: .alert)
    let alertAction1 = UIAlertAction(title: "결제", style: .default) { _ in
      DataWishListDics.removeAll()
      self.wishMenuName.removeAll()
      self.wishListTableView.reloadData()
    }
    let alertAction2 = UIAlertAction(title: "취소", style: .default)
    alert.addAction(alertAction1)
    alert.addAction(alertAction2)
    present(alert, animated: true)
  }
  func totalMenuCount() -> String {
    var totalMessage = ""
    var totalMoney = 0
    for index in wishMenuName {
      totalMessage += (index + " - " + "\(DataWishListDics[index]!)개\n")
      for (_, value) in Data {
        if value["menu"]!.contains(where: { (str: Any) -> Bool in
          if let test = str as? String {
            if test == index {
              return true
            }
          }
          return false
        }) {
          if let price = value["price"]![0] as? Int {
            totalMoney += price
          }
        }
      }
    }
    totalMessage += "\(totalMoney) 원"
    
    return totalMessage
  }
}
extension WishListViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return wishMenuName.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let wishListCell = wishListTableView.dequeueReusableCell(withIdentifier: "Custom") ?? UITableViewCell(style: .subtitle, reuseIdentifier: "Custom")
    wishListCell.textLabel?.text = "\(wishMenuName[indexPath.row])"
    wishListCell.imageView?.image = UIImage(named: wishMenuName[indexPath.row])
    guard let checkCount = DataWishListDics[wishMenuName[indexPath.row]] else { return wishListCell }
    wishListCell.detailTextLabel?.text = "주문수량 : " + "\(checkCount)"
    wishListCell.contentView.backgroundColor = .white
    return wishListCell
  }
}
extension WishListViewController: UITableViewDelegate {
  
}

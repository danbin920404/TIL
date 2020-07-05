//
//  WishListViewController.swift
//  Dominos11_Starter
//
//  Created by Lee on 2020/05/26.
//  Copyright © 2020 Kira. All rights reserved.
//

import UIKit

class WishListViewController: UIViewController {
  
  private let shared = Singleton.shared
  
  private let tableView = UITableView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setNavigation()
    setUI()
    setConstranint()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    tableView.reloadData()
  }
  
  private func setNavigation() {
    navigationItem.title = "Wish List"
    
    let resetBarButton = UIBarButtonItem(title: "목록 지우기", style: .done, target: self, action: #selector(navigationBarButtonAction))
    resetBarButton.tag = 0
    navigationItem.leftBarButtonItem = resetBarButton
    
    let oderBarButton = UIBarButtonItem(title: "주문", style: .done, target: self, action: #selector(navigationBarButtonAction))
    oderBarButton.tag = 1
    navigationItem.rightBarButtonItem = oderBarButton
  }
  
  @objc private func navigationBarButtonAction(_ sender: UIBarButtonItem) {
    switch sender.tag {
    case 0:
      shared.wishListDict.removeAll()
      tableView.reloadData()
      
    case 1:
      let keys = shared.wishListDict.keys.sorted()
      var temp = "\n"
      var sum = 0
      for key in keys {
        for category in menuData {
          for product in category.products {
            if product.name == key {
              temp += "\(key) - \(shared.wishListDict[key]!)개 \n"
              sum += (shared.wishListDict[key]! * product.price)
            }
          }
        }
      }
      temp += "\n결제금액 : \(sum)원"
      alertAction(tilte: "결제내역", message: temp)
      
    default:
      break
    }
  }
  
  private func alertAction(tilte: String, message:String) {
    let alertController = UIAlertController(title: tilte, message: message, preferredStyle: .alert)
    let okAlert = UIAlertAction(title: "결제하기", style: .default) { _ in
      self.shared.wishListDict.removeAll()
      self.tableView.reloadData()
    }
    let cancelAlert = UIAlertAction(title: "취 소", style: .cancel, handler: nil)
    alertController.addAction(okAlert)
    alertController.addAction(cancelAlert)
    present(alertController, animated: true)
  }
  
  private func setUI() {
    view.backgroundColor = .white
    
    tableView.dataSource = self
    tableView.rowHeight = 100
    view.addSubview(tableView)
  }
  
  private func setConstranint() {
    let guide = view.safeAreaLayoutGuide
    
    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.topAnchor.constraint(equalTo: guide.topAnchor).isActive = true
    tableView.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
    tableView.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
    tableView.bottomAnchor.constraint(equalTo: guide.bottomAnchor).isActive = true
  }
}

extension WishListViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return shared.wishListDict.keys.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let keys = shared.wishListDict.keys.sorted()
    
    let cell: UITableViewCell
    if let reusableCell = tableView.dequeueReusableCell(withIdentifier: "cell") {
      cell = reusableCell
    } else {
      cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
    }
    
    cell.imageView?.image = UIImage(named: keys[indexPath.row])
    cell.textLabel?.text = keys[indexPath.row]
    cell.detailTextLabel?.text = "주문수량 : \(shared.wishListDict[keys[indexPath.row]]!)"
    cell.selectionStyle = .none
    
    return cell
  }
}

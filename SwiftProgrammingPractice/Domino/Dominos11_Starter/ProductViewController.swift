//
//  ProductViewController.swift
//  Dominos11_Starter
//
//  Created by Lee on 2020/05/26.
//  Copyright © 2020 Kira. All rights reserved.
//

import UIKit

class ProductViewController: UIViewController {
  let tableView = UITableView()
  var products: [Product] = []
  private let cellID = "ProductTableViewCell"
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupView()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    if let indexPath = tableView.indexPathForSelectedRow {
      tableView.deselectRow(at: indexPath, animated: true)
    }
  }
  
  private func setupView() {
    view.addSubview(tableView)
    tableView.dataSource = self
    tableView.delegate = self
    tableView.rowHeight = 120
    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
    tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
  }
  
}

extension ProductViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return products.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let menuName = products[indexPath.row].name
    let cell: UITableViewCell
    if let reusableCell = tableView.dequeueReusableCell(withIdentifier: cellID) {
      cell = reusableCell
    } else {
      cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellID)
    }
    cell.imageView?.image = UIImage(named: menuName)
    cell.textLabel?.text = menuName
    cell.detailTextLabel?.text = "\(products[indexPath.row].price) 원"
    
    return cell
  }
}

extension ProductViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let detailVC = DetailViewController()
    detailVC.pickMenuInformation = products[indexPath.row]
     
    
    navigationController?.pushViewController(detailVC, animated: true)
  }
}

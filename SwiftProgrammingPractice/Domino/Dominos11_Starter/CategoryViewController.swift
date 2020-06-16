//
//  CategoryViewController.swift
//  Dominos11_Starter
//
//  Created by Lee on 2020/05/26.
//  Copyright © 2020 Kira. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController {
  let tableView = UITableView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupNavigation()
    setupView()
  }
  
  private func setupNavigation() {
    navigationItem.title = "Domino's"
  }
  
  private func setupView() {
    view.addSubview(tableView)
    tableView.dataSource = self
    tableView.delegate = self
    tableView.register(CategoryCell.self, forCellReuseIdentifier: CategoryCell.identifier)
    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
    tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    
    let imageView = UIImageView(image: UIImage(named: "logo"))
    tableView.tableHeaderView = imageView
    imageView.frame = CGRect(origin: .zero, size: CGSize(width: view.frame.width, height: 200))
    imageView.contentMode = .scaleAspectFit
  }
}



extension CategoryViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return menuData.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: CategoryCell.identifier, for: indexPath) as! CategoryCell
    cell.configure(image: menuData[indexPath.row].category)
    
    return cell
  }
}

extension CategoryViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 100
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let productVC = ProductViewController()
    productVC.navigationItem.title = menuData[indexPath.row].category
    productVC.view.backgroundColor = .systemBackground
    productVC.products = menuData[indexPath.row].products
    navigationController?.pushViewController(productVC, animated: true)
  }
}

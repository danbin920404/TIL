//
//  ViewController.swift
//  TableViewRefresh
//
//  Created by 성단빈 on 2020/05/26.
//  Copyright © 2020 seong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  let tableView = UITableView()
  let refreshControl = UIRefreshControl()
  lazy var data = Array(1...dataMaxCount)
  let dataMaxCount = 20
  let randomMax = 50
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    firstSetup()
  }
  
  private func firstSetup() {
    tableView.frame = view.frame
    tableView.dataSource = self
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellID")
    view.addSubview(tableView)
    
    refreshControl.tintColor = .black
    refreshControl.attributedTitle = NSAttributedString(string: "기다리세요")
    refreshControl.addTarget(self, action: #selector(refreshAction), for: .valueChanged)
    tableView.refreshControl = refreshControl
  }
  
  @objc private func refreshAction() {
    data.removeAll()
    
    for _ in 1...dataMaxCount {
      data.append(randomNumber())
    }
    print(data.count)
    
    tableView.refreshControl?.endRefreshing()
    tableView.reloadData()
  }
  
  private func randomNumber() -> Int {
    guard let result = (1...dataMaxCount + randomMax).randomElement() else { return 0 }
    
    if data.contains(result) {
      return randomNumber()
    } else {
      return result
    }
  }
}

extension ViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return data.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "CellID", for: indexPath)
    cell.textLabel?.text = "\(data[indexPath.row])"
    
    return cell
  }
}


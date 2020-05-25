//
//  TableViewRefresh.swift
//  TableViewPractice
//
//  Created by giftbot on 2020/05/25.
//  Copyright © 2020 giftbot. All rights reserved.
//

import UIKit

final class TableViewRefresh: UIViewController {
  
  /***************************************************
   UIRefreshControl을 이용해 목록을 갱신할 때마다 임의의 숫자들이 출력되도록 할 것
   랜덤 숫자의 범위는 출력할 숫자 개수의 +50 이며, 모든 숫자는 겹치지 않아야 함.
   e.g.
   20개 출력 시, 랜덤 숫자의 범위는 0 ~ 70
   40개 출력 시, 랜덤 숫자의 범위는 0 ~ 90
   
   < 참고 >
   (0...10).randomElement()  -  0부터 10사이에 임의의 숫자를 뽑아줌
   ***************************************************/
  
//  var data = Array(0...20)
  let count = 20
  let range = 50
  lazy var data = Array(1...count)
  
  override var description: String { "Practice 2 - Refresh" }
  let tableView = UITableView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupTableView()
  }
  
  func setupTableView() {
    tableView.frame = view.frame
    view.addSubview(tableView)
    
    tableView.dataSource = self
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellID")
    
    let refreshC = UIRefreshControl()
    refreshC.attributedTitle = NSAttributedString(string: "Refreshing...")
    refreshC.tintColor = .red
    refreshC.addTarget(self, action: #selector(reloadData), for: .valueChanged)
    tableView.refreshControl = refreshC
    
  }
  
  @objc func reloadData() {
    data.removeAll()
    for _ in 1...count {
      data.append(generateRandomNumber())
    }

    tableView.refreshControl?.endRefreshing()
    tableView.reloadData()
  }
  
  func generateRandomNumber() -> Int {
    let randomNumber = (1...count + range).randomElement()!
    
    if data.contains(randomNumber) {
      return generateRandomNumber()
    }
    return randomNumber
  }
}

// MARK: - UITableViewDataSource

extension TableViewRefresh: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return data.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "CellID", for: indexPath)
    cell.textLabel?.text = "\(data[indexPath.row])"
    print(indexPath.row)
    return cell
  }
  
  func randomNum() {
    
  }
}

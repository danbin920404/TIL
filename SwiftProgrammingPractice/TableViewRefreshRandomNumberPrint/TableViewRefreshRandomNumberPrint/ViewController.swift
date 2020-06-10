//
//  ViewController.swift
//  TableViewRefreshRandomNumberPrint
//
//  Created by 성단빈 on 2020/06/10.
//  Copyright © 2020 seong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  /***************************************************
   UIRefreshControl을 이용해 목록을 갱신할 때마다 임의의 숫자들이 출력되도록 할 것
   랜덤 숫자의 범위는 출력할 숫자 개수의 +50 이며, 모든 숫자는 겹치지 않아야 함.
   e.g.
   20개 출력 시, 랜덤 숫자의 범위는 0 ~ 70
   40개 출력 시, 랜덤 숫자의 범위는 0 ~ 90
   
   < 참고 >
   (0...10).randomElement()  -  0부터 10사이에 임의의 숫자를 뽑아줌
   ***************************************************/
  
  let tableView = UITableView()
  let refreshC = UIRefreshControl()
  let minNumber = 0
  let maxNumber = 70
  let getNumCount = 20
  var data = Array(0...20)
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupTableView()
  }
  
  func setupTableView() {
    tableView.frame = view.frame
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellID")
    tableView.dataSource = self
    
    refreshC.attributedTitle = NSAttributedString(string: "랜덤 숫자...")
    refreshC.addTarget(self, action: #selector(refreshAction), for: .valueChanged)
    tableView.refreshControl = refreshC
    view.addSubview(tableView)
  }
  
  @objc private func refreshAction() {
    data.removeAll()
    
    for _ in 0 ..< getNumCount {
     
      data.append(randomNumber(minNum: minNumber, maxNum: maxNumber))
      print(data)
    }
    
    tableView.refreshControl?.endRefreshing()
    tableView.reloadData()
  }
  
  private func randomNumber(minNum: Int,maxNum: Int) -> Int {
    let number = Array(minNum...maxNum).randomElement()!
    
    if data.contains(number) {
      return randomNumber(minNum: minNumber, maxNum: maxNumber)
    }
    
    return number
  }
}

// MARK: - UITableViewDataSource

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


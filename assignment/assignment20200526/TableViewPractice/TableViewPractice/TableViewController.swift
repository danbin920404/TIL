//
//  TableViewController.swift
//  TableViewPractice
//
//  Created by 성단빈 on 2020/05/26.
//  Copyright © 2020 seong. All rights reserved.
//

import UIKit

class TableViewController: UIViewController {
  var tableView = UITableView()
  
  var data: [Int] = Array(1...50)
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setingView()
  }
  private func setingView() {
    tableView.frame = view.frame
    view.addSubview(tableView)
    tableView.dataSource = self
    tableView.register(CustomCell.self, forCellReuseIdentifier: "CellID")
  }
  
  @objc private func buttonAction(_ sender: UIButton) {
    let indexPath = IndexPath(row: sender.tag, section: 0)
    print(indexPath)
    if let cell = tableView.cellForRow(at: indexPath) as? CustomCell {
      let newValue = data[sender.tag] + 1
      data[sender.tag] = newValue
      cell.textLabel?.text = "\(newValue)"
    }
  }
  
}

extension TableViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return data.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "CellID", for: indexPath) as! CustomCell
    cell.textLabel?.text = "\(data[indexPath.row])"
    cell.button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
    // tag로 특정했을 경우 섹션이 여러 개 있을 경우 겹치는 상황이 나올 수도 있으므로 아래와 같이 겹치지않게 로직 짜기
//    cell.button.tag = (indexPath.section * 1000) + indexPath.row
    cell.button.tag = indexPath.row
    
    return cell
  }
}

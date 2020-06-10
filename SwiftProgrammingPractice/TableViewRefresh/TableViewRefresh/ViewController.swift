//
//  ViewController.swift
//  TableViewRefresh
//
//  Created by 성단빈 on 2020/06/10.
//  Copyright © 2020 seong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  let tableView = UITableView()
  let button = UIButton()
  let refreshC = UIRefreshControl()
  var data = Array(1...50)

  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupTableView()
    setupButton()
  }
  
  private func setupTableView() {
    view.addSubview(tableView)
    tableView.frame = view.frame
    tableView.dataSource = self
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellID")
    // refresh할 때 빙글빙글 도는 거 색상
    refreshC.tintColor = .blue
    
    // refresh할 때 밑에 타이틀
//    refreshC.attributedTitle = NSAttributedString(string: "Refreshing...")
    
    // refresh할 때 밑에 타이틀을 좀 더 상세하게 꾸미고 싶다면
    let attrStr = NSAttributedString(string: "Refreshing...", attributes: [
      .font: UIFont.systemFont(ofSize: 25),
      .foregroundColor: UIColor.red,
      .kern: 6
    ])
    
    refreshC.addTarget(self, action: #selector(CellRefresh), for: .valueChanged)
    
    // tableView에 추가
    refreshC.attributedTitle = attrStr
    tableView.refreshControl = refreshC
  }
  
  private func setupButton() {
    tableView.addSubview(button)
    button.setTitle("Refresh", for: .normal)
    button.setTitleColor(.black, for: .normal)
    button.backgroundColor = .brown
    button.layer.cornerRadius = 5
    button.addTarget(self, action: #selector(CellRefresh), for: .touchUpInside)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
    button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
  }
  
  @objc private func CellRefresh(_ sender: UIButton) {
    data.reverse()
    // Refresh를 종료 시키는 메소드
    tableView.refreshControl?.endRefreshing()
    tableView.reloadData()
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

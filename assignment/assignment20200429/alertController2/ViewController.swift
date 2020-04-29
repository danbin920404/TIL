//
//  ViewController.swift
//  alertController2
//
//  Created by 성단빈 on 2020/04/29.
//  Copyright © 2020 seong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  let printLabel: UILabel = UILabel()
  let button: UIButton = UIButton()

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)
    
    printLbStyle()
    btnStyle()
  }
  private func printLbStyle() {
    printLabel.frame.size = CGSize(width: 200, height: 50)
    printLabel.center = CGPoint(x: view.center.x, y: 100)
    printLabel.text = "Test Labal"
    printLabel.textAlignment = .center
    printLabel.textColor = .black
    view.addSubview(printLabel)
  }
  
  private func btnStyle() {
    button.setTitle("alert", for: .normal)
    button.setTitleColor(.black, for: .normal)
    button.frame.size = CGSize(width: 200, height: 50)
    button.center = view.center
    button.addTarget(self, action: #selector(alertAction), for: .touchUpInside)
    view.addSubview(button)
  }
  
  @objc private func alertAction() {
    let alertVc = AlertViewController()
    alertVc.view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
    alertVc.modalPresentationStyle = .overFullScreen
    
    present(alertVc, animated: true)
  }
}


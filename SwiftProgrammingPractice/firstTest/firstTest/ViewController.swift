//
//  ViewController.swift
//  firstTest
//
//  Created by 성단빈 on 2020/05/01.
//  Copyright © 2020 seong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  let 소지금Label: UILabel = UILabel()
  let 결제금액Label: UILabel = UILabel()
  let 소지금PrintLabel: UILabel = UILabel()
  let 결제금액PrintLabel: UILabel = UILabel()
  let 초기화Btn: UIButton = UIButton(type: .system)
  let 결제Btn: UIButton = UIButton(type: .system)
  var money: Int = 70000
  var total: Int = 0
  @IBOutlet weak var 짜장면수량Label: UILabel!
  @IBOutlet weak var 짬뽕수량Label: UILabel!
  @IBOutlet weak var 탕수육수량Label: UILabel!
  var 짜장면수량: Int = 0
  var 짬뽕수량: Int = 0
  var 탕수육수량: Int = 0
  
  override func viewDidLoad() {
    super.viewDidLoad()
  
    소지금LabelStyle()
    결제금액LabelStyle()
    소지금PrintLabelStyle()
    결제금액PrintLabelStyle()
    초기화BtnStyle()
    결제BtnStyle()
  }
  func 소지금LabelStyle() {
    소지금Label.frame = CGRect(x: 50, y: 370, width: 60, height: 30)
    소지금Label.backgroundColor = .green
    소지금Label.text = "소지금"
    view.addSubview(소지금Label)
  }
  
  func 결제금액LabelStyle() {
    결제금액Label.frame = CGRect(x: 50, y: 430, width: 60, height: 30)
    결제금액Label.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
    결제금액Label.text = "결제금액"
    view.addSubview(결제금액Label)
  }
  
  func 소지금PrintLabelStyle() {
    소지금PrintLabel.frame = CGRect(x: 120, y: 370, width: 100, height: 30)
    소지금PrintLabel.backgroundColor = .green
    소지금PrintLabel.text = String(money) + "원"
    소지금PrintLabel.textAlignment = .right
    view.addSubview(소지금PrintLabel)
  }
  
  func 결제금액PrintLabelStyle() {
    결제금액PrintLabel.frame = CGRect(x: 120, y: 430, width: 100, height: 30)
    결제금액PrintLabel.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
    결제금액PrintLabel.text = String(total) + "원"
    결제금액PrintLabel.textAlignment = .right
    view.addSubview(결제금액PrintLabel)
  }
  
  func 초기화BtnStyle() {
    초기화Btn.setTitle("초기화", for: .normal)
    초기화Btn.frame = CGRect(x: 270, y: 370, width: 60, height: 30)
    초기화Btn.backgroundColor = .black
    초기화Btn.addTarget(self, action: #selector(초기화BtnAction), for: .touchUpInside)
    view.addSubview(초기화Btn)
  }
  
  func 결제BtnStyle() {
    결제Btn.setTitle("결제", for: .normal)
    결제Btn.frame = CGRect(x: 270, y: 430, width: 60, height: 30)
    결제Btn.backgroundColor = .black
    결제Btn.addTarget(self, action: #selector(결제BtnAction), for: .touchUpInside)
    view.addSubview(결제Btn)
  }
  
  @IBAction func 짜장면버튼(_ sender: Any) {
    짜장면수량 += 1
    total += 5000
    결제금액PrintLabel.text = String(total) + "원"
    짜장면수량Label.text = String(짜장면수량)
  }
  
  @IBAction func 짬뽕버튼(_ sender: Any) {
    짬뽕수량 += 1
    total += 6000
    결제금액PrintLabel.text = String(total) + "원"
    짬뽕수량Label.text = String(짬뽕수량)
  }
  
  @IBAction func 탕수육버튼(_ sender: Any) {
    탕수육수량 += 1
    total += 12000
    결제금액PrintLabel.text = String(total) + "원"
    탕수육수량Label.text = String(탕수육수량)
  }
  
  @objc private func 초기화BtnAction(_ sender: UIButton) {
    total = 0
    money = 70000
    짜장면수량 = 0
    짬뽕수량 = 0
    탕수육수량 = 0
    짜장면수량Label.text = String(짜장면수량)
    짬뽕수량Label.text = String(짬뽕수량)
    탕수육수량Label.text = String(탕수육수량)
    소지금PrintLabel.text = String(money) + "원"
    결제금액PrintLabel.text = String(total) + "원"
  }
  
  @objc private func 결제BtnAction(_ sender: UIButton) {
    let message: String = "총 결제금액은" + String(total) + "원입니다."
    let alert: UIAlertController = UIAlertController(title: "결제하기", message: message, preferredStyle: .alert)
    let cancelBtn = UIAlertAction(title: "취소", style: .cancel) { _ in
      
    }
    let 결제Btn = UIAlertAction(title: "결제", style: .destructive) { _ in
      if self.money > self.total {
        self.money = self.money - self.total
        self.total = 0
        self.짜장면수량 = 0
        self.짬뽕수량 = 0
        self.탕수육수량 = 0
        self.짜장면수량Label.text = String(self.self.짜장면수량)
        self.짬뽕수량Label.text = String(self.self.짬뽕수량)
        self.탕수육수량Label.text = String(self.self.탕수육수량)
        self.결제금액PrintLabel.text = String(self.self.total) + "원"
        self.소지금PrintLabel.text = String(self.self.money) + "원"
      }
    }
    alert.addAction(cancelBtn)
    alert.addAction(결제Btn)
    
    present(alert, animated: true)
    
    
  }
}


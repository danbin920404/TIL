//
//  ViewController.swift
//  test2project
//
//  Created by 성단빈 on 2020/05/01.
//  Copyright © 2020 seong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  let menulabel1: UILabel = UILabel()
  let menulabel2: UILabel = UILabel()
  let menulabel3: UILabel = UILabel()
  
  let menuCount1: UILabel = UILabel()
  let menuCount2: UILabel = UILabel()
  let menuCount3: UILabel = UILabel()
  
  let menuBtn1: UIButton = UIButton(type: .system)
  let menuBtn2: UIButton = UIButton(type: .system)
  let menuBtn3: UIButton = UIButton(type: .system)
  
  let print1: UILabel = UILabel()
  let print2: UILabel = UILabel()
  let printBtn: UIButton = UIButton(type: .system)
  
  let resetBtn: UIButton = UIButton(type: .system)
  
  var mC1: Int = 0
  var mC2: Int = 0
  var mC3: Int = 0
  
  var total: Int = 0
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
    
    label1Style()
    label2Style()
    label3Style()
    menuCount1Style()
    menuCount2Style()
    menuCount3Style()
    menuBtn1Style()
    menuBtn2Style()
    menuBtn3Style()
    print1Style()
    print2Style()
    printBtnStyle()
    resetBtnStyle()
  }
  private func label1Style() {
    menulabel1.frame = CGRect(x: 30, y: 50, width: 100, height: 50)
    menulabel1.text = "짜장면"
    menulabel1.textAlignment = .center
    view.addSubview(menulabel1)
  }
  
  private func label2Style() {
    menulabel2.frame = CGRect(x: 130, y: 50, width: 100, height: 50)
    menulabel2.text = "짬뽕"
    menulabel2.textAlignment = .center
    view.addSubview(menulabel2)
  }
  
  private func label3Style() {
    menulabel3.frame = CGRect(x: 230, y: 50, width: 100, height: 50)
    menulabel3.text = "탕수육"
    menulabel3.textAlignment = .center
    view.addSubview(menulabel3)
  }
  
  private func menuCount1Style() {
    menuCount1.frame = CGRect(x: 30, y: 120, width: 100, height: 50)
    menuCount1.text = "0"
    menuCount1.textAlignment = .center
    view.addSubview(menuCount1)
  }
  
  private func menuCount2Style() {
    menuCount2.frame = CGRect(x: 130, y: 120, width: 100, height: 50)
    menuCount2.text = "0"
    menuCount2.textAlignment = .center
    view.addSubview(menuCount2)
  }
  
  private func menuCount3Style() {
    menuCount3.frame = CGRect(x: 230, y: 120, width: 100, height: 50)
    menuCount3.text = "0"
    menuCount3.textAlignment = .center
    view.addSubview(menuCount3)
  }
  
  private func menuBtn1Style() {
    menuBtn1.setTitle("추가", for: .normal)
    menuBtn1.frame = CGRect(x: 30, y: 190, width: 100, height: 50)
    menuBtn1.addTarget(self, action: #selector(menuBtn1Action), for: .touchUpInside)
    view.addSubview(menuBtn1)
  }
  
  private func menuBtn2Style() {
    menuBtn2.setTitle("추가", for: .normal)
    menuBtn2.frame = CGRect(x: 130, y: 190, width: 100, height: 50)
    menuBtn2.addTarget(self, action: #selector(menuBtn2Action), for: .touchUpInside)
    view.addSubview(menuBtn2)
  }
  
  private func menuBtn3Style() {
    menuBtn3.setTitle("추가", for: .normal)
    menuBtn3.frame = CGRect(x: 230, y: 190, width: 100, height: 50)
    menuBtn3.addTarget(self, action: #selector(menuBtn3Action), for: .touchUpInside)
    view.addSubview(menuBtn3)
  }
  
  private func print1Style() {
    print1.frame = CGRect(x: 30, y: 300, width: 80, height: 30)
    print1.text = "결제금액"
    print1.textAlignment = .center
    print1.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
    view.addSubview(print1)
  }
  
  private func print2Style() {
    print2.frame = CGRect(x: 130, y: 300, width: 120, height: 30)
    print2.text = String(total)
    print2.textAlignment = .right
    print2.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
    view.addSubview(print2)
  }
  private func printBtnStyle() {
    printBtn.setTitle("결제", for: .normal)
    printBtn.frame = CGRect(x: 280, y: 300, width: 50, height: 30)
    printBtn.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
    printBtn.addTarget(self, action: #selector(printBtnAction), for: .touchUpInside)
    view.addSubview(printBtn)
  }
  
  private func resetBtnStyle() {
    resetBtn.setTitle("reset", for: .normal)
    resetBtn.frame = CGRect(x: 280, y: 350, width: 50, height: 30)
    resetBtn.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
    resetBtn.addTarget(self, action: #selector(resetBtnAction), for: .touchUpInside)
    view.addSubview(resetBtn)
  }
  
  @objc private func menuBtn1Action(_ sender: UIButton) {
    mC1 += 1
    total += 5000
    menuCount1.text = String(mC1)
    print2.text = String(total)
  }
  
  @objc private func menuBtn2Action(_ sender: UIButton) {
    mC2 += 1
    total += 6000
    menuCount2.text = String(mC2)
    print2.text = String(total)
  }
  
  @objc private func menuBtn3Action(_ sender: UIButton) {
    mC3 += 1
    total += 12000
    menuCount3.text = String(mC3)
    print2.text = String(total)
  }
  
  @objc private func resetBtnAction(_ sender: UIButton) {
    mC1 = 0
    mC2 = 0
    mC3 = 0
    total = 0
    menuCount1.text = String(mC1)
    menuCount2.text = String(mC2)
    menuCount3.text = String(mC3)
    print2.text = String(total)
  }
  
  @objc private func printBtnAction(_ sender: UIButton) {
    let message: String = "결제 금액은 \(total)원입니다."
    let alertController = UIAlertController(title: "결제창", message: message, preferredStyle: .alert)
    
    let cancelBtn: UIAlertAction = UIAlertAction(title: "취소", style: .cancel) { _ in
      
    }
    
    let paymentBtn: UIAlertAction = UIAlertAction(title: "결제", style: .destructive) { _ in
      let confirmAlert = UIAlertController(title: "결제창", message: "주문이 완료됐습니다.", preferredStyle: .alert)
      let confirmAlertCancelBtn = UIAlertAction(title: "확인", style: .cancel, handler: nil)
      confirmAlert.addAction(confirmAlertCancelBtn)
      
      self.mC1 = 0
      self.mC2 = 0
      self.mC3 = 0
      self.total = 0
      self.menuCount1.text = String(self.mC1)
      self.menuCount2.text = String(self.mC2)
      self.menuCount3.text = String(self.mC3)
      self.print2.text = String(self.total)
      
      self.present(confirmAlert, animated: true)
    }
    
    alertController.addAction(paymentBtn)
    alertController.addAction(cancelBtn)
    
    present(alertController, animated: true)
  }
}


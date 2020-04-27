//
//  ViewController.swift
//  HelloWorld
//
//  Created by 성단빈 on 2020/04/23.
//  Copyright © 2020 seong. All rights reserved.
//

//1. Button을 누를 때마다 Label 의 값 변경하기

//  1) +버튼 또는 -버튼을 누르면 숫자가 증가/감소하도록 만들기

//  2) 숫자가 증가할 때는 label의 텍스트 색을 파란색, 감소할 때는 빨간색으로 변경

import UIKit

class ViewController: UIViewController {
  let plusBtn = UIButton(type: .system)
  let minusBtn = UIButton(type: .system)
  let resetBtn = UIButton(type: .system)
  let label = UILabel()
  var count: Int = 0
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
//    plusBtn.frame = CGRect(x: 100, y: 400, width: 100, height: 50)
    plusBtn.frame.size = CGSize(width: 50, height: 50)
    plusBtn.center = CGPoint(x: view.center.x - 50, y: 400)
    plusBtn.setTitle("PLUS", for: .normal)
    view.addSubview(plusBtn)
    
//    resetBtn.frame = CGRect(x: 150, y: 400, width: 100, height: 50)
    resetBtn.frame.size = CGSize(width: 50, height: 50)
    resetBtn.center = CGPoint(x: view.center.x, y: 400)
    resetBtn.setTitle("RESET", for: .normal)
    view.addSubview(resetBtn)
    
//    minusBtn.frame = CGRect(x: 200, y: 400, width: 100, height: 50)
    minusBtn.frame.size = CGSize(width: 50, height: 50)
    minusBtn.center = CGPoint(x: view.center.x + 50, y: 400)
    minusBtn.setTitle("MINUS", for: .normal)
    view.addSubview(minusBtn)
    
//    label.frame = CGRect(x: 150, y: 200, width: 100, height: 50)
    label.frame.size = CGSize(width: 100, height: 50)
    label.center = CGPoint(x: view.center.x, y: 200)
    
    label.text = "카운트"
    label.textAlignment = .center
    label.textColor = .gray
    label.font = UIFont.systemFont(ofSize: 30)
    view.addSubview(label)
    
    plusBtn.addTarget(self, action: #selector(countPlusFn(_:)), for: .touchUpInside)
    
    resetBtn.addTarget(self, action: #selector(countReset(_:)), for: .touchUpInside)
    
    minusBtn.addTarget(self, action: #selector(countMinusFn(_:)), for: .touchUpInside)
  }
  @objc func countPlusFn(_ sender: Any) {
    count = count + 1
    label.text = String(count)
    label.textColor = .blue
  }
  
  @objc func countReset(_ sender: Any) {
    count = 0
    label.text = String(count)
    label.textColor = .black
  }
  
  @objc func countMinusFn(_ sender: Any) {
    count = count - 1
    label.text = String(count)
    label.textColor = .red
  }
}


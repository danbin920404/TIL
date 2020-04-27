//
//  ViewController.swift
//  dismissViewcotroller
//
//  Created by 성단빈 on 2020/04/27.
//  Copyright © 2020 seong. All rights reserved.
//

import UIKit

//문제: 3개의 뷰 컨트롤러 사이에 화면 전환하기
//     A는 B로 가는 버튼
//     B는 A로 돌아가는 dismiss 버튼과 C로 가는 버튼
//     C는 A 또는 B로 돌아가는 dismiss 버튼
//
//(참고)
//A -> B
//  <- B -> C
//     B <- C
//A   <-    C

class ViewController: UIViewController {
  let viewBtn: UIButton = UIButton()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
    
    viewBtnFn()
  }
  private func viewBtnFn() {
    viewBtn.setTitle("A화면", for: .normal)
    viewBtn.titleLabel?.font = UIFont.preferredFont(forTextStyle: .title2)
    viewBtn.sizeToFit()
    viewBtn.center = view.center
    viewBtn.addTarget(self, action: #selector(viewTapBtn), for: .touchUpInside)
    view.addSubview(viewBtn)
  }
  
  @objc private func viewTapBtn(_ sender: UIButton) {
    let aView = AViewController()
    
    aView.view.backgroundColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
    present(aView, animated: true)
  }

}


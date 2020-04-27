//
//  AViewController.swift
//  dismissViewcotroller
//
//  Created by 성단빈 on 2020/04/27.
//  Copyright © 2020 seong. All rights reserved.
//

import UIKit

class AViewController: UIViewController {
  let viewComebackBtn: UIButton = UIButton()
  let bViewBtn: UIButton = UIButton()

  override func viewDidLoad() {
    super.viewDidLoad()
    
    viewComebackBtnFn()
    bViewBtnFn()
  }
  private func viewComebackBtnFn() {
    viewComebackBtn.setTitle("Home", for: .normal)
    viewComebackBtn.sizeToFit()
    viewComebackBtn.center = CGPoint(x: view.center.x - 50, y: view.center.y)
    viewComebackBtn.addTarget(self, action: #selector(viewComebackTapBtn), for: .touchUpInside)
    view.addSubview(viewComebackBtn)
  }
  
  private func bViewBtnFn() {
    bViewBtn.setTitle("B", for: .normal)
    bViewBtn.sizeToFit()
    bViewBtn.center = CGPoint(x: view.center.x + 50, y: view.center.y)
    bViewBtn.addTarget(self, action: #selector(bViewTapBtn), for: .touchUpInside)
    view.addSubview(bViewBtn)
  }
  
  @objc private func viewComebackTapBtn(_ sender: UIButton) {
    dismiss(animated: true)
  }
  
  @objc private func bViewTapBtn(_ sender: UIButton) {
    let bView = BViewController()
    
    bView.view.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
    present(bView, animated: true)
  }
  
  

}

//
//  BViewController.swift
//  dismissViewcotroller
//
//  Created by 성단빈 on 2020/04/27.
//  Copyright © 2020 seong. All rights reserved.
//

import UIKit

class BViewController: UIViewController {
  let aComebackBtn: UIButton = UIButton()
  let viewComeBackBtn: UIButton = UIButton()

  override func viewDidLoad() {
    super.viewDidLoad()

    aComebackBtnFn()
    viewComeBackBtnFn()
  }
  private func aComebackBtnFn() {
    aComebackBtn.setTitle("A", for: .normal)
    aComebackBtn.sizeToFit()
    aComebackBtn.center = CGPoint(x: view.center.x - 50, y: view.center.y)
    aComebackBtn.addTarget(self, action: #selector(aComebackTapBtn), for: .touchUpInside)
    view.addSubview(aComebackBtn)
  }
  
  private func viewComeBackBtnFn() {
    viewComeBackBtn.setTitle("첫화면", for: .normal)
    viewComeBackBtn.sizeToFit()
    viewComeBackBtn.center = CGPoint(x: view.center.x + 50, y: view.center.y)
    viewComeBackBtn.addTarget(self, action: #selector(viewComebackTapBtn), for: .touchUpInside)
    view.addSubview(viewComeBackBtn)
  }
  
  @objc private func aComebackTapBtn(_ sender: UIButton) {
    dismiss(animated: true)
  }

  @objc private func viewComebackTapBtn(_ sender: UIButton) {
    presentingViewController?.presentingViewController?.dismiss(animated: true)
  }
}

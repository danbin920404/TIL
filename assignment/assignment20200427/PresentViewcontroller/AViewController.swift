//
//  AViewController.swift
//  PresentViewcontroller
//
//  Created by 성단빈 on 2020/04/27.
//  Copyright © 2020 seong. All rights reserved.
//

import UIKit

class AViewController: UIViewController, UIAdaptivePresentationControllerDelegate {
  let aViewBtn: UIButton = UIButton(type: .system)
  let aLabel: UILabel = UILabel()

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .brown

    self.presentationController?.delegate = self
    
    aLabelFn()
    aViewBtnFn()
  }
  private func aLabelFn() {
    aLabel.frame.size = CGSize(width: 50, height: 50)
    aLabel.center = CGPoint(x: view.center.x, y: 100)
    aLabel.textAlignment = .center
    view.addSubview(aLabel)
  }
  
  private func aViewBtnFn() {
    aViewBtn.setTitle("Dismiss", for: .normal)
    aViewBtn.titleLabel?.font = UIFont.preferredFont(forTextStyle: .title2)
    aViewBtn.sizeToFit()
    aViewBtn.center = view.center
    aViewBtn.addTarget(self, action: #selector(aViewTapBtn), for: .touchUpInside)
    view.addSubview(aViewBtn)
  }
  
  func presentationControllerDidDismiss(_ presentationController: UIPresentationController) {
    if let vc = presentingViewController as? ViewController {
      vc.labelCount += 1
      vc.viewLabel.text = String(vc.labelCount)
    }
    print("1")
  }
  
  func presentationControllerWillDismiss(_ presentationController: UIPresentationController) {
    if let vc = presentingViewController as? ViewController {
      vc.labelCount += 1
      vc.viewLabel.text = String(vc.labelCount)
    }
  }
  
  @objc private func aViewTapBtn(_ sender: UIButton) {
    if let vc = presentingViewController as? ViewController {
      vc.labelCount += 1
      vc.viewLabel.text = String(vc.labelCount)
    }
    
    dismiss(animated: true)
  }

}

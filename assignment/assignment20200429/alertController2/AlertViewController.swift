//
//  alertViewController.swift
//  alertController2
//
//  Created by 성단빈 on 2020/04/29.
//  Copyright © 2020 seong. All rights reserved.
//

import UIKit

class AlertViewController: UIViewController {
  let labelView: UIView = UIView()
  let alertTextLabel: UILabel = UILabel()
  let textField: UITextField = UITextField()
  let cancelBtn: UIButton = UIButton()
  let printBtn: UIButton = UIButton()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    labelViewStyle()
    alertTextLabelStyle()
    textFieldStyle()
    cancelBtnStyle()
    printBtnStyle()
  }
  private func labelViewStyle() {
    labelView.frame.size = CGSize(width: 300, height: 300)
    labelView.center = CGPoint(x: view.center.x, y: 250)
    labelView.backgroundColor = .gray
    view.addSubview(labelView)
  }
  private func alertTextLabelStyle() {
    alertTextLabel.frame.size = CGSize(width: 150, height: 50)
    alertTextLabel.center = CGPoint(x: labelView.frame.width / 2, y: 50)
    alertTextLabel.text = "Test!"
    alertTextLabel.textAlignment = .center
    labelView.addSubview(alertTextLabel)
  }
  private func textFieldStyle() {
    textField.frame.size = CGSize(width: 200, height: 50)
    textField.center = CGPoint(x: labelView.frame.width / 2, y: 150)
    textField.borderStyle = .roundedRect
    textField.becomeFirstResponder()
    labelView.addSubview(textField)
  }
  private func cancelBtnStyle() {
    cancelBtn.setTitle("cancel", for: .normal)
    cancelBtn.setTitleColor(.red, for: .normal)
    cancelBtn.frame.size = CGSize(width: 150, height: 50)
    cancelBtn.center = CGPoint(x: labelView.frame.width / 2 - 75, y: 250)
    cancelBtn.addTarget(self, action: #selector(btnAction), for: .touchUpInside)
    labelView.addSubview(cancelBtn)
  }
  private func printBtnStyle() {
    printBtn.setTitle("print", for: .normal)
    printBtn.setTitleColor(.blue, for: .normal)
    printBtn.frame.size = CGSize(width: 150, height: 50)
    printBtn.center = CGPoint(x: labelView.frame.width / 2 + 75, y: 250)
    printBtn.addTarget(self, action: #selector(btnAction), for: .touchUpInside)
    labelView.addSubview(printBtn)
  }
  
  @objc private func btnAction(_ sender: UIButton) {
    switch sender {
    case cancelBtn:
      break
    default:
      guard let vc = presentingViewController as? ViewController else { return }
      vc.printLabel.text = textField.text
    }
    
    dismiss(animated: true)
  }
}

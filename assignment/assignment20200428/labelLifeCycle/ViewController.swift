//
//  ViewController.swift
//  labelLifeCycle
//
//  Created by 성단빈 on 2020/04/28.
//  Copyright © 2020 seong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  let label: UILabel = UILabel()
  let textField: UITextField = UITextField()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    labelStyle()
    textFieldStyle()
  }
  private func labelStyle() {
    label.frame.size = CGSize(width: 200, height: 50)
    label.center = CGPoint(x: view.center.x, y: 100)
    label.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
    label.textAlignment = .left
    view.addSubview(label)
  }
  
  private func textFieldStyle() {
    textField.frame.size = CGSize(width: 200, height: 50)
    textField.center = CGPoint(x: view.center.x, y: 200)
    textField.textAlignment = .natural
    textField.borderStyle = .roundedRect
    textField.placeholder = "적어주세요."
    textField.addTarget(self, action: #selector(textFieldEditingChanged), for: .editingChanged)
    textField.addTarget(self, action: #selector(textFieldEditingDidEnd), for: .editingDidEnd)
    textField.addTarget(self, action: #selector(textFieldDidEndOnExit), for: .editingDidEndOnExit)
    view.addSubview(textField)
  }
  @objc private func textFieldEditingChanged(_ sender: UITextField) {
    if sender.text?.count == 10 {
      textField.resignFirstResponder()
      self.label.text = ""
      self.textField.text = ""
      return
    }
    
    label.font = .systemFont(ofSize: 40)
    label.text = sender.text
    label.textColor = .blue
  }
  
  @objc private func textFieldEditingDidEnd(_ sender: UITextField) {
    label.textColor = .red
    label.font = .systemFont(ofSize: 20)
  }
  
  @objc private func textFieldDidEndOnExit(_ sender: UITextField) {
    
  }

}

//
//  ViewController.swift
//  SelfTextFieldDelegate
//
//  Created by 성단빈 on 2020/05/18.
//  Copyright © 2020 seong. All rights reserved.
//

import UIKit

protocol TextFieldDelegate: class {
  func textFieldForText(_ text: String?) -> ()
}

class ViewController: UIViewController {
  let textField: UITextField = UITextField()
  let button: UIButton = UIButton(type: .system)
  
  var delegate: TextFieldDelegate?
  var viewController: UIViewController?
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    viewSeting()
  }
  
  private func viewSeting() {
    textField.frame.size = CGSize(width: 200, height: 40)
    textField.center = CGPoint(x: view.center.x, y: view.center.y)
    textField.borderStyle = .roundedRect
    textField.resignFirstResponder()
    viewController = SecondViewController()
    
    view.addSubview(textField)
    
    button.setTitle("Present", for: .normal)
    button.frame.size = CGSize(width: 100, height: 30)
    button.center = CGPoint(x: view.center.x, y: view.center.y + 80)
    button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
    view.addSubview(button)
  }
  
  @objc private func buttonAction(_ sender: UIButton) {
    let secondVC = SecondViewController()
    secondVC.view.backgroundColor = .systemBackground
    secondVC.modalPresentationStyle = .fullScreen
    
    delegate = secondVC
    delegate?.textFieldForText(textField.text)
    present(secondVC, animated: true)
  }
}


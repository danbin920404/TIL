//
//  ViewController.swift
//  login
//
//  Created by 성단빈 on 2020/05/03.
//  Copyright © 2020 seong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  let idTextField: UITextField = UITextField()
  let passwordTextField: UITextField = UITextField()
  let loginBtn: UIButton = UIButton(type: .system)
  let titleLabel: UILabel = UILabel()
  let DATA: [String : String] = [
    "성다빈" : "123",
    "성단" : "1234",
    "성단빈" : "1234"
  ]

  override func viewDidLoad() {
    super.viewDidLoad()
    
    idTextFieldStyle()
    passwordTextFieldStyle()
    loginBtnStyle()
    titleLabelStyle()
  }
  private func idTextFieldStyle() {
    idTextField.frame.size = CGSize(width: 200, height: 30)
    idTextField.center = CGPoint(x: view.center.x, y: 50)
    idTextField.borderStyle = .roundedRect
    idTextField.textAlignment = .left
    idTextField.placeholder = "아이디를 입력해주세요."
    view.addSubview(idTextField)
  }
  
  private func passwordTextFieldStyle() {
    passwordTextField.frame.size = CGSize(width: 200, height: 30)
    passwordTextField.center = CGPoint(x: view.center.x, y: 120)
    passwordTextField.borderStyle = .roundedRect
    passwordTextField.textAlignment = .left
    passwordTextField.placeholder = "비밀번호를 입력해주세요."
    view.addSubview(passwordTextField)
  }
  
  private func loginBtnStyle() {
    loginBtn.setTitle("Login", for: .normal)
    loginBtn.frame.size = CGSize(width: 100, height: 30)
    loginBtn.center = CGPoint(x: view.center.x, y: 190)
    loginBtn.addTarget(self, action: #selector(loginBtnAction), for: .touchUpInside)
    view.addSubview(loginBtn)
  }
  
  private func titleLabelStyle() {
    titleLabel.frame.size = CGSize(width: 100, height: 50)
    titleLabel.center = CGPoint(x: view.center.x, y: 400)
    titleLabel.text = "산들김밥"
    titleLabel.textAlignment = .center
    titleLabel.textColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
    view.addSubview(titleLabel)
  }
  
  @objc private func loginBtnAction(_ sender: UIButton) {
    let alert = UIAlertController(title: "알림", message: "로그인에 성공하셨습니다.", preferredStyle: .alert)
    let alertWrong = UIAlertController(title: "알림", message: "ID,PassWord가 틀렸습니다.", preferredStyle: .alert)
    let cancelAction: UIAlertAction = UIAlertAction(title: "확인", style: .cancel) { _ in
      let nextVc: UIViewController = NextViewController()
      nextVc.view.backgroundColor = .systemBackground
      
      self.present(nextVc, animated: true)
    }
    
//    alertWrong.addAction(cancel)
    alert.addAction(cancelAction)
    
    if let idText = idTextField.text, let passwordText = passwordTextField.text {
      if checkIdAndPassword(id: idText, password: passwordText) {
        present(alert, animated: true)
      }
    } else {
      present(alertWrong, animated: true)
    }
  }
  
  private func checkIdAndPassword(id: String, password: String) -> Bool {
    for (key, value) in DATA {
      if key == id && value == password {
        return true
      }
    }
    return false
  }
  
  override func viewDidAppear(_ animated: Bool) {
    idTextField.becomeFirstResponder()
  }
}


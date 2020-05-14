//
//  ViewController.swift
//  LoginPage
//
//  Created by 성단빈 on 2020/05/14.
//  Copyright © 2020 seong. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
  
  struct Key {
    static var isLogin = "isLogin"
    static var userID = "userID"
    static var userPW = "userPW"
  }
  
  let hederImageView = UIImageView()
  let imagesArr = ["fastcampus_logo", "user", "password"]
  let hederUIView1 = UIView()
  let hederUIView2 = UIView()
  let hederUIView3 = UIView()
  
  let contentsIDImageView = UIImageView()
  let contentsPWImageView = UIImageView()
  
  let idTextField = UITextField()
  let pwTextField = UITextField()
  
  let loginButton = UIButton(type: .system)
  

  override func viewDidLoad() {
    super.viewDidLoad()
    
    viewSeting()
  }
  override func viewDidAppear(_ animated: Bool) {
    if UserDefaults.standard.bool(forKey: Key.isLogin) {
    //      if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
    //        let sceneDelegate = windowScene.delegate as? SceneDelegate
    //        sceneDelegate?.window?.rootViewController = LoginViewController()
    //      }
          let loginVC = LoginViewController()
          loginVC.modalPresentationStyle = .fullScreen
          
          present(loginVC, animated: true)
        }
  }
  private func viewSeting() {
    hederImageView.frame.size = CGSize(width: 200, height: 50)
    hederImageView.center = CGPoint(x: view.center.x, y: 100)
    hederImageView.image = UIImage(named: imagesArr[0])
    view.addSubview(hederImageView)
    
    hederUIView1.frame.size = CGSize(width: 20, height: 20)
    hederUIView1.center = CGPoint(x: view.center.x, y: 150)
    hederUIView1.backgroundColor = .systemRed
    hederUIView1.layer.cornerRadius = 5
    view.addSubview(hederUIView1)
    hederUIView2.frame.size = CGSize(width: 20, height: 20)
    hederUIView2.center = CGPoint(x: view.center.x - 35, y: 150)
    hederUIView2.backgroundColor = .systemRed
    hederUIView2.layer.cornerRadius = 5
    view.addSubview(hederUIView2)
    hederUIView3.frame.size = CGSize(width: 20, height: 20)
    hederUIView3.center = CGPoint(x: view.center.x + 35, y: 150)
    hederUIView3.backgroundColor = .systemRed
    hederUIView3.layer.cornerRadius = 5
    view.addSubview(hederUIView3)
    
    contentsIDImageView.frame = CGRect(x: 30, y: 450, width: 30, height: 30)
    contentsIDImageView.image = UIImage(named: imagesArr[1])
    view.addSubview(contentsIDImageView)
    
    idTextField.borderStyle = .none
    idTextField.frame = CGRect(x: 70, y: 450, width: 250, height: 30)
    idTextField.textAlignment = .natural
    idTextField.borderStyle = .roundedRect
    idTextField.keyboardType = .emailAddress
    idTextField.placeholder = "이메일을 입력하세요"
    view.addSubview(idTextField)
    
    contentsPWImageView.frame = CGRect(x: 30, y: 500, width: 30, height: 30)
    contentsPWImageView.image = UIImage(named: imagesArr[2])
    view.addSubview(contentsPWImageView)
    
    pwTextField.frame = CGRect(x: 70, y: 500, width: 250, height: 30)
    pwTextField.textAlignment = .natural
    pwTextField.isSecureTextEntry = true
    pwTextField.borderStyle = .roundedRect
    
    pwTextField.placeholder = "비밀번호를 입력하세요"
    view.addSubview(pwTextField)
    
    loginButton.frame.size = CGSize(width: 300, height: 40)
    loginButton.center = CGPoint(x: view.center.x, y: 600)
    loginButton.setTitle("Sing In", for: .normal)
    loginButton.setTitleColor(.white, for: .normal)
    loginButton.backgroundColor = .gray
    loginButton.layer.cornerRadius = 10
    loginButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
    view.addSubview(loginButton)
    
    idTextField.delegate = self
    pwTextField.delegate = self
    
    idTextField.autocapitalizationType = .none


  }
  private func present() {
    let loginVC = LoginViewController()
    loginVC.view.backgroundColor = .systemBackground
    
    present(loginVC, animated: true)
  }
  
  
  @objc private func buttonAction(_ sender: UIButton) {
    UITextField.animate(withDuration: 0.5) {
      self.idTextField.backgroundColor = .red
      self.idTextField.backgroundColor = .white
      
      self.pwTextField.backgroundColor = .red
      self.pwTextField.backgroundColor = .white
    }
    
    if let idText = idTextField.text, let pwText = pwTextField.text {
      if idText == "tjdeksqls@naver.com", pwText == "gha1zl1vk!" {
        UserDefaults.standard.set(idText, forKey: Key.userID)
        UserDefaults.standard.set(pwText, forKey: Key.userPW)
        UserDefaults.standard.set(true, forKey: Key.isLogin)
        
        present()
      } else {
        UITextField.animate(withDuration: 0.5) {
          self.idTextField.backgroundColor = .red
          self.idTextField.backgroundColor = .white
          
          self.pwTextField.backgroundColor = .red
          self.pwTextField.backgroundColor = .white
        }
      }
    }
  }
  
  func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    guard var textCount = textField.text?.count else { return true }
    textCount += 1
    if textField == pwTextField {
      if textCount >= 4 {
        return true
        if textCount <= 16 {
          return false
        }
      }
    }
    return textCount <= 20
  }
  
  func textFieldDidBeginEditing(_ textField: UITextField) {
    UITextField.animate(withDuration: 0.3) {
      self.idTextField.frame = CGRect(x: 70, y: 450 - 150, width: 250, height: 30)
      self.pwTextField.frame = CGRect(x: 70, y: 500 - 150, width: 250, height: 30)
      self.contentsIDImageView.frame = CGRect(x: 30, y: 450 - 150, width: 30, height: 30)
      self.contentsPWImageView.frame = CGRect(x: 30, y: 500 - 150, width: 30, height: 30)
      self.loginButton.center = CGPoint(x: self.view.center.x, y: 600 - 150)
    }
  }
  
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    idTextField.resignFirstResponder()
    pwTextField.resignFirstResponder()
    
    UITextField.animate(withDuration: 0.3) {
      self.idTextField.frame = CGRect(x: 70, y: 450, width: 250, height: 30)
      self.pwTextField.frame = CGRect(x: 70, y: 500, width: 250, height: 30)
      self.contentsIDImageView.frame = CGRect(x: 30, y: 450, width: 30, height: 30)
      self.contentsPWImageView.frame = CGRect(x: 30, y: 500, width: 30, height: 30)
      self.loginButton.center = CGPoint(x: self.view.center.x, y: 600)
    }
    
    if let idText = idTextField.text, let pwText = pwTextField.text {
      if idText == "tjdeksqls@naver.com", pwText == "gha1zl1vk!" {
        UserDefaults.standard.set(idText, forKey: Key.userID)
        UserDefaults.standard.set(pwText, forKey: Key.userPW)
        UserDefaults.standard.set(true, forKey: Key.isLogin)
        
        present()
      } else {
        UITextField.animate(withDuration: 0.5) {
          self.idTextField.backgroundColor = .red
          self.idTextField.backgroundColor = .white
          
          self.pwTextField.backgroundColor = .red
          self.pwTextField.backgroundColor = .white
        }
      }
    }
    
    return true
  }
}


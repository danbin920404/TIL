//
//  SignInView.swift
//  Chat
//
//  Created by 성단빈 on 2020/07/08.
//  Copyright © 2020 seong. All rights reserved.
//

import UIKit

protocol SignInViewDelegate: class {
  func signInButtonDidTap(email: String?, password: String?)
  func signUpButtonDidTap()
}

class SignInView: UIView {
  // MARK: - Properties
  weak var delegate: SignInViewDelegate?
  private let emailTextField = UITextField()
  private let pwTextField = UITextField()
  private let signInBtn = UIButton(type: .system)
  private let signUpBtn = UIButton(type: .system)
  
  private struct Standard {
    static let space: CGFloat = 8
    
  }
  
  // MARK: - View LifeCycle
  override init(frame: CGRect) {
    super.init(frame: frame)
    setUI()
    setConstraint()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - Layout
  private func setUI() {
    emailTextField.placeholder = "이메일을 입력해 주세요"
    emailTextField.keyboardType = .emailAddress
    
    pwTextField.placeholder = "비밀번호를 입력해 주세요"
    pwTextField.isSecureTextEntry = true
    
    [emailTextField, pwTextField].forEach {
      $0.font = .systemFont(ofSize: 30)
      $0.backgroundColor = UIColor.darkGray.withAlphaComponent(0.1)
    }
    
    signInBtn.setTitle("입장", for: .normal)
    signInBtn.backgroundColor = .black
    
    signUpBtn.setTitle("회원가입", for: .normal)
    signUpBtn.backgroundColor = .blue
    
    [signInBtn, signUpBtn].forEach {
      $0.setTitleColor(.white, for: .normal)
      $0.addTarget(self, action: #selector(buttonDidTap), for: .touchUpInside)
    }
  }
  
  private func setConstraint() {
    [emailTextField, pwTextField, signInBtn, signUpBtn].forEach {
      self.addSubview($0)
      $0.translatesAutoresizingMaskIntoConstraints = false
      
      switch $0 {
      case is UITextField:
        $0.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        $0.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        
      case is UIButton:
        $0.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        $0.widthAnchor.constraint(equalToConstant: 120).isActive = true
        $0.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
      default:
        break
      }
    }
    
    NSLayoutConstraint.activate([
      emailTextField.topAnchor.constraint(equalTo: self.topAnchor),
      
      pwTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: Standard.space),
      
      signInBtn.topAnchor.constraint(equalTo: pwTextField.bottomAnchor, constant: Standard.space),
      
      signUpBtn.topAnchor.constraint(equalTo: signInBtn.bottomAnchor, constant: Standard.space),
      signUpBtn.bottomAnchor.constraint(equalTo: self.bottomAnchor)
      
    ])
  }
  
  // MARK: - Action Handler
  @objc private func buttonDidTap(_ sender: UIButton) {
    sender == signInBtn ?
    delegate?.signInButtonDidTap(email: emailTextField.text, password: pwTextField.text) :
    delegate?.signUpButtonDidTap()
  }
}

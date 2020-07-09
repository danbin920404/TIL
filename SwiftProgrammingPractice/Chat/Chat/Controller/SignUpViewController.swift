//
//  SingUpViewController.swift
//  Chat
//
//  Created by 성단빈 on 2020/07/08.
//  Copyright © 2020 seong. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
  // MARK: - Properties
  private let pSign = SignProvider()
  
  private let vSignUP = SignUpView()
  
  // MARK: - View LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setUI()
    setConstraint()
  }
  
  // MARK: - Layout
  
  
  
  // MARK: - Action Handler
}

// MARK: - Extension UI
extension SignUpViewController {
  private func setUI() {
    view.backgroundColor = .systemBackground
    
    vSignUP.delegate = self
    view.addSubview(vSignUP)
  }
  
  private func setConstraint() {
    let guide = view.safeAreaLayoutGuide
    
    vSignUP.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      vSignUP.centerXAnchor.constraint(equalTo: guide.centerXAnchor),
      vSignUP.bottomAnchor.constraint(equalTo: guide.centerYAnchor),
      vSignUP.widthAnchor.constraint(equalTo: guide.widthAnchor, multiplier: 0.8)
    ])
  }
}


extension SignUpViewController: SignUpViewDelegate {
  func signUpButtonDidTap(email: String?, password: String?, nickName: String?) {
    guard let email = email, let password = password, let nickName = nickName else { return }
    
    pSign.signUp(email: email, password: password, nickName: nickName) { (result) in
      switch result {
      case .failure(let error):
        self.alertNormal(title: error.localizedDescription)
        
      case .success:
        self.dismiss(animated: true)
      }
    }
  }
}

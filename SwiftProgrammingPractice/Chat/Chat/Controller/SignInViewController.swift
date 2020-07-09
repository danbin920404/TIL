//
//  SingInViewController.swift
//  Chat
//
//  Created by 성단빈 on 2020/07/08.
//  Copyright © 2020 seong. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {
  // MARK: - Properties
  private let vSign = SignInView()
  
  // MARK: - View LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
    setupLayout()
  }
  
  // MARK: - Layout
  
  
  // MARK: - Action Handler
}

// MARK: - Extension UI

extension SignInViewController {
  private func setupUI() {
    view.backgroundColor = .white
    vSign.delegate = self
    view.addSubview(vSign)
  }
  
  private func setupLayout() {
    let guide = view.safeAreaLayoutGuide
    
    vSign.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      vSign.centerXAnchor.constraint(equalTo: guide.centerXAnchor),
      vSign.bottomAnchor.constraint(equalTo: guide.centerYAnchor),
      vSign.widthAnchor.constraint(equalTo: guide.widthAnchor, multiplier: 0.8)
    ])
  }
}

extension SignInViewController: SignInViewDelegate {
  func signInButtonDidTap(email: String?, password: String?) {
    guard let email = email, let password = password else { return }
    
    let pSign = SignProvider()
    
    pSign.signIn(email: email, password: password) { (result) in
      switch result {
      case .failure(let error):
        self.alertNormal(title: error.localizedDescription)
        
      case .success:
        WindowManager.set(.chat)
      }
    }
  }
  
  func signUpButtonDidTap() {
    let vcSignUp = SignUpViewController()
    vcSignUp.modalTransitionStyle = .flipHorizontal
    
    present(vcSignUp, animated: true)
  }
  
  
}

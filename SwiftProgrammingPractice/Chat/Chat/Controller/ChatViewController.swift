//
//  ChatViewController.swift
//  Chat
//
//  Created by 성단빈 on 2020/07/08.
//  Copyright © 2020 seong. All rights reserved.
//

import UIKit

class ChatViewController: UIViewController {
  private let pChat = ChatProvider()
  
  private let messageTableView = UITableView()
  private let messageTextField = UITextField()
  
  private var bottomConstraint: NSLayoutConstraint?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setUI()
    setConstraint()
    setNavigation()
    setKeyboardNotification()
    setNetwork()
  }
  
  private func setNetwork() {
    pChat.addListener { (result) in
      switch result {
      case .failure(let error):
        self.alertNormal(title: error.localizedDescription)
      case .success:
        self.messageTableView.reloadData()
        self.tableViewBottomScroll()
      }
    }
  }
  
  private func tableViewBottomScroll() {
    guard !pChat.messages.isEmpty else { return }
    messageTableView.scrollToRow(at: IndexPath(row: pChat.messages.count - 1, section: 0), at: .bottom, animated: true)
  }
  
}

// MARK: UI

extension ChatViewController {
  private func setNavigation() {
    navigationItem.title = "Chat"
    let signOutBarButton = UIBarButtonItem(title: "종료", style: .done, target: self, action: #selector(signOutBarButtonDidTap))
    navigationItem.leftBarButtonItem = signOutBarButton
  }
  
  @objc private func signOutBarButtonDidTap(_ sender: UIBarButtonItem) {
    let pSign = SignProvider()
    
    do {
      try pSign.signOut()
      
      pChat.removeListener()
      
      UserDefaults.standard.removeObject(forKey: UserRefereence.email)
      UserDefaults.standard.removeObject(forKey: UserRefereence.nickName)
      
      WindowManager.set(.sign)
    } catch {
      alertNormal(title: error.localizedDescription)
    }
  }
  
  private func setUI() {
    view.backgroundColor = .white
    
    messageTextField.backgroundColor = .red
    messageTextField.font = .systemFont(ofSize: 35)
    messageTextField.delegate = self
    
    messageTableView.keyboardDismissMode = .onDrag
    messageTableView.dataSource = self
  }
  
  private func setConstraint() {
    let guide = view.safeAreaLayoutGuide
    
    [messageTableView, messageTextField].forEach {
      view.addSubview($0)
      $0.translatesAutoresizingMaskIntoConstraints = false
      $0.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
      $0.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
    }
    
    NSLayoutConstraint.activate([
      messageTableView.topAnchor.constraint(equalTo: guide.topAnchor),
      messageTextField.topAnchor.constraint(equalTo: messageTableView.bottomAnchor)
    ])
    
    bottomConstraint = messageTextField.bottomAnchor.constraint(equalTo: guide.bottomAnchor)
    bottomConstraint?.isActive = true
  }
}

// MARK: Notification

extension ChatViewController {
  private func setKeyboardNotification() {
    NotificationCenter.default.addObserver(self, selector: #selector(keyBoardNotificationAction), name: UIResponder.keyboardWillShowNotification, object: nil)
    
    NotificationCenter.default.addObserver(self, selector: #selector(keyBoardNotificationAction), name: UIResponder.keyboardWillHideNotification, object: nil)
    
  }
  
  @objc private func keyBoardNotificationAction(_ notification: Notification) {
    guard
      let duration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double,
      let curve = notification.userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as? UInt,
      let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue
      else { return }
    let height = keyboardFrame.cgRectValue.height - view.safeAreaInsets.bottom
    
    UIView.animate(withDuration: duration, delay: 0, options: UIView.AnimationOptions(rawValue: curve), animations: {
      switch notification.name {
      case UIResponder.keyboardWillShowNotification:
        self.bottomConstraint?.constant = -height
        
      case UIResponder.keyboardWillHideNotification:
        self.bottomConstraint?.constant = 0
        
      default:
        break
      }
      self.view.layoutIfNeeded()
    })
    
    tableViewBottomScroll()
  }
}


// MARK: UITextFieldDelegate
extension ChatViewController: UITextFieldDelegate {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    guard let content = textField.text, !content.isEmpty else { return true }
    
    pChat.addMessage(content: content)
    textField.text = nil
    
    return true
  }
}


extension ChatViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return pChat.messages.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell") ?? UITableViewCell(style: .subtitle,
    reuseIdentifier: "cell")
    
    let message = pChat.messages[indexPath.row]
    cell.textLabel?.text = message.content
    cell.detailTextLabel?.text = message.nickName
    
    return cell
  }
  
  
}

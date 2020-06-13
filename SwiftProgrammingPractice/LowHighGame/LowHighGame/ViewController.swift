//
//  ViewController.swift
//  LowHighGame
//
//  Created by 성단빈 on 2020/06/12.
//  Copyright © 2020 seong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  enum Result: String {
    case correct = "번 만에 성공"
    case high = "High"
    case low = "Low"
  }
  
  let confirmLabel = UILabel()
  let textField = UITextField()
  let textFieldButton = UIButton()
  var randomNumber = (1...100).randomElement()!
  var count = 0
  var printText: String {
    get { return confirmLabel.text! }
    set {
      confirmLabel.text = newValue
    }
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupView()
  }
  
  private func setupView() {
    view.addSubview(confirmLabel)
    confirmLabel.text = "LowHigh"
    confirmLabel.clipsToBounds = true
    confirmLabel.textAlignment = .center
    confirmLabel.textColor = .black
    confirmLabel.translatesAutoresizingMaskIntoConstraints = false
    confirmLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100).isActive = true
    confirmLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    
    view.addSubview(textField)
    textField.delegate = self
    textField.borderStyle = .roundedRect
    textField.becomeFirstResponder()
    textField.placeholder = "1부터 100까지"
    textField.translatesAutoresizingMaskIntoConstraints = false
    textField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    textField.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    textField.widthAnchor.constraint(equalToConstant: 120).isActive = true
    
    view.addSubview(textFieldButton)
    textFieldButton.setTitle(" 버튼 ", for: .normal)
    textFieldButton.setTitleColor(.black, for: .normal)
    textFieldButton.backgroundColor = .gray
    textFieldButton.layer.cornerRadius = 5
    textFieldButton.addTarget(self, action: #selector(countingCheck), for: .touchUpInside)
    textFieldButton.translatesAutoresizingMaskIntoConstraints = false
    textFieldButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    textFieldButton.leadingAnchor.constraint(equalTo: textField.trailingAnchor, constant: 10).isActive = true
  }
  
  @objc private func countingCheck(_ sender: UIButton) {
    let userNum = Int(textField.text!) ?? 0
    print(userNum)
    if userNum == randomNumber {
      printText = "\(count)" + Result.correct.rawValue
      randomNumber = (1...100).randomElement()!
      count = 0
      return
    } else if userNum > randomNumber {
      printText = Result.low.rawValue
    } else if userNum < randomNumber {
      printText = Result.high.rawValue
    }
    
    count += 1
  }
}

extension ViewController: UITextFieldDelegate {
  func textFieldDidEndEditing(_ textField: UITextField) {
    guard let userNum = Int(textField.text!) else { return }
    
    if userNum == randomNumber {
      printText = "\(count)" + Result.correct.rawValue
      randomNumber = (1...100).randomElement()!
      count = 0
      return
    } else if userNum > randomNumber {
      printText = Result.low.rawValue
    } else if userNum < randomNumber {
      printText = Result.high.rawValue
    }
    
    count += 1
  }
  
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    guard let userNum = Int(textField.text!) else { return false }
    
    if userNum > 0, userNum < 101 {
      textField.resignFirstResponder()
      return true
    }
    
    return false
  }
}


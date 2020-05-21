//
//  ViewController.swift
//  CalculatorExample
//
//  Created by giftbot on 2019/12/19.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
  @IBOutlet weak var displayLabel: UILabel!
  var firstNum: String = "0"
  var secondNum: String = ""
  var result: Double = 0 {
    didSet {
      displayLabel.text = fomatter.string(from: result as NSNumber)
    }
  }
  let fomatter = NumberFormatter()
  var symbol: String?
  var isNumber = true
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    fomatter.numberStyle = .decimal
    fomatter.minimumFractionDigits = 0
    fomatter.maximumFractionDigits = 3
  }
  
  // MARK: - 키패드 버튼 클릭
  @IBAction func numberAction(_ sender: UIButton) {
    if symbol == nil {
      firstNum += String(sender.tag)
      result = Double(firstNum)!
    } else {
      isNumber = true
      secondNum += String(sender.tag)
      
      displayLabel.text = fomatter.string(from: Double(secondNum)! as NSNumber)
    }
  }
  
  // MARK: - 연산자 버튼 클릭
  @IBAction func symbolAction(_ sender: UIButton) {
    let identifier = sender.accessibilityIdentifier
    
    if secondNum == "" {
      symbol = identifier

      result = Double(firstNum)!
    } else {
      calculation(secondNum)
      
      symbol = identifier
      secondNum = "0"
      isNumber = false
    }
  }
  
  // MARK: - reset 버튼 클릭
  @IBAction func resetAction(_ sender: UIButton) {
    firstNum = "0"
    secondNum = ""
    result = 0
    displayLabel.text = "0"
    symbol = nil
    isNumber = true
  }
  
  // MARK: - = 버튼 클릭
  @IBAction func equalsAction(_ sender: UIButton) {
    if symbol == nil, secondNum == "" {
      
      firstNum = "0"
    } else {
      if secondNum == "" {
        calculation(firstNum)
        
        firstNum = "0"
      } else {
        calculation(secondNum)
        
        secondNum = "0"
      }
      
      isNumber = false
    }
  }
  
  // MARK: - 계산 함수
  private func calculation(_ numStr: String) {
    if symbol == "+" {
      result += Double(numStr)!
    } else if symbol == "-" {
      result -= Double(numStr)!
    } else if symbol == "*", isNumber {
      result *= Double(numStr)!
    } else if symbol == "/", isNumber {
      result /= Double(numStr)!
    }
  }
}

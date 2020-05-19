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
  var firstNum: String = ""
  var secondNum: String = ""
  var result: Double = 0
  let fomatter = NumberFormatter()
  var symbol: String?
  
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
      
      displayLabel.text = fomatter.string(from: Double(firstNum)! as NSNumber)
    } else {
      secondNum += String(sender.tag)
      
      displayLabel.text = fomatter.string(from: Double(secondNum)! as NSNumber)
    }
  }
  
  // MARK: - 연산자 버튼 클릭
  @IBAction func symbolAction(_ sender: UIButton) {
    let identifier = sender.accessibilityIdentifier
    symbol = identifier
    
    if secondNum == "" {
      if identifier == "+" {
        result = Double(firstNum)!
      } else if identifier == "-" {
        result = Double(firstNum)!
      } else if identifier == "*" {
        result = Double(firstNum)!
      } else if identifier == "/" {
        result = Double(firstNum)!
      }
    } else {
      if identifier == "+" {
        result += Double(secondNum)!
      } else if identifier == "-" {
        result -= Double(secondNum)!
      } else if identifier == "*" {
        result *= Double(secondNum)!
      } else if identifier == "/" {
        result /= Double(secondNum)!
      }
      
      displayLabel.text = fomatter.string(from: result as NSNumber)
      secondNum = "0"
    }
  }
  
  // MARK: - reset 버튼 클릭
  @IBAction func resetAction(_ sender: UIButton) {
    firstNum = ""
    secondNum = ""
    result = 0
    displayLabel.text = "0"
    symbol = nil
  }
  
  // MARK: - = 버튼 클릭
  @IBAction func equalsAction(_ sender: UIButton) {
    if secondNum == "" {
      if symbol == "+" {
        result += Double(firstNum)!
      } else if symbol == "-" {
        result -= Double(firstNum)!
      } else if symbol == "*", firstNum != "0" {
        result *= Double(firstNum)!
      } else if symbol == "/", firstNum != "0" {
        result /= Double(firstNum)!
      }
      
      firstNum = "0"
    } else {
      if symbol == "+" {
        result += Double(secondNum)!
      } else if symbol == "-" {
        result -= Double(secondNum)!
      } else if symbol == "*" {
        result *= Double(secondNum)!
      } else if symbol == "/" {
        result /= Double(secondNum)!
      }
      
      secondNum = "0"
    }
    displayLabel.text = fomatter.string(from: result as NSNumber)
  }
}

//
//  ViewController.swift
//  ButtonsAnimation
//
//  Created by 성단빈 on 2020/06/04.
//  Copyright © 2020 seong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  let button1 = UIButton()
  let button2 = UIButton(type: .system)
  let button3 = UIButton(type: .system)
  let button4 = UIButton(type: .system)
  let button5 = UIButton(type: .system)
  let buttonColors: [UIColor] = [.black, .blue, .brown, .darkGray, .magenta, .orange, .red, .systemPink]
  var isUpDoun = true
  

  override func viewDidLoad() {
    super.viewDidLoad()
    setupButton()
    
  }
  private func setupButton() {
    view.addSubview(button2)
    button2.frame = CGRect(x: 20, y: self.button2.superview!.bounds.maxY - 100, width: 50, height: 50)
    button2.setTitle("btn2", for: .normal)
    button2.setTitleColor(.white, for: .normal)
    button2.backgroundColor = .brown
    button2.clipsToBounds = true
    button2.layer.cornerRadius = 50 / 2
    view.addSubview(button3)
    button3.frame = CGRect(x: 20, y: self.button3.superview!.bounds.maxY - 100, width: 50, height: 50)
    button3.setTitle("btn3", for: .normal)
    button3.setTitleColor(.white, for: .normal)
    button3.backgroundColor = .brown
    button3.clipsToBounds = true
    button3.layer.cornerRadius = 50 / 2
    view.addSubview(button4)
    button4.frame = CGRect(x: 20, y: self.button4.superview!.bounds.maxY - 100, width: 50, height: 50)
    button4.setTitle("btn4", for: .normal)
    button4.setTitleColor(.white, for: .normal)
    button4.backgroundColor = .brown
    button4.clipsToBounds = true
    button4.layer.cornerRadius = 50 / 2
    view.addSubview(button5)
    button5.frame = CGRect(x: 20, y: self.button5.superview!.bounds.maxY - 100, width: 50, height: 50)
    button5.setTitle("btn5", for: .normal)
    button5.setTitleColor(.white, for: .normal)
    button5.backgroundColor = .brown
    button5.clipsToBounds = true
    button5.layer.cornerRadius = 50 / 2
    view.addSubview(button1)
    button1.frame = CGRect(x: 20, y: self.button1.superview!.bounds.maxY - 100, width: 50, height: 50)
    button1.setTitle("btn1", for: .normal)
    button1.setTitleColor(.white, for: .normal)
    button1.backgroundColor = .brown
    button1.clipsToBounds = true
    button1.layer.cornerRadius = 50 / 2
    button1.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
  }
  @objc private func buttonAction(_ sender: UIButton) {
    let YOrigin2 = button2.superview!.bounds.maxY - 80
    let YOrigin3 = button3.superview!.bounds.maxY - 80
    let YOrigin4 = button4.superview!.bounds.maxY - 80
    let YOrigin5 = button5.superview!.bounds.maxY - 80
    if isUpDoun {
      UIView.animateKeyframes(withDuration: 2, delay: 0, animations: {
        UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.25) {
          
          self.button2.backgroundColor = self.buttonColors.randomElement()
          self.button3.backgroundColor = self.buttonColors.randomElement()
          self.button4.backgroundColor = self.buttonColors.randomElement()
          self.button5.backgroundColor = self.buttonColors.randomElement()
          
          self.button2.transform = .init(scaleX: 0.1, y: 0.1)
          self.button3.transform = .init(scaleX: 0.1, y: 0.1)
          self.button4.transform = .init(scaleX: 0.1, y: 0.1)
          self.button5.transform = .init(scaleX: 0.1, y: 0.1)
          self.button2.center.y -= 100
          self.button3.center.y -= 200
          self.button4.center.y -= 300
          self.button5.center.y -= 400
          self.button2.transform = .init(scaleX: 1, y: 1)
          self.button3.transform = .init(scaleX: 1, y: 1)
          self.button4.transform = .init(scaleX: 1, y: 1)
          self.button5.transform = .init(scaleX: 1, y: 1)
        }

      })
    } else {
      UIView.animateKeyframes(withDuration: 2, delay: 0, animations: {
        UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.25) {
          
          self.button2.backgroundColor = self.buttonColors.randomElement()
          self.button3.backgroundColor = self.buttonColors.randomElement()
          self.button4.backgroundColor = self.buttonColors.randomElement()
          self.button5.backgroundColor = self.buttonColors.randomElement()
          
          self.button2.center.y = YOrigin2
          self.button3.center.y = YOrigin3
          self.button4.center.y = YOrigin4
          self.button5.center.y = YOrigin5
        }
        UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.25) {
          self.button2.transform = .init(scaleX: 0.1, y: 0.1)
          self.button3.transform = .init(scaleX: 0.1, y: 0.1)
          self.button4.transform = .init(scaleX: 0.1, y: 0.1)
          self.button5.transform = .init(scaleX: 0.1, y: 0.1)
        }
      })
//      self.button2.transform = .init(scaleX: 0.1, y: 0.1)
//      self.button3.transform = .init(scaleX: 0.1, y: 0.1)
//      self.button4.transform = .init(scaleX: 0.1, y: 0.1)
//      self.button5.transform = .init(scaleX: 0.1, y: 0.1)
//
//      self.button2.center.y = YOrigin2
//      self.button3.center.y = YOrigin3
//      self.button4.center.y = YOrigin4
//      self.button5.center.y = YOrigin5
    }
    
    isUpDoun = !isUpDoun
  }
}


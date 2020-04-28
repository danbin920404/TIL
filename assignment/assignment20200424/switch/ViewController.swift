//
//  ViewController.swift
//  switch
//
//  Created by 성단빈 on 2020/04/27.
//  Copyright © 2020 seong. All rights reserved.
//

import UIKit

//[ 과제 - 앱 구현 ]
//1. UISwitch, UISegmentedControl 을 이용한 문제
//- UISwitch : On, Off 가 바뀔 때마다 Label 의 내용이 On, Off 로 표시되도록 구현
//- UISegmentedControl : 선택 내용이 바뀔 때마다 Label 의 내용도 해당 타이틀 값으로 함께 변경되도록 구현
//참고로, 위 2개는 버튼과 달리 event 처리를 touchUpInside 가 아니라 valueChanged 라는 것을 활용해야 함

class ViewController: UIViewController {
  let switchView = UISwitch()
  let viewLabel: UILabel = UILabel()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)

    siwtchFn()
    labelFn()
  }
  private func siwtchFn() {
    switchView.frame.size = CGSize(width: 100, height: 100)
    switchView.center = CGPoint(x: view.center.x, y: 300)
    switchView.addTarget(self, action: #selector(switchChange), for: .valueChanged)
    view.addSubview(switchView)
  }

  private func labelFn() {
    viewLabel.frame.size = CGSize(width: 100, height: 50)
    viewLabel.center = CGPoint(x: view.center.x, y: 200)
    viewLabel.text = "OFF"
    viewLabel.textAlignment = .center
    viewLabel.backgroundColor = #colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1)
    view.addSubview(viewLabel)
  }
  
  @objc private func switchChange(_ sender: UISwitch) {
    if sender.isOn {
      viewLabel.text = "ON"
      viewLabel.backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
      view.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
    } else {
      viewLabel.text = "OFF"
      viewLabel.backgroundColor = #colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1)
      view.backgroundColor = #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)
    }
  }
}


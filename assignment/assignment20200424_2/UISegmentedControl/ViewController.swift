//
//  ViewController.swift
//  UISegmentedControl
//
//  Created by 성단빈 on 2020/04/28.
//  Copyright © 2020 seong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  let label: UILabel = UILabel()
  let segmented: UISegmentedControl = UISegmentedControl(items: ["성단빈", "이진욱", "윤병일"])

  override func viewDidLoad() {
    super.viewDidLoad()
    
    labelStyle()
    segmentedFn()
  }
  private func segmentedFn() {
    segmented.frame.size = CGSize(width: 200, height: 50)
    segmented.center = CGPoint(x: view.center.x, y: 300)
    segmented.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
    segmented.addTarget(self, action: #selector(change), for: .valueChanged)
    view.addSubview(segmented)
  }
  private func labelStyle() {
    label.frame.size = CGSize(width: 100, height: 50)
    label.center = CGPoint(x: view.center.x, y: 100)
    label.textAlignment = .center
    view.addSubview(label)
  }
  
  @objc private func change(_ : UISegmentedControl) {
    var text: String = ""
//    segmented.value
    switch segmented.selectedSegmentIndex {
    case 0:
      text = "성단빈"
    case 1:
      text = "이진욱"
    case 2:
      text = "윤병일"
    default:
      return
    }
    
    label.text = text
  }
  
}


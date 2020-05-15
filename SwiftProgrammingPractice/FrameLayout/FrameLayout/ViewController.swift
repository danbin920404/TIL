//
//  ViewController.swift
//  FrameLayout
//
//  Created by 성단빈 on 2020/05/15.
//  Copyright © 2020 seong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  let redView = UIView()
  let blueView = UIView()
  var isChange = true
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    firstSeting()
  }
  private func firstSeting() {
//    redView.frame = CGRect(x: 20, y: 64, width: 162.5, height: 698)
    redView.backgroundColor = .red
    view.addSubview(redView)
    
//    blueView.frame = CGRect(x: 192.5, y: 64, width: 162.5, height: 698)
    blueView.backgroundColor = .blue
    view.addSubview(blueView)
  }
  
  override func viewSafeAreaInsetsDidChange() {
    if isChange {
      redView.frame = CGRect(x: 20, y: 64, width: 162.5, height: 698)

      blueView.frame = CGRect(x: 192.5, y: 64, width: 162.5, height: 698)
      isChange = false
    } else {
      redView.frame = CGRect(x: 64, y: 20, width: 342, height: 335)

      blueView.frame = CGRect(x: 416, y: 20, width: 342, height: 335)

      isChange = true
    }
    print(isChange)
  }
  
  override func viewWillLayoutSubviews() {
//    let margin: CGFloat = 20
//    let padding: CGFloat = 10
//    let safeLayoutInsets = view.safeAreaInsets
//    let horizontalInset = safeLayoutInsets.left + safeLayoutInsets.right
//
//    let yOffset = safeLayoutInsets.top + margin
//    let viewWidth = (view.frame.width - padding - horizontalInset) / 2 - margin
//
//    redView.frame = CGRect(
//      x: safeLayoutInsets.left + margin,
//      y: yOffset,
//      width: viewWidth,
//      height: view.bounds.height - yOffset - (safeLayoutInsets.bottom + margin)
//    )
//
//    blueView.frame = CGRect(
//      origin: CGPoint(x: redView.frame.maxX + padding, y: yOffset),
//      size: redView.bounds.size
//    )
//
//    print("width",view.frame.width)
//    print("height",view.frame.height)
    
  }
}


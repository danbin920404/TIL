//
//  ViewController.swift
//  PresentViewcontroller
//
//  Created by 성단빈 on 2020/04/27.
//  Copyright © 2020 seong. All rights reserved.
//

import UIKit

//[ 과제 ]
//1. ViewController 데이터 전달
//  > AViewController 와 BViewController 를 만든 뒤, 각각 하나씩의 Label 생성
//  > A에서 B로 화면을 넘어갈 때는 B의 Label 값이 이전 값에서 +3 증가
//  > B에서 A로 화면을 넘어갈 때는 A의 Label 값이 이전 값에서 +1 증가
//    e.g. A에서 B로 갈 때 3, B에서 다시 A로 넘어올 때 4, 다시 A에서 B로 가면 7, 다시 A로 오면 8
//
//[ 도전 과제 ]
//1, 카드 스타일에서 제스처로 내릴 때는 UIAdaptivePresentationControllerDelegate 프로토콜을 사용한 별도의 작업 필요. 관련 내용을 검색해보고 presentationControllerDidDismiss 메서드를 이용해서 구현해보기

class ViewController: UIViewController {
  let btn: UIButton = UIButton(type: .system)
  let viewLabel: UILabel = UILabel()
  var labelCount: Int = 0
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .red
    
    viewLabelFn()
    btnFn()
  }
  private func viewLabelFn() {
    viewLabel.text = String(labelCount)
    viewLabel.frame.size = CGSize(width: 50, height: 50)
    viewLabel.center = CGPoint(x: view.center.x, y: 100)
    viewLabel.textAlignment = .center
    view.addSubview(viewLabel)
  }
  
  private func btnFn() {
    btn.setTitle("버튼", for: .normal)
    btn.titleLabel?.font = UIFont.preferredFont(forTextStyle: .title2)
    btn.sizeToFit()
    btn.center = view.center
    btn.addTarget(self, action: #selector(viewTapBtn(_:)), for: .touchUpInside)
    view.addSubview(btn)
  }
  
  @objc private func viewTapBtn(_ sender: UIButton) {
    let aView = AViewController()
    labelCount += 3
    aView.aLabel.text = String(labelCount)
    
    present(aView, animated: true)
  }
}


//
//  ViewController.swift
//  StopWatch
//
//  Created by 성단빈 on 2020/05/05.
//  Copyright © 2020 seong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  @IBOutlet weak var labelMinute: UILabel!
  @IBOutlet weak var labalSecond: UILabel!
  @IBOutlet weak var labelMillisecond: UILabel!
  @IBOutlet weak var startStopButton: UIButton!
  @IBOutlet weak var resetButton: UIButton!
  
  var isStarting: Bool = false
  var timer = Timer()
  
  var startTime: Double = 0.0
  var elapsed: Double = 0.0
  
  @IBAction func startStopAction(_ sender: Any) {
    if isStarting {
      startStopButton.setTitle("Start", for: .normal)
      
      timer.invalidate()
    } else {
      startTime = Date().timeIntervalSince1970 - elapsed
      
      startStopButton.setTitle("Stop", for: .normal)
  
      timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    }
    
    isStarting = !isStarting
  }
  @IBAction func resetAction(_ sender: Any) {
    elapsed = 0.0
    startTime = Date().timeIntervalSince1970 - elapsed
    
    labelMillisecond.text = "00"
    labalSecond.text = "00"
    labelMinute.text = "00"
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
   
    startStopButton.setTitle("Start", for: .normal)
    resetButton.setTitle("Reset", for: .normal)
  }
  
  @objc func updateCounter(_ sender: UIButton) {
    let date = Date(timeIntervalSince1970: elapsed)
    let df = DateFormatter()
    
    elapsed = Date().timeIntervalSince1970 - startTime
    
    df.dateFormat = "SS"
    labelMillisecond.text = df.string(from: date)
    df.dateFormat = "ss"
    labalSecond.text = df.string(from: date)
    df.dateFormat = "mm"
    labelMinute.text = df.string(from: date)
  }
}


//
//  ViewController.swift
//  YouTubePlayerExample
//
//  Created by 성단빈 on 2020/06/07.
//  Copyright © 2020 seong. All rights reserved.
//
import youtube_ios_player_helper
import UIKit

class ViewController: UIViewController {
  var playerView = YTPlayerView()

  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupPlayerView()
  }
  private func setupPlayerView() {
    view.addSubview(playerView)
    playerView.translatesAutoresizingMaskIntoConstraints = false
    playerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
    playerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    playerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    playerView.heightAnchor.constraint(equalToConstant: 300).isActive = true
    playerView.backgroundColor = .black
    
    playerView.delegate = self
    playerView.load(withVideoId: "xqFvYsy4wE4", playerVars: ["playsinline": 1])
  }

}

extension ViewController: YTPlayerViewDelegate {
  func playerViewDidBecomeReady(_ playerView: YTPlayerView) {
    playerView.playVideo()
  }
}


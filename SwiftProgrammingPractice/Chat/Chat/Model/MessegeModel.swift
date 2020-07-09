//
//  MassegeModel.swift
//  Chat
//
//  Created by 성단빈 on 2020/07/08.
//  Copyright © 2020 seong. All rights reserved.
//

import Foundation

struct MessageModel {
  let nickName: String
  let content: String
  let date: Date
}

struct MessageReference {
  static let nickName = "NickName"
  static let content = "Content"
  static let date = "Date"
}

//
//  PickMenuDATA.swift
//  Dominos11_Starter
//
//  Created by 성단빈 on 2020/06/17.
//  Copyright © 2020 Kira. All rights reserved.
//

import Foundation

final class Singleton {
  static let shared = Singleton()
  private init() {}
  
  var wishListDict: [String: Int] = [:]
}

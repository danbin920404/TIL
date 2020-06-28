//
//  PickMenuDATA.swift
//  Dominos11_Starter
//
//  Created by 성단빈 on 2020/06/17.
//  Copyright © 2020 Kira. All rights reserved.
//

import Foundation

struct PickMenu {
  let name: String
  let informations: [Information]
  
}

struct Information {
  let count: Int
  let total: Int
}

class Singleton {
  static let shared = Singleton()
  private init() {}
  
  var data = [PickMenu]()
}

let singleton = Singleton.shared

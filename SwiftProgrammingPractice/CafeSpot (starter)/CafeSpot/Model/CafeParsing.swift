//
//  CafeList.swift
//  CafeSpot
//
//  Created by 성단빈 on 2020/07/10.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import Foundation

class CafeParsing {
  static let shared = CafeParsing()
  private init() {}
  
  var dataList: [CafeData]? { parsing(data: data!) }
  
  let filePath = Bundle.main.path(forResource: "CafeList", ofType: "json")
  lazy var content = try! String(contentsOfFile: filePath!)
  lazy var data = content.data(using: .utf8)
  
  func parsing(data: Data) -> [CafeData]? {
    do {
      let astronauts = try JSONDecoder().decode([CafeData].self, from: data)
      astronauts.forEach { print($0.title) }
      return astronauts
      
    } catch {
      print(error.localizedDescription)
    }
    return nil
  }
}








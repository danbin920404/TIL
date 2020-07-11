//
//  CafaList.swift
//  CafeSpot
//
//  Created by 성단빈 on 2020/07/10.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import Foundation

struct CafeData: Decodable {
  let title: String
  let description: String
  let location: Location
  let isFavorite: Bool
  
  enum CodingKeys: String, CodingKey {
    case title
    case description
    case location
    case isFavorite
  }
  
  struct Location: Decodable {
    let address: String
    let lat: Double
    let lng: Double
    
    enum LocationKeys: String, CodingKey {
      case address
      case lat
      case lng
    }
    
    init(from decoder: Decoder) throws {
      let keyedContainer = try decoder.container(keyedBy: LocationKeys.self)
      address = try keyedContainer.decode(String.self, forKey: .address)
      lat = try keyedContainer.decode(Double.self, forKey: .lat)
      lng = try keyedContainer.decode(Double.self, forKey: .lng)
    }
  }
  
  init(from decoder: Decoder) throws {
    let keyedContainer = try decoder.container(keyedBy: CodingKeys.self)
    title = try keyedContainer.decode(String.self, forKey: .title)
    description = try keyedContainer.decode(String.self, forKey: .description)
    isFavorite = try keyedContainer.decode(Bool.self, forKey: .isFavorite)
    location = try keyedContainer.decode(Location.self, forKey: .location)
  }
}

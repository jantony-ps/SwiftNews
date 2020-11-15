//
//  Children.swift
//  SwiftNews
//
//  Created by Jinto Antony on 2020-11-12.
//  Copyright © 2020 JA. All rights reserved.
//

struct Children: Decodable {
    let kind: String
      /// Define a key as optional if it can be returned as `nil` or if it does not always exist in the JSON.
    var data: NewsFeed?
    enum CodingKeys: String, CodingKey {
      case kind = "kind"
      case data = "data"
    }
    
}

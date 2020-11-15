//
//  MediaModel.swift
//  SwiftNews
//
//  Created by Jinto Antony on 2020-11-13.
//  Copyright © 2020 JA. All rights reserved.
//

struct MediaModel: Decodable {
    var fallback_url: String?
      /// Define a key as optional if it can be returned as `nil` or if it does not always exist in the JSON.
    var height: Int?
    var width: Int?
    enum CodingKeys: String, CodingKey {
      case fallback_url = "fallback_url"
      case height = "height"
      case width = "width"
    }
    
}

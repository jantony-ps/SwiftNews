//
//  Info.swift
//  SwiftNews
//
//  Created by Jinto Antony on 2020-11-12.
//  Copyright © 2020 JA. All rights reserved.
//

struct Info: Decodable {
    /// Define a key as optional if it can be returned as `nil` or if it does not always exist in the JSON.
    let modhash: String?
    let dist: Int
    let children:[Children]?
    let after:String?
    let before:String?
    enum CodingKeys: String, CodingKey {
        case modhash = "modhash"
        case dist = "dist"
        case children = "children"
        case after = "after"
        case before = "before"
    }

    
}

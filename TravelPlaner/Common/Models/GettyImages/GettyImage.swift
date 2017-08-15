//
//  GettyImage.swift
//  TravelPlaner
//
//  Created by Nikola Simunko on 15/08/2017.
//  Copyright © 2017 Nikola Simunko. All rights reserved.
//

import Unbox

struct GettyImage {
    let ID: String
    let artist: String
    let caption: String?
    let title: String
    let maxWidth: Int
    let maxHeight: Int
}

extension GettyImage: Unboxable {
    init(unboxer: Unboxer) throws {
        ID = try unboxer.unbox(key: "id")
        artist = try unboxer.unbox(key: "artist")
        caption = unboxer.unbox(key: "caption")
        title = try unboxer.unbox(key: "title")
        maxWidth = try unboxer.unbox(key: "max_dimensions.width")
        maxHeight = try unboxer.unbox(key: "max_dimensions_height")
    }
}

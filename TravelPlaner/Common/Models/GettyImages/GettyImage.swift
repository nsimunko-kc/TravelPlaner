//
//  GettyImage.swift
//  TravelPlaner
//
//  Created by Nikola Simunko on 15/08/2017.
//  Copyright © 2017 Nikola Simunko. All rights reserved.
//

import Unbox

struct GettyImageDisplaySize {
    let name: String
    let url: String
}

extension GettyImageDisplaySize: Unboxable {
    init(unboxer: Unboxer) throws {
        name = try unboxer.unbox(key: "name")
        url = try unboxer.unbox(key: "uri")
    }
}

struct GettyImage {
    let ID: String
    let artist: String?
    let caption: String?
    let title: String
    let maxWidth: Int
    let maxHeight: Int
    let displaySizes: [GettyImageDisplaySize]
}

extension GettyImage: Unboxable {
    init(unboxer: Unboxer) throws {
        ID = try unboxer.unbox(key: "id")
        artist = unboxer.unbox(key: "artist")
        caption = unboxer.unbox(key: "caption")
        title = try unboxer.unbox(key: "title")
        maxWidth = try unboxer.unbox(keyPath: "max_dimensions.width")
        maxHeight = try unboxer.unbox(keyPath: "max_dimensions.height")
        displaySizes = try unboxer.unbox(key: "display_sizes")
    }
}

//
//  GettyImagesGalleryResponse.swift
//  TravelPlaner
//
//  Created by Nikola Simunko on 25/08/2017.
//  Copyright © 2017 Nikola Simunko. All rights reserved.
//

import Unbox

struct GettyImagesGalleryResponse {
    let resultCount: Int
    let images: [GettyImage]
}

extension GettyImagesGalleryResponse: Unboxable {
    init(unboxer: Unboxer) throws {
        resultCount = try unboxer.unbox(key: "result_count")
        images = try unboxer.unbox(key: "images")
    }
}

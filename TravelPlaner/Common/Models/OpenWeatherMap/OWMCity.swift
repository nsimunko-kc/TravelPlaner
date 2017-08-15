//
//  OWMCity.swift
//  TravelPlaner
//
//  Created by Nikola Simunko on 15/08/2017.
//  Copyright © 2017 Nikola Simunko. All rights reserved.
//

import Unbox

struct OWMCity {
    let ID: String
    let name: String
    let country: String
    let latitude: Double
    let longitude: Double
}

extension OWMCity: Unboxable {
    init(unboxer: Unboxer) throws {
        ID = try unboxer.unbox(key: "id")
        name = try unboxer.unbox(key: "name")
        country = try unboxer.unbox(key: "country")
        latitude = try unboxer.unbox(key: "coord.lat")
        longitude = try unboxer.unbox(key: "coord.lon")
    }
}

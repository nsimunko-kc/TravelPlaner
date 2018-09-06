//
//  OWMWeather.swift
//  TravelPlaner
//
//  Created by Nikola Simunko on 15/08/2017.
//  Copyright © 2017 Nikola Simunko. All rights reserved.
//

import Unbox

struct OWMWeather {
    let ID: Int
    let main: String
    let description: String
    let icon: String
}

extension OWMWeather: Unboxable {
    init(unboxer: Unboxer) throws {
        ID = try unboxer.unbox(key: "id")
        main = try unboxer.unbox(key: "main")
        description = try unboxer.unbox(key: "description")
        icon = try unboxer.unbox(key: "icon")
    }
}

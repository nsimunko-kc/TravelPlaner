//
//  OWMTemp.swift
//  TravelPlaner
//
//  Created by Nikola Simunko on 25/08/2017.
//  Copyright © 2017 Nikola Simunko. All rights reserved.
//

import Unbox

struct OWMTemp {
    let day: Double
    let min: Double
    let max: Double
    let night: Double
    let evening: Double
    let morning: Double
}

extension OWMTemp: Unboxable {
    init(unboxer: Unboxer) throws {
        day = try unboxer.unbox(key: "day")
        min = try unboxer.unbox(key: "min")
        max = try unboxer.unbox(key: "max")
        night = try unboxer.unbox(key: "night")
        evening = try unboxer.unbox(key: "eve")
        morning = try unboxer.unbox(key: "morn")
    }
}

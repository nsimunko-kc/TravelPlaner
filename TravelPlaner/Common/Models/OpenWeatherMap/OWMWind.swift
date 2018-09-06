//
//  OWMWind.swift
//  TravelPlaner
//
//  Created by Nikola Simunko on 15/08/2017.
//  Copyright © 2017 Nikola Simunko. All rights reserved.
//

import Unbox

struct OWMWind {
    let speed: Double
    let degrees: Double
}

extension OWMWind: Unboxable {
    init(unboxer: Unboxer) throws {
        speed = try unboxer.unbox(key: "speed")
        degrees = try unboxer.unbox(key: "deg")
    }
}

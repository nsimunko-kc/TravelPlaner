//
//  OWMMain.swift
//  TravelPlaner
//
//  Created by Nikola Simunko on 15/08/2017.
//  Copyright © 2017 Nikola Simunko. All rights reserved.
//

import Unbox

struct OWMMain {
    let temp: Double
    let pressure: Double
    let humidity: Double
    let tempMin: Double
    let tempMax: Double
    let seaLevel: Double
    let groundLevel: Double
}

extension OWMMain: Unboxable {
    init(unboxer: Unboxer) throws {
        temp = try unboxer.unbox(key: "temp")
        pressure = try unboxer.unbox(key: "pressure")
        humidity = try unboxer.unbox(key: "humidity")
        tempMin = try unboxer.unbox(key: "temp_min")
        tempMax = try unboxer.unbox(key: "temp_max")
        seaLevel = try unboxer.unbox(key: "sea_level")
        groundLevel = try unboxer.unbox(key: "grnd_level")
    }
}

//
//  OWMListObject.swift
//  TravelPlaner
//
//  Created by Nikola Simunko on 25/08/2017.
//  Copyright © 2017 Nikola Simunko. All rights reserved.
//

import Unbox

struct OWMListObject {
    let main: OWMMain
    let weather: OWMWeather
    let wind: OWMWind
}

extension OWMListObject: Unboxable {
    init(unboxer: Unboxer) throws {
        main = try unboxer.unbox(key: "main")
        weather = try unboxer.unbox(key: "weather")
        wind = try unboxer.unbox(key: "wind")
    }
}

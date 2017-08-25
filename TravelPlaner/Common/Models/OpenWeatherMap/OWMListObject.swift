//
//  OWMListObject.swift
//  TravelPlaner
//
//  Created by Nikola Simunko on 25/08/2017.
//  Copyright © 2017 Nikola Simunko. All rights reserved.
//

import Unbox

struct OWMListObject {
    let temp: OWMTemp
    let weather: [OWMWeather]
}

extension OWMListObject: Unboxable {
    init(unboxer: Unboxer) throws {
        temp = try unboxer.unbox(key: "temp")
        weather = try unboxer.unbox(key: "weather")
    }
}

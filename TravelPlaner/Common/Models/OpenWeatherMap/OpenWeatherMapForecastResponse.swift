//
//  OpenWeatherMapForecastResponse.swift
//  TravelPlaner
//
//  Created by Nikola Simunko on 25/08/2017.
//  Copyright © 2017 Nikola Simunko. All rights reserved.
//

import Unbox

struct OpenWeatherMapForecastResponse {
    let city: OWMCity
    let list: [OWMListObject]
}

extension OpenWeatherMapForecastResponse: Unboxable {
    init(unboxer: Unboxer) throws {
        city = try unboxer.unbox(key: "city")
        list = try unboxer.unbox(key: "list")
    }
}

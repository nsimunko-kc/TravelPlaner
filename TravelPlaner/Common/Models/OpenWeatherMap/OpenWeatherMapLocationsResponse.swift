//
//  OpenWeatherMapLocationsResponse.swift
//  TravelPlaner
//
//  Created by Nikola Simunko on 22/08/2017.
//  Copyright © 2017 Nikola Simunko. All rights reserved.
//

import Unbox

struct OpenWeatherMapLocationsResponse {
    let name: String
    let countryCode: String
}

extension OpenWeatherMapLocationsResponse: Unboxable {
    init(unboxer: Unboxer) throws {
        name = try unboxer.unbox(key: "name")
        countryCode = try unboxer.unbox(keyPath: "sys.country")
    }
}

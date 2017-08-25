//
//  WeatherConditions.swift
//  TravelPlaner
//
//  Created by Nikola Simunko on 25/08/2017.
//  Copyright © 2017 Nikola Simunko. All rights reserved.
//

import UIKit

enum WeatherConditions {
    case clearSky
    case sunClouds
    case clouds
    case rain
    case storm
    case snow
    case mist
    
    var title: String {
        switch self {
        case .clearSky:
            return "Vedro"
        case .sunClouds:
            return "Oblačno"
        case .clouds:
            return "Oblačno"
        case .rain:
            return "Kiša"
        case .storm:
            return "Oluja"
        case .snow:
            return "Snijeg"
        case .mist:
            return "Magla"
        }
    }
    
    var apiKey: CountableRange<Int> {
        switch self {
        case .clearSky:
            return 800..<801
        case .sunClouds:
            return 801..<802
        case .clouds:
            return 802..<805
        case .rain:
            return 300..<532
        case .storm:
            return 200..<233
        case .snow:
            return 600..<623
        case .mist:
            return 701..<782
        }
    }
    
    static func getWeatherFrom(apiKey key: Int) -> WeatherConditions? {
        switch key {
        case WeatherConditions.clearSky.apiKey:
            return WeatherConditions.clearSky
        case WeatherConditions.sunClouds.apiKey:
            return WeatherConditions.sunClouds
        case WeatherConditions.clouds.apiKey:
            return WeatherConditions.clouds
        case WeatherConditions.rain.apiKey:
            return WeatherConditions.rain
        case WeatherConditions.storm.apiKey:
            return WeatherConditions.storm
        case WeatherConditions.snow.apiKey:
            return WeatherConditions.snow
        case WeatherConditions.mist.apiKey:
            return WeatherConditions.mist
        default:
            return WeatherConditions.mist
        }
    }
    
    var icon: UIImage {
        switch self {
        case .clearSky:
            return #imageLiteral(resourceName: "weather_clear_sky")
        case .sunClouds:
            return #imageLiteral(resourceName: "weather_sun_clouds")
        case .clouds:
            return #imageLiteral(resourceName: "weather_clouds")
        case .rain:
            return #imageLiteral(resourceName: "weather_rain")
        case .storm:
            return #imageLiteral(resourceName: "weather_storm")
        case .snow:
            return #imageLiteral(resourceName: "weather_snow")
        case .mist:
            return #imageLiteral(resourceName: "weather_mist")
        }
    }
}

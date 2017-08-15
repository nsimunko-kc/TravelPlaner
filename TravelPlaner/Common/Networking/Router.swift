//
//  Router.swift
//  TravelPlaner
//
//  Created by Nikola Simunko on 11/08/2017.
//  Copyright © 2017 Nikola Simunko. All rights reserved.
//

import Alamofire

enum Router: URLRequestConvertible {
    
    /// Returns a URL request or throws if an `Error` was encountered.
    ///
    /// - throws: An `Error` if the underlying `URLRequest` is `nil`.
    ///
    /// - returns: A URL request.
    func asURLRequest() throws -> URLRequest {
        <#code#>
    }

    
    // Base URLs
    fileprivate static let _openWeatherMapBaseURL = URL(string: "http://api.openweathermap.org/data/2.5")
    fileprivate static let _gettyImagesBaseURL = URL(string: "https://api.gettyimages.com/v3")
    
    // API app IDs
    fileprivate static let _openWeatherMapAppID = "cbca95b116cfc9e7d07812752d515c2d"
    fileprivate static let _gettyImagesAppKey = "4d57ujcbd6rjfr7pyyw3n5pn"
    
    
    
}

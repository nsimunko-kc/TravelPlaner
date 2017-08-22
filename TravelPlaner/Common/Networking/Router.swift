//
//  Router.swift
//  TravelPlaner
//
//  Created by Nikola Simunko on 11/08/2017.
//  Copyright © 2017 Nikola Simunko. All rights reserved.
//

import Alamofire

enum Router: URLRequestConvertible {
    
    // Base URLs
    fileprivate static let _openWeatherMapBaseURL = URL(string: "http://api.openweathermap.org/data/2.5")!
    fileprivate static let _gettyImagesBaseURL = URL(string: "https://api.gettyimages.com/v3")!
    
    // API app IDs
    fileprivate static let _openWeatherMapAppID = "cbca95b116cfc9e7d07812752d515c2d"
    fileprivate static let _gettyImagesAppKey = "4d57ujcbd6rjfr7pyyw3n5pn"
    
    
    case weatherCurrent(location: String)
    case weatherForecast(location: String)
    case images(location: String)
    
    fileprivate var method: HTTPMethod {
        switch self {
        default:
            return .get
        }
    }
    
    fileprivate var path: String {
        switch self {
        case .weatherCurrent:
            return "/weather"
        case .weatherForecast:
            return "/forecast"
        case .images:
            return "/search/images"
        }
    }
    
    /// Returns a URL request or throws if an `Error` was encountered.
    ///
    /// - throws: An `Error` if the underlying `URLRequest` is `nil`.
    ///
    /// - returns: A URL request.
    func asURLRequest() throws -> URLRequest {
        let url: URL
        
        switch self {
        case .weatherCurrent, .weatherForecast:
            url = Router._openWeatherMapBaseURL
        case .images:
            url = Router._gettyImagesBaseURL
        }
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        
        switch self {
        case .weatherCurrent(let location), .weatherForecast(let location):
            let parameters = ["q": location, "units": "metric", "appid": Router._openWeatherMapAppID]
            urlRequest = try URLEncoding.default.encode(urlRequest, with: parameters)
        case .images(let location):
            urlRequest.setValue(Router._gettyImagesAppKey, forHTTPHeaderField: "Api-Key")
            let parameters = ["phrase": location]
            urlRequest = try URLEncoding.default.encode(urlRequest, with: parameters)
        }
        
        return urlRequest
    }
    
    
}

extension Request {
    public func debugLog() -> Self {
        print(self.debugDescription)
        return self
    }
}

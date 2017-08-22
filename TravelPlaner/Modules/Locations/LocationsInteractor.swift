//
//  LocationsInteractor.swift
//  TravelPlaner
//
//  Created by Nikola Simunko on 22/08/2017.
//  Copyright (c) 2017 Nikola Simunko. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import Alamofire
import UnboxedAlamofire

final class LocationsInteractor: NSObject {

    // MARK: - Private functions -
    
}

// MARK: - Extensions -

extension LocationsInteractor: LocationsInteractorInterface {
    
    func getLocations(_ searchText: String, completion: @escaping ((Result<(OpenWeatherMapLocationsResponse)>) -> ())) {
        Alamofire.request(Router.weatherCurrent(location: searchText)).debugLog().responseObject { (response: DataResponse<OpenWeatherMapLocationsResponse>) in
            switch response.result {
            case let .success(result):
                print("APICall - getLocations: Success")
                completion(.success(result))
            case let .failure(error):
                print("APICall - getLocations: Failure")
                print("\(error.localizedDescription)")
                completion(.failure(error))
            }
        }
    }
    
    func store(location: String) {
        var locations: [String]
        
        if let _locations = UserDefaults.standard.stringArray(forKey: Constants.UserDefaultsKeys.FavoriteLocations) {
            locations = _locations
        } else {
            locations = []
        }
        
        if !locations.contains(location) {
            locations.append(location)
        }
        
        UserDefaults.standard.set(locations, forKey: Constants.UserDefaultsKeys.FavoriteLocations)
    }
    
}

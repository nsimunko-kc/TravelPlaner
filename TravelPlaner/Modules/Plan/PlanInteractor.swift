//
//  PlanInteractor.swift
//  TravelPlaner
//
//  Created by Nikola Simunko on 18/08/2017.
//  Copyright (c) 2017 Nikola Simunko. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import Alamofire
import UnboxedAlamofire
import Google
import GTMOAuth2
import GoogleSignIn
import GoogleAPIClientForREST

final class PlanInteractor: NSObject {

    // MARK: - Private functions -
    
}

// MARK: - Extensions -

extension PlanInteractor: PlanInteractorInterface {
    
    func loadLocations() -> [String]? {
        return UserDefaults.standard.stringArray(forKey: Constants.UserDefaultsKeys.FavoriteLocations)
    }
    
    func getForecast(_ location: String, completion: @escaping ((Result<(OpenWeatherMapForecastResponse)>) -> ())) {
        Alamofire.request(Router.weatherForecast(location: location)).debugLog().responseObject { (response: DataResponse<OpenWeatherMapForecastResponse>) in
            switch response.result {
            case let .success(result):
                print("API call - getForecast: Success")
                completion(.success(result))
            case let .failure(error):
                print("API call - getForecast: Failure")
                print(error.localizedDescription)
                completion(.failure(error))
            }
        }
    }
    
    func getImages(_ location: String, completion: @escaping ((Result<(GettyImagesGalleryResponse)>) -> ())) {
        Alamofire.request(Router.images(location: location)).debugLog().responseObject { (response: DataResponse<GettyImagesGalleryResponse>) in
            switch response.result {
            case let .success(result):
                print("API call - getImages: Success")
                completion(.success(result))
            case let .failure(error):
                print("API call - getImages: Failure")
                print(error.localizedDescription)
                completion(.failure(error))
            }
        }
    }
    
    func save(plan: BasicPlanInfoItem) -> Bool {
        guard let service = GoogleService.shared.gService else {
            return false
        }
        
        let startOfEvent = GTLRCalendar_EventDateTime()
        let endOfEvent = GTLRCalendar_EventDateTime()
        let calendarEvent = GTLRCalendar_Event()
        
        startOfEvent.dateTime = GTLRDateTime(date: plan.dateFrom)
        endOfEvent.dateTime = GTLRDateTime(date: plan.dateTo)
        
        startOfEvent.timeZone = "Etc/GMT+0"
        endOfEvent.timeZone = "Etc/GMT+0"
        
        calendarEvent.summary = "Plan putovanja za \(plan.location)"
        calendarEvent.location = plan.location
        calendarEvent.descriptionProperty = plan.location
        calendarEvent.start = startOfEvent
        calendarEvent.end = endOfEvent
        
        let query = GTLRCalendarQuery_EventsInsert.query(withObject: calendarEvent, calendarId: "primary")
        
        service.executeQuery(query) { [weak self] (ticket, object, error) in
            if let error = error {
                print(error.localizedDescription)
            } else {
                var plans: [String]
                
                if let savedPlanData = UserDefaults.standard.object(forKey: Constants.UserDefaultsKeys.SavedPlans) as? [String] {
                    plans = savedPlanData
                    plans.append(plan.encodedPlanData())
                } else {
                    plans = [plan.encodedPlanData()]
                }
                
                UserDefaults.standard.setValue(plans, forKey: Constants.UserDefaultsKeys.SavedPlans)
            }
        }
        
        return true
    }
    
}

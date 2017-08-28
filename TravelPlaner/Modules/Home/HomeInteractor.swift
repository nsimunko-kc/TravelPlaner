//
//  HomeInteractor.swift
//  TravelPlaner
//
//  Created by Nikola Simunko on 14/08/2017.
//  Copyright (c) 2017 Nikola Simunko. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import Foundation

final class HomeInteractor: NSObject {

    // MARK: - Private functions -
    
}

// MARK: - Extensions -

extension HomeInteractor: HomeInteractorInterface {
    
    func loadPlans() -> [BasicPlanInfoItem] {
        guard let savedPlanData = UserDefaults.standard.object(forKey: Constants.UserDefaultsKeys.SavedPlans) as? [String] else {
            return []
        }
        
        var plans = [BasicPlanInfoItem]()
        
        for item in savedPlanData {
            let decodedPlan = item.components(separatedBy: "-")
            let location = decodedPlan[0]
            let dateFrom = DateFormatter.shared.date(from: decodedPlan[1], withFormat: DateFormat.defaultFormat)!
            let dateTo = DateFormatter.shared.date(from: decodedPlan[2], withFormat: DateFormat.defaultFormat)!
            
            let plan = BasicPlanInfoItem(location: location, dateFrom: dateFrom, dateTo: dateTo)
            
            plans.append(plan)
        }
        
        return plans
    }
    
}

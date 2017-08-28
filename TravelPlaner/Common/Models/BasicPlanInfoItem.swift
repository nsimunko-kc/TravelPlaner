//
//  BasicPlanInfoItem.swift
//  TravelPlaner
//
//  Created by Nikola Simunko on 20/08/2017.
//  Copyright © 2017 Nikola Simunko. All rights reserved.
//

import Foundation

struct BasicPlanInfoItem {
    let location: String
    let dateFrom: Date
    let dateTo: Date
    
    func encodedPlanData() -> String {
        let dateFromString = DateFormatter.shared.string(from: dateFrom, withFormat: DateFormat.defaultFormat)
        let dateToString = DateFormatter.shared.string(from: dateTo, withFormat: DateFormat.defaultFormat)
        
        return "\(location)-\(dateFromString)-\(dateToString)"
    }
    
    static func decodePlan(_ data: String) -> BasicPlanInfoItem {
        let decodedData = data.components(separatedBy: "-")
        
        let location = decodedData[0]
        let dateFrom = DateFormatter.shared.date(from: decodedData[1], withFormat: DateFormat.defaultFormat)
        let dateTo = DateFormatter.shared.date(from: decodedData[2], withFormat: DateFormat.defaultFormat)
        
        return BasicPlanInfoItem(location: location, dateFrom: dateFrom!, dateTo: dateTo!)
    }
}

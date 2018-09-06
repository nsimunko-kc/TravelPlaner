//
//  ExtraPlanInfoItem.swift
//  TravelPlaner
//
//  Created by Nikola Simunko on 28/08/2017.
//  Copyright © 2017 Nikola Simunko. All rights reserved.
//

import Foundation

struct ExtraPlanInfoItem {
    let ID: String
    let location: String
    let dateFrom: Date
    let dateTo: Date
    
    static func initWith(_ basicPlan: BasicPlanInfoItem, and ID: String) -> ExtraPlanInfoItem {
        return ExtraPlanInfoItem(ID: ID, location: basicPlan.location, dateFrom: basicPlan.dateFrom, dateTo: basicPlan.dateTo)
    }
    
    func encodedPlanData() -> String {
        let dateFromString = DateFormatter.shared.string(from: dateFrom, withFormat: DateFormat.defaultFormat)
        let dateToString = DateFormatter.shared.string(from: dateTo, withFormat: DateFormat.defaultFormat)
        
        return "\(ID)-\(location)-\(dateFromString)-\(dateToString)"
    }
    
    static func decodePlan(_ data: String) -> ExtraPlanInfoItem {
        let decodedData = data.components(separatedBy: "-")
        
        let ID = decodedData[0]
        let location = decodedData[1]
        let dateFrom = DateFormatter.shared.date(from: decodedData[2], withFormat: DateFormat.defaultFormat)
        let dateTo = DateFormatter.shared.date(from: decodedData[3], withFormat: DateFormat.defaultFormat)
        
        return ExtraPlanInfoItem(ID: ID, location: location, dateFrom: dateFrom!, dateTo: dateTo!)
    }
}

//
//  DateFormatterExtension.swift
//  TravelPlaner
//
//  Created by Nikola Simunko on 24/08/2017.
//  Copyright © 2017 Nikola Simunko. All rights reserved.
//

import Foundation

enum DateFormat: String {
    case defaultFormat = "d.M.yyyy"
    case apiFormat = "yyyy-mm-dd"
}

class DateFormatter: Foundation.DateFormatter {
    
    static let shared = DateFormatter()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init() {
        super.init()
        dateFormat = DateFormat.defaultFormat.rawValue
    }
    
    func string(from date: Date, withFormat format: DateFormat) -> String {
        dateFormat = format.rawValue
        return string(from: date)
    }
    
    func date(from string: String, withFormat format: DateFormat) -> Date? {
        dateFormat = format.rawValue
        return date(from: string)
    }
    
}

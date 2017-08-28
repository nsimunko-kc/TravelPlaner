//
//  GoogleService.swift
//  TravelPlaner
//
//  Created by Nikola Simunko on 28/08/2017.
//  Copyright © 2017 Nikola Simunko. All rights reserved.
//

import Foundation
import GoogleAPIClientForREST
import GoogleSignIn

final class GoogleService {
    
    static let shared = GoogleService()
    
    var gService: GTLRCalendarService?
}

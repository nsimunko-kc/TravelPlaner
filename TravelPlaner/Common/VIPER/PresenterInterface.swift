//
//  PresenterInterface.swift
//  TravelPlaner
//
//  Created by Nikola Simunko on 11/08/2017.
//  Copyright © 2017 Nikola Simunko. All rights reserved.
//

import Foundation
import UIKit

// MARK: - Base presenter interface -
protocol PresenterInterface {
    func viewDidLoad()
    func viewWillAppear(_ animated: Bool)
    func viewDidAppear(_ animated: Bool)
    func viewWillDisappear(_ animated: Bool)
    func viewDidDisappear(_ animated: Bool)
}

// MARK: - Base presenter interface default implementation -
extension PresenterInterface {
    func viewDidLoad() {
        fatalError("Implementation pending...")
    }
    
    func viewWillAppear(_ animated: Bool) {
        fatalError("Implementation pending...")
    }
    
    func viewDidAppear(_ animated: Bool) {
        fatalError("Implementation pending...")
    }
    
    func viewWillDisappear(_ animated: Bool) {
        fatalError("Implementation pending...")
    }
    
    func viewDidDisappear(_ animated: Bool) {
        fatalError("Implementation pending...")
    }
}

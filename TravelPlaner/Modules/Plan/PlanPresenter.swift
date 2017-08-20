//
//  PlanPresenter.swift
//  TravelPlaner
//
//  Created by Nikola Simunko on 18/08/2017.
//  Copyright (c) 2017 Nikola Simunko. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

enum PlanItem {
    case dateItem
    case locationItem
    case forecastItem
    case imageItem
}

final class PlanPresenter: NSObject {
    
    // MARK: - Private properties -

    fileprivate weak var _view: PlanViewInterface?
    fileprivate var _interactor: PlanInteractorInterface
    fileprivate var _wireframe: PlanWireframeInterface
    
    fileprivate var _plan: BasicPlanInfoItem?
    
    fileprivate var _didSetLocation = false
    
    // MARK: - Lifecycle -
    
    init (wireframe: PlanWireframeInterface, view: PlanViewInterface, interactor: PlanInteractorInterface, planInfoItem: BasicPlanInfoItem? = nil) {
        _wireframe = wireframe
        _view = view
        _interactor = interactor
        _plan = planInfoItem
    }

    // MARK: - Private functions -
    
}

// MARK: - Extensions -

extension PlanPresenter: PlanPresenterInterface {
    
    func didSelectNavigationAction(action: PlanNavigationAction) {
        _wireframe.performNavigationAction(action: action)
    }
    
    func numberOfSections() -> Int {
        
    }
    
    func numberOfItems(in section: Int) -> Int {
        
    }
    
    func item(for indexPath: IndexPath) -> PlanItem {
        
    }
    
}

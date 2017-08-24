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
    case dateItem(PlanDateCellItem)
    case locationItem(PlanLocationCellItem)
    case forecastItem(PlanForecastCellItem)
    case galleryItem
}

final class PlanPresenter: NSObject {
    
    // MARK: - Private properties -

    fileprivate weak var _view: PlanViewInterface?
    fileprivate var _interactor: PlanInteractorInterface
    fileprivate var _wireframe: PlanWireframeInterface
    
    fileprivate var _plan: BasicPlanInfoItem?
    
    fileprivate var _didSetLocation = false
    
    fileprivate var _items = [PlanItem]()
    
    // MARK: - Lifecycle -
    
    init (wireframe: PlanWireframeInterface, view: PlanViewInterface, interactor: PlanInteractorInterface, planInfoItem: BasicPlanInfoItem? = nil) {
        _wireframe = wireframe
        _view = view
        _interactor = interactor
        _plan = planInfoItem
    }

    // MARK: - Private functions -
    
    fileprivate func _loadData() {
        _items.removeAll()
        
        if let plan = _plan {
            _items.append(PlanItem.dateItem(PlanDateCellItem(startDate: plan.dateFrom, endDate: plan.dateTo)))
            _items.append(PlanItem.locationItem(PlanLocationCellItem(location: plan.location)))
            
            // Fetch weather forecast data from OWM api
            
        } else {
            _items.append(PlanItem.dateItem(PlanDateCellItem(startDate: Date(), endDate: Date())))
            _items.append(PlanItem.locationItem(PlanLocationCellItem(location: "")))
        }
    }
    
}

// MARK: - Extensions -

extension PlanPresenter: PlanPresenterInterface {
    
    func didSelectNavigationAction(action: PlanNavigationAction) {
        _wireframe.performNavigationAction(action: action)
    }
    
    func numberOfSections() -> Int {
        return 1
    }
    
    func numberOfItems(in section: Int) -> Int {
        return _items.count
    }
    
    func item(for indexPath: IndexPath) -> PlanItem {
        return _items[indexPath.row]
    }
    
    func locations() -> [String] {
        if let locations = _interactor.loadLocations() {
            return locations
        } else {
            return []
        }
    }
    
    func viewDidLoad() {
        _loadData()
    }
    
}

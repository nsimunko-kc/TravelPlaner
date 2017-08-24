//
//  PlanInterfaces.swift
//  TravelPlaner
//
//  Created by Nikola Simunko on 18/08/2017.
//  Copyright (c) 2017 Nikola Simunko. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

// MARK: - Navigation -

enum PlanNavigationAction {
}

// MARK: - Plan Wireframe Interface -

protocol PlanWireframeInterface: WireframeInterface {
    func performNavigationAction(action: PlanNavigationAction)
    func configureModuleWithViewController(viewController: PlanViewController)
}

// MARK: - Plan View Interface -

protocol PlanViewInterface: ViewInterface {
}

// MARK: - Plan Presenter Interface -

protocol PlanPresenterInterface: PresenterInterface {
    func didSelectNavigationAction(action: PlanNavigationAction)
    func numberOfSections() -> Int
    func numberOfItems(in section: Int) -> Int
    func item(for indexPath: IndexPath) -> PlanItem
    func locations() -> [String]
}

// MARK: - Plan Interactor Interface -

protocol PlanInteractorInterface: InteractorInterface {
    func loadLocations() -> [String]?
}

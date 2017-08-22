//
//  HomeInterfaces.swift
//  TravelPlaner
//
//  Created by Nikola Simunko on 14/08/2017.
//  Copyright (c) 2017 Nikola Simunko. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

// MARK: - Navigation -

enum HomeNavigationAction {
    case newPlanAction
    case editPlanAction(BasicPlanInfoItem)
}

// MARK: - Home Wireframe Interface -

protocol HomeWireframeInterface: WireframeInterface {
    func performNavigationAction(action: HomeNavigationAction)
    func configureModuleWithViewController(viewController: HomeViewController)
}

// MARK: - Home View Interface -

protocol HomeViewInterface: ViewInterface {
    func reloadData()
}

// MARK: - Home Presenter Interface -

protocol HomePresenterInterface: PresenterInterface {
    func didSelectNavigationAction(action: HomeNavigationAction)
    func didSelectNewPlanAction()
    func didSelectEditPlanAction(at indexPath: IndexPath)
    func numberOfSections() -> Int
    func numberOfRows(in section: Int) -> Int
    func didSelectItem(at indexPath: IndexPath)
    func item(at indexPath: IndexPath) -> BasicPlanInfoItem
}

// MARK: - Home Interactor Interface -

protocol HomeInteractorInterface: InteractorInterface {
    
}

//
//  HomePresenter.swift
//  TravelPlaner
//
//  Created by Nikola Simunko on 14/08/2017.
//  Copyright (c) 2017 Nikola Simunko. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

final class HomePresenter: NSObject {
    
    // MARK: - Private properties -

    fileprivate weak var _view: HomeViewInterface?
    fileprivate var _interactor: HomeInteractorInterface
    fileprivate var _wireframe: HomeWireframeInterface
    
    // MARK: - Lifecycle -
    
    init (wireframe: HomeWireframeInterface, view: HomeViewInterface, interactor: HomeInteractorInterface) {
        _wireframe = wireframe
        _view = view
        _interactor = interactor
    }

    // MARK: - Private functions -
    
}

// MARK: - Extensions -

extension HomePresenter: HomePresenterInterface {
    
    func didSelectNavigationAction(action: HomeNavigationAction) {
        _wireframe.performNavigationAction(action: action)
    }
    
}
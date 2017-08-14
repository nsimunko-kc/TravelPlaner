//
//  FavoritesPresenter.swift
//  TravelPlaner
//
//  Created by Nikola Simunko on 14/08/2017.
//  Copyright (c) 2017 Nikola Simunko. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

final class FavoritesPresenter: NSObject {
    
    // MARK: - Private properties -

    fileprivate weak var _view: FavoritesViewInterface?
    fileprivate var _interactor: FavoritesInteractorInterface
    fileprivate var _wireframe: FavoritesWireframeInterface
    
    // MARK: - Lifecycle -
    
    init (wireframe: FavoritesWireframeInterface, view: FavoritesViewInterface, interactor: FavoritesInteractorInterface) {
        _wireframe = wireframe
        _view = view
        _interactor = interactor
    }

    // MARK: - Private functions -
    
}

// MARK: - Extensions -

extension FavoritesPresenter: FavoritesPresenterInterface {
    
    func didSelectNavigationAction(action: FavoritesNavigationAction) {
        _wireframe.performNavigationAction(action: action)
    }
    
}
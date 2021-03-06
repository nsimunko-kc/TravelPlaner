//
//  SettingsPresenter.swift
//  TravelPlaner
//
//  Created by Nikola Simunko on 14/08/2017.
//  Copyright (c) 2017 Nikola Simunko. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit
import GoogleSignIn

enum SettingsItem: Int {
    case info
    case clearPlans
    case clearLocations
    case logout
}

final class SettingsPresenter: NSObject {
    
    // MARK: - Private properties -

    fileprivate weak var _view: SettingsViewInterface?
    fileprivate var _interactor: SettingsInteractorInterface
    fileprivate var _wireframe: SettingsWireframeInterface
    
    fileprivate var _sections = [[SettingsItem]]()
    
    // MARK: - Lifecycle -
    
    init (wireframe: SettingsWireframeInterface, view: SettingsViewInterface, interactor: SettingsInteractorInterface) {
        _wireframe = wireframe
        _view = view
        _interactor = interactor
    }

    // MARK: - Private functions -
    
    fileprivate func _configureItems() {
        _sections.append([SettingsItem.info])
        _sections.append([SettingsItem.clearPlans, SettingsItem.clearLocations])
        _sections.append([SettingsItem.logout])
    }
    
}

// MARK: - Extensions -

extension SettingsPresenter: SettingsPresenterInterface {
    
    func didSelectNavigationAction(action: SettingsNavigationAction) {
        _wireframe.performNavigationAction(action: action)
    }
    
    func numberOfSections() -> Int {
        return _sections.count
    }
    
    func numberOfRows(in section: Int) -> Int {
        return _sections[section].count
    }
    
    func item(at indexPath: IndexPath) -> SettingsItem {
        return _sections[indexPath.section][indexPath.row]
    }
    
    func didSelectItem(at indexPath: IndexPath) {
        let item = _sections[indexPath.section][indexPath.row]
        
        switch item {
        case .info:
            break
        case .clearPlans:
            break
        case .clearLocations:
            break
        case .logout:
            GIDSignIn.sharedInstance().signOut()
            _wireframe.performNavigationAction(action: .logout)
        }
    }
    
    func viewDidLoad() {
        _configureItems()
    }
    
}

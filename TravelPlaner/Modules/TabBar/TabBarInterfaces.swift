//
//  TabBarInterfaces.swift
//  TravelPlaner
//
//  Created by Nikola Simunko on 14/08/2017.
//  Copyright (c) 2017 Nikola Simunko. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

// MARK: - Navigation -

enum TabBarNavigationAction {
}

// MARK: - TabBar Wireframe Interface -

protocol TabBarWireframeInterface: WireframeInterface {
    func performNavigationAction(action: TabBarNavigationAction)
    func configureModuleWithViewController(viewController: TabBarViewController)
}

// MARK: - TabBar View Interface -

protocol TabBarViewInterface: ViewInterface {
}

// MARK: - TabBar Presenter Interface -

protocol TabBarPresenterInterface: PresenterInterface {
    func didSelectNavigationAction(action: TabBarNavigationAction)
}

// MARK: - TabBar Interactor Interface -

protocol TabBarInteractorInterface: InteractorInterface {
}
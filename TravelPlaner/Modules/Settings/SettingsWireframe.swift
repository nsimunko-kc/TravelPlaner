//
//  SettingsWireframe.swift
//  TravelPlaner
//
//  Created by Nikola Simunko on 14/08/2017.
//  Copyright (c) 2017 Nikola Simunko. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

struct SettingsContext {
}

final class SettingsWireframe: NSObject {
    
    // MARK: - Private properties -

    private var _context: SettingsContext?
    private let _storyboard: UIStoryboard = UIStoryboard(name: Constants.StoryboardIdentifiers.Settings, bundle: nil)
    
    // MARK: - Public properties -
    
    weak var navigationController: UINavigationController?
    weak var viewController: UIViewController?
    
    // MARK: - Lifecycle -
    
    init(navigationController: UINavigationController? = nil, context: SettingsContext? = nil) {
        super.init()
        _context = context
        self.navigationController = navigationController
    }
    
    // MARK: - Module setup -
    
    func instantiateAndConfigureModule() -> UIViewController {
        guard let viewController = _storyboard.instantiateViewController(withIdentifier: Constants.ViewControllerIdentifiers.Settings) as? SettingsViewController else {
            fatalError("No view controller found with the following identifier: \(Constants.ViewControllerIdentifiers.Settings)")
        }
        
        configureModuleWithViewController(viewController: viewController)
        
        return viewController
    }
    
    func configureModuleWithViewController(viewController: SettingsViewController) {
        let interactor = SettingsInteractor()
        let presenter = SettingsPresenter(wireframe: self, view: viewController, interactor: interactor)
        viewController.presenter = presenter
        self.viewController = viewController
    }

}

// MARK: - Extensions -

extension SettingsWireframe: SettingsWireframeInterface {
    
    func performNavigationAction(action: SettingsNavigationAction) {
        switch action {
        default:
            break
        }
    }

}

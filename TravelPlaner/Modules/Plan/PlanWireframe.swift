//
//  PlanWireframe.swift
//  TravelPlaner
//
//  Created by Nikola Simunko on 18/08/2017.
//  Copyright (c) 2017 Nikola Simunko. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

struct PlanContext {
    let plan: ExtraPlanInfoItem
}

final class PlanWireframe: NSObject {
    
    // MARK: - Private properties -

    private var _context: PlanContext?
    private let _storyboard: UIStoryboard = UIStoryboard(name: Constants.StoryboardIdentifiers.Plan, bundle: nil)
    
    // MARK: - Public properties -
    
    weak var navigationController: UINavigationController?
    weak var viewController: UIViewController?
    
    // MARK: - Lifecycle -
    
    init(navigationController: UINavigationController? = nil, context: PlanContext? = nil) {
        super.init()
        _context = context
        self.navigationController = navigationController
    }
    
    // MARK: - Module setup -
    
    func instantiateAndConfigureModule() -> UIViewController {
        guard let viewController = _storyboard.instantiateViewController(withIdentifier: Constants.ViewControllerIdentifiers.Plan) as? PlanViewController else {
            fatalError("No view controller found with the following identifier: \(Constants.ViewControllerIdentifiers.Plan)")
        }
        
        configureModuleWithViewController(viewController: viewController)
        
        return viewController
    }
    
    func configureModuleWithViewController(viewController: PlanViewController) {
        let plan: ExtraPlanInfoItem? = _context?.plan
        let interactor = PlanInteractor()
        let presenter = PlanPresenter(wireframe: self, view: viewController, interactor: interactor, planInfoItem: plan)
        viewController.presenter = presenter
        self.viewController = viewController
    }

}

// MARK: - Extensions -

extension PlanWireframe: PlanWireframeInterface {
    
    func performNavigationAction(action: PlanNavigationAction) {
        switch action {
        case .back:
            popViewController(animated: true)
        }
    }

}

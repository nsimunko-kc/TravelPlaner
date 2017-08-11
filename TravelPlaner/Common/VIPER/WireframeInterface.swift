//
//  WireframeInterface.swift
//  TravelPlaner
//
//  Created by Nikola Simunko on 11/08/2017.
//  Copyright © 2017 Nikola Simunko. All rights reserved.
//

import Foundation
import UIKit
import SafariServices

// MARK: - Wireframe interface -
protocol WireframeInterface: class {
    
    weak var navigationController: UINavigationController? { get set }
    weak var viewController: UIViewController? { get set }
    
    func instantiateAndConfigureModule() -> UIViewController
    func instantiateAndConfigureModuleWithNavigationController() -> UINavigationController
    
    func pushViewOnNavigationController(animated: Bool)
    func popViewController(animated: Bool)
    func popToRootViewController(animated: Bool)
    func presentFromViewController(viewController: UIViewController, animated: Bool)
    func dismissViewController(animated: Bool)
    
    func open(URL: URL)
}

// MARK: - Wireframe interface default implementation -
extension WireframeInterface {
    
    func instantiateAndConfigureModuleWithNavigationController() -> UINavigationController {
        let viewController = instantiateAndConfigureModule()
        let navigationController = UINavigationController(rootViewController: viewController)
        self.navigationController = navigationController
        return navigationController
    }
    
    func pushViewOnNavigationController(animated: Bool) {
        navigationController?.pushViewController(instantiateAndConfigureModule(), animated: animated)
    }
    
    func popViewController(animated: Bool) {
        let _ = navigationController?.popViewController(animated: animated)
    }
    
    func popToRootViewController(animated: Bool) {
        let _ = navigationController?.popToRootViewController(animated: animated)
    }
    
    func presentFromViewController(viewController: UIViewController, animated: Bool) {
        let moduleViewController = instantiateAndConfigureModule()
        if let navigationController = navigationController {
            assert(navigationController.viewControllers.isEmpty, "You must create a new navigation controller for presentation")
            navigationController.viewControllers = [moduleViewController]
            viewController.present(navigationController, animated: animated, completion: nil)
        } else {
            viewController.present(moduleViewController, animated: animated, completion: nil)
        }
    }
    
    func dismissViewController(animated: Bool) {
        if let navigationController = self.navigationController {
            navigationController.dismiss(animated: animated, completion: nil)
        } else {
            viewController?.dismiss(animated: animated, completion: nil)
        }
    }
    
    func open(URL: URL) {
        guard let presentingViewController = navigationController ?? viewController else {
            return
        }
        
        let safariViewController = SFSafariViewController(url: URL)
        presentingViewController.present(safariViewController, animated: true, completion: nil)
    }
    
    func showConnectionErrorAlert() {
        showAlert(title: "Greska", message: "Doslo je do greske sa internet vezom", actions: nil)
    }
    
    func showGeneralErrorAlert() {
        showAlert(title: "Greska", message: "Doslo je do nepredvidenog problema", actions: nil)
    }
    
    func showAlert(title: String?, message: String?, actions: [UIAlertAction]?, cancelAction: UIAlertAction? = nil, preferredStyle: UIAlertControllerStyle = .alert) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: preferredStyle)
        
        if let cancelAction = cancelAction {
            alertController.addAction(cancelAction)
        } else if actions == nil || actions?.count == 0 {
            alertController.addAction(UIAlertAction(title: "U redu", style: .cancel, handler: nil))
        }
        
        if let actions = actions {
            actions.forEach { action in
                alertController.addAction(action)
            }
        }
        
        viewController?.present(alertController, animated: true, completion: nil)
    }
    
}

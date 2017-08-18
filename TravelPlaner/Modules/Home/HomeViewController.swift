//
//  HomeViewController.swift
//  TravelPlaner
//
//  Created by Nikola Simunko on 14/08/2017.
//  Copyright (c) 2017 Nikola Simunko. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

final class HomeViewController: UIViewController {

    // MARK: - Private properties -
    
    // MARK: - Public properties -
    
    var presenter: HomePresenterInterface!

    // MARK: - IBOutlets -
    
    // MARK: - Lifecycle -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        _configureUI()
    }

    // MARK: - IBActions -

    // MARK: - Private functions -
    
    fileprivate func _configureUI() {
        navigationItem.title = "Moji planovi"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "ic_plus"), style: .plain, target: self, action: #selector(_newPlanButtonTapped))
        navigationItem.rightBarButtonItem?.tintColor = UIColor.white
        navigationController?.navigationBar.barTintColor = UIColor.appLightBlue()
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
    }
    
    @objc fileprivate func _newPlanButtonTapped() {
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

// MARK: - Extensions -

extension HomeViewController: HomeViewInterface {
}

extension HomeViewController: TabBarItemConfigurable {
    func tabBarItemTitle() -> String {
        return "Planovi"
    }
    
    func tabBarItemDeselectedImageName() -> String {
        return "ic_home"
    }
    
    func tabBarItemSelectedImageName() -> String {
        return "ic_home"
    }
}

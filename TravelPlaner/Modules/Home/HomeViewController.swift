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
import MRProgress

final class HomeViewController: UIViewController {

    // MARK: - Private properties -
    
    // MARK: - Public properties -
    
    var presenter: HomePresenterInterface!

    // MARK: - IBOutlets -
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var placeholderView: UIView!
    
    // MARK: - Lifecycle -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        
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
        presenter.didSelectNewPlanAction()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

// MARK: - Extensions -

extension HomeViewController: HomeViewInterface {
    
    func reloadData() {
        
    }
    
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

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return presenter.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfRows(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter.didSelectEditPlanAction(at: indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44.0
    }
    
}

//
//  TabBarItemConfigurable.swift
//  TravelPlaner
//
//  Created by Nikola Simunko on 14/08/2017.
//  Copyright © 2017 Nikola Simunko. All rights reserved.
//

import Foundation
import UIKit

protocol TabBarItemConfigurable {
    
    func tabBarItemTitle() -> String
    func tabBarItemDeselectedImageName() -> String
    func tabBarItemSelectedImageName() -> String
    
    func configureTabBarItem()
    
}

extension TabBarItemConfigurable where Self: UIViewController {
    
    func configureTabBarItem() {
        tabBarItem.title = tabBarItemTitle()
        tabBarItem.image = UIImage(named: tabBarItemDeselectedImageName())
        tabBarItem.selectedImage = UIImage(named: tabBarItemSelectedImageName())
    }
    
}

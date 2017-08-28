//
//  Constants.swift
//  TravelPlaner
//
//  Created by Nikola Simunko on 11/08/2017.
//  Copyright © 2017 Nikola Simunko. All rights reserved.
//

struct Constants {
    
    struct StoryboardIdentifiers {
        static let TabBar = "TabBar"
        static let Home = "Home"
        static let Favorites = "Favorites"
        static let Settings = "Settings"
        static let Login = "Login"
        static let Plan = "Plan"
        static let Locations = "Locations"
    }
    
    struct ViewControllerIdentifiers {
        static let TabBar = "TabBarViewController"
        static let Home = "HomeViewController"
        static let Favorites = "FavoritesViewController"
        static let Settings = "SettingsViewController"
        static let Login = "LoginViewController"
        static let Plan = "PlanViewController"
        static let Locations = "LocationsViewController"
    }
    
    struct URLs {
        
    }
    
    struct UserDefaultsKeys {
        static let FavoriteLocations = "FavoriteLocations"
        static let SavedPlans = "SavedPlans"
    }
    
    struct ReuseIdentifiers {
        struct TableViewCells {
            static let PlanDateCell = "PlanDateCell"
            static let PlanLocationCell = "PlanLocationCell"
            static let PlanForecastCell = "PlanForecastCell"
            static let PlanGalleryCell = "PlanGalleryCell"
            static let PlanSaveButtonCell = "PlanSaveButtonCell"
            static let FavoritesLocationCell = "LocationCell"
            static let SettingsInfoCell = "SettingsInfoCell"
            static let SettingsActionCell = "SettingsActionCell"
            static let SettingsLogoutCell = "LogoutCell"
            static let HomePlanTableViewCell = "HomePlanTableViewCell"
        }
        
        struct CollectionViewCells {
            static let DayForecastCollectionViewCell = "DayForecastCollectionViewCell"
            static let GalleryImageCollectionViewCell = "GalleryImageCollectionViewCell"
        }
        
        struct HeaderViews {
            static let LocationsHeaderView = "LocationsHeaderView"
        }
    }
    
}

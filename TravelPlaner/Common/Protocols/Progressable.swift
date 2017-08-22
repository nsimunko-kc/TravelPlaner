//
//  Progressable.swift
//  TravelPlaner
//
//  Created by Nikola Simunko on 22/08/2017.
//  Copyright © 2017 Nikola Simunko. All rights reserved.
//

import MRProgress

protocol Progressable {
    func showLoading()
    func hideLoading()
    func hideLoadingWithError()
}

extension Progressable where Self: UIViewController {
    
    func showLoading() {
        MRProgressOverlayView.showOverlayAdded(to: self.view, animated: true)
    }
    
    func hideLoading() {
        MRProgressOverlayView.dismissOverlay(for: self.view, animated: true)
    }
    
}

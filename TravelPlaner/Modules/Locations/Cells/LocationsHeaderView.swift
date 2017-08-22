//
//  LocationsHeaderView.swift
//  TravelPlaner
//
//  Created by Nikola Simunko on 22/08/2017.
//  Copyright © 2017 Nikola Simunko. All rights reserved.
//

import UIKit

protocol LocationsHeaderViewSearchDelegate {
    func didTapSearch(for location: String)
}

final class LocationsHeaderView: UITableViewHeaderFooterView {
    
    @IBOutlet weak var textField: UITextField!
    
    var delegate: LocationsHeaderViewSearchDelegate?
    
    @IBAction func didTapSearchButton(_ sender: UIButton) {
        guard let text = textField.text else {
            return
        }
        
        delegate?.didTapSearch(for: text)
        textField.resignFirstResponder()
    }
    
}

extension LocationsHeaderView: UITextFieldDelegate {
}

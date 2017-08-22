//
//  SettingsInfoCell.swift
//  TravelPlaner
//
//  Created by Nikola Simunko on 22/08/2017.
//  Copyright © 2017 Nikola Simunko. All rights reserved.
//

import UIKit

class SettingsInfoCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    
    func configure(with name: String) {
        nameLabel.text = name
    }

}

//
//  DayForecastCollectionViewCell.swift
//  TravelPlaner
//
//  Created by Nikola Simunko on 24/08/2017.
//  Copyright © 2017 Nikola Simunko. All rights reserved.
//

import UIKit

class DayForecastCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var weatherImageView: UIImageView!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        dayLabel.text = nil
        tempLabel.text = nil
        weatherImageView.image = nil
    }
    
    func configure(with item: DayForecastCellItem) {
        dayLabel.text = item.day
        tempLabel.text = "\(item.temp)˚C"
        weatherImageView.image = item.image
    }
    
}

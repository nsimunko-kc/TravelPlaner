//
//  HomePlanTableViewCell.swift
//  TravelPlaner
//
//  Created by Nikola Simunko on 27/08/2017.
//  Copyright © 2017 Nikola Simunko. All rights reserved.
//

import UIKit

class HomePlanTableViewCell: UITableViewCell {

    @IBOutlet weak var dateFromLabel: UILabel!
    @IBOutlet weak var dateToLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    func configure(with item: HomePlanCellItem) {
        locationLabel.text = item.location
        dateFromLabel.text = DateFormatter.shared.string(from: item.dateFrom, withFormat: DateFormat.defaultFormat)
        dateToLabel.text = DateFormatter.shared.string(from: item.dateTo, withFormat: DateFormat.defaultFormat)
    }

}

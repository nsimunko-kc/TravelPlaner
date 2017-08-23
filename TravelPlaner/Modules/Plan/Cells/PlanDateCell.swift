//
//  PlanDateCell.swift
//  TravelPlaner
//
//  Created by Nikola Simunko on 23/08/2017.
//  Copyright © 2017 Nikola Simunko. All rights reserved.
//

import UIKit

class PlanDateCell: UITableViewCell {

    @IBOutlet weak var startDateTextField: UITextField!
    @IBOutlet weak var endDateTextField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    func configure() {
        
    }

}

extension PlanDateCell: UITextFieldDelegate {
    
}

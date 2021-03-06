//
//  PlanSaveButtonCell.swift
//  TravelPlaner
//
//  Created by Nikola Simunko on 23/08/2017.
//  Copyright © 2017 Nikola Simunko. All rights reserved.
//

import UIKit

protocol PlanSaveButtonCellDelegate {
    func didTapSaveButton()
}

class PlanSaveButtonCell: UITableViewCell {

    @IBOutlet weak var saveButton: UIButton!
    
    var delegate: PlanSaveButtonCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    @IBAction func didTapSaveButton(_ sender: UIButton) {
        delegate?.didTapSaveButton()
    }

}

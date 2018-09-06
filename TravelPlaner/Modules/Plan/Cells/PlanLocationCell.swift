//
//  PlanLocationCell.swift
//  TravelPlaner
//
//  Created by Nikola Simunko on 23/08/2017.
//  Copyright © 2017 Nikola Simunko. All rights reserved.
//

import UIKit

protocol PlanLocationCellDelegate {
    func didSet(location: String)
}

class PlanLocationCell: UITableViewCell {

    @IBOutlet weak var textField: UITextField!
    
    var locations = [String]()
    
    var delegate: PlanLocationCellDelegate?
    
    fileprivate lazy var _pickerView: UIPickerView = {
        let pickerView = UIPickerView()
        pickerView.dataSource = self
        pickerView.delegate = self
        return pickerView
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    func configure(with item: PlanLocationCellItem) {
        textField.text = item.location
    }
    
    @objc fileprivate func _locationPickerButtonHandler(_ sender: UIPickerView) {
        textField.resignFirstResponder()
        
        if let location = textField.text {
            delegate?.didSet(location: location)
        }
    }

}

extension PlanLocationCell: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        let doneButton = UIBarButtonItem(title: "OK", style: .plain, target: self, action: #selector(self._locationPickerButtonHandler(_:)))
        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        
        let toolbar = UIToolbar()
        toolbar.barStyle = .default
        toolbar.isTranslucent = true
        toolbar.isUserInteractionEnabled = true
        toolbar.tintColor = UIColor.appLightBlue()
        toolbar.sizeToFit()
        toolbar.setItems([space, space, doneButton], animated: false)
        
        textField.inputView = _pickerView
        textField.inputAccessoryView = toolbar
    }
    
}

extension PlanLocationCell: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return locations.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return locations[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        textField.text = locations[row]
    }
    
}

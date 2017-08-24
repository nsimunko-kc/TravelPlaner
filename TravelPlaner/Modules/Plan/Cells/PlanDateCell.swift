//
//  PlanDateCell.swift
//  TravelPlaner
//
//  Created by Nikola Simunko on 23/08/2017.
//  Copyright © 2017 Nikola Simunko. All rights reserved.
//

import UIKit

protocol PlanDateCellDelegate {
    func didSet(startDate: Date, endDate: Date)
}

class PlanDateCell: UITableViewCell {

    @IBOutlet weak var startDateTextField: UITextField!
    @IBOutlet weak var endDateTextField: UITextField!
    
    fileprivate var activeTextField: UITextField? = nil
    
    var delegate: PlanDateCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    func configure(with item: PlanDateCellItem) {
        startDateTextField.text = DateFormatter.shared.string(from: item.startDate, withFormat: DateFormat.defaultFormat)
        endDateTextField.text = DateFormatter.shared.string(from: item.endDate, withFormat: DateFormat.defaultFormat)
    }
    
    @objc fileprivate func _dateChanged(_ sender: UIDatePicker) {
        activeTextField?.text = DateFormatter.shared.string(from: sender.date, withFormat: DateFormat.defaultFormat)
    }
    
    @objc fileprivate func _datePickerButtonHandler(_ sender: UIDatePicker) {
        activeTextField?.resignFirstResponder()
    }

}

extension PlanDateCell: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        let datePickerView: UIDatePicker = UIDatePicker()
        datePickerView.datePickerMode = UIDatePickerMode.date
        datePickerView.timeZone = TimeZone.current
        datePickerView.locale = Locale.current
        
        if let text = textField.text, !text.isEmpty {
            if let date = DateFormatter.shared.date(from: text, withFormat: DateFormat.defaultFormat) {
                datePickerView.date = date
            }
        }
        
        let doneButton = UIBarButtonItem(title: "OK", style: .plain, target: self, action: #selector(self._datePickerButtonHandler(_:)))
        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        
        let toolbar = UIToolbar()
        toolbar.barStyle = .default
        toolbar.isTranslucent = true
        toolbar.isUserInteractionEnabled = true
        toolbar.tintColor = UIColor.appLightBlue()
        toolbar.sizeToFit()
        toolbar.setItems([space, space, doneButton], animated: false)
        
        datePickerView.addTarget(self, action: #selector(self._dateChanged(_:)), for: .valueChanged)
        activeTextField = textField
        textField.inputView = datePickerView
        textField.inputAccessoryView = toolbar
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextFieldDidEndEditingReason) {
        if textField == startDateTextField {
            endDateTextField.becomeFirstResponder()
        }
        
        guard let startText = startDateTextField.text, let endText = endDateTextField.text, let startDate = DateFormatter.shared.date(from: startText, withFormat: DateFormat.defaultFormat),
            let endDate = DateFormatter.shared.date(from: endText, withFormat: DateFormat.defaultFormat) else {
                return
        }
        
        delegate?.didSet(startDate: startDate, endDate: endDate)
    }
    
}

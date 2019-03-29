//  ChoiceInputCell.swift

import UIKit

class ChoiceInputCell : PopoverInputCell, UIPickerViewDelegate, UIPickerViewDataSource {
    private var options: [String] = []
    private let optionPicker = UIPickerView()
    
    class override var reuseIdentifier: String {
        return "ChoiceInputCell"
    }
    
    override var valueType: AnswersValueType {
        didSet {
            if case .choice(let options) = valueType {
                self.options = options
            }
            else {
                self.options = []
            }
            optionPicker.reloadAllComponents()
            
            var intrinsicWidth: CGFloat = 180.0
            for option in options {
                let optionWidth = ceil(NSAttributedString(string: option, attributes: [.font: UIFont.systemFont(ofSize: 23.5)]).size().width)
                intrinsicWidth = max(optionWidth, intrinsicWidth)
            }
            
            popoverContentSize = CGSize(width: intrinsicWidth + 40.0, height: optionPicker.intrinsicContentSize.height)
        }
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        valueType = .choice([])
        optionPicker.dataSource = self
        optionPicker.delegate = self
        optionPicker.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        optionPicker.frame = CGRect(x: -9.0, y: 0.0, width: popoverViewController.view.bounds.width + 9.0, height: popoverViewController.view.bounds.height)
        popoverViewController.view.addSubview(optionPicker)
        popoverContentSize = optionPicker.intrinsicContentSize
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: UIPickerViewDataSource Methods
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return options.count
    }
    
    // MARK: UIPickerViewDelegate Methods
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return options[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        messageText = options[row]
    }
}

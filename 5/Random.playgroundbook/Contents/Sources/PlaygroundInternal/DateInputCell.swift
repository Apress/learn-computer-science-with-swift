//  DateInputCell.swift

import UIKit

class DateInputCell : PopoverInputCell {
    private var dateFormatter = DateFormatter()
    private let datePicker = UIDatePicker()
    
    class override var reuseIdentifier: String {
        return "DateInputCell"
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        valueType = .date
        dateFormatter.dateStyle = .long
        datePicker.datePickerMode = .date
        datePicker.addTarget(self, action: #selector(DateInputCell.valueDidChange), for: .valueChanged)
        datePicker.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        datePicker.frame = popoverViewController.view.bounds
        popoverViewController.view.addSubview(datePicker)
        popoverContentSize = datePicker.intrinsicContentSize
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func valueDidChange() {
        messageText = dateFormatter.string(from: datePicker.date)
    }
}

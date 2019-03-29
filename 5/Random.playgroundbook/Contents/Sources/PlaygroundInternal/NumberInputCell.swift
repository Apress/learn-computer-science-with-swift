//  NumberInputCell.swift

import UIKit

class NumberInputCell : PopoverInputCell {
    private var numberPad = NumberPad()
    
    class override var reuseIdentifier: String {
        return "NumberInputCell"
    }
    
    override var valueType: AnswersValueType {
        didSet {
            switch valueType {
            case .number:
                numberPad.allowsFloats = false
            default:
                numberPad.allowsFloats = true
            }
        }
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        valueType = .decimal
        numberPad.addTarget(self, action: #selector(NumberInputCell.valueDidChange), for: .valueChanged)
        numberPad.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        numberPad.frame = popoverViewController.view.bounds
        popoverViewController.view.addSubview(numberPad)
        popoverContentSize = numberPad.intrinsicContentSize
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func valueDidChange() {
        messageText = numberPad.stringValue
    }
    
    override func popoverWillPresent() {
        super.popoverWillPresent()
        numberPad.stringValue = messageText
    }
}

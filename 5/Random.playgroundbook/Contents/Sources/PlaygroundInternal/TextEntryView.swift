//  TextEntryView.swift

import UIKit

class TextEntryView: UITextView {
    private let placeholderLabel = UILabel()
    private var textWidth: CGFloat = 0.0
    private var placeholderWidth: CGFloat = 0.0
    
    var placeholder: String? {
        get {
            return placeholderLabel.text
        }
        set (placeholderText) {
            placeholderLabel.text = placeholderText
            placeholderWidth = placeholderText != nil ? (placeholderText! as NSString).size(withAttributes: [.font: font!]).width : 0.0
            invalidateIntrinsicContentSize()
        }
    }
    
    override var text: String! {
        didSet {
            textWidth = (text as NSString).size(withAttributes: [.font: font!]).width
            placeholderLabel.isHidden = text.characters.count != 0
            invalidateIntrinsicContentSize()
        }
    }
    
    override var font: UIFont? {
        didSet {
            placeholderLabel.font = font
            placeholderWidth = placeholder != nil ? (placeholder! as NSString).size(withAttributes: [.font: font!]).width : 0.0
            textWidth = (text as NSString).size(withAttributes: [.font: font!]).width
            invalidateIntrinsicContentSize()
        }
    }
    
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        isScrollEnabled = false
        textContainerInset = UIEdgeInsets(top: 4.0, left: 2.0, bottom: 2.0, right: 2.0)
        
        placeholderLabel.textColor = UIColor(white: 25.0 / 255.0, alpha: 0.22)
        placeholderLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(placeholderLabel)
        
        NSLayoutConstraint.activate([
            placeholderLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 7.0),
            placeholderLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -7.0),
            placeholderLabel.topAnchor.constraint(equalTo: topAnchor, constant: textContainerInset.top + 1.0)
        ])
        
        layer.cornerRadius = 5.0
        layer.borderWidth = 1.0 / UIScreen.main.scale
        layer.borderColor = UIColor(white: 0.0, alpha: 0.2).cgColor
        
        NotificationCenter.default.addObserver(self, selector: #selector(TextEntryView.textDidChange(_:)), name: .UITextViewTextDidChange, object: self)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func textDidChange(_ note: NSNotification) {
        textWidth = (text as NSString).size(withAttributes: [.font: font!]).width
        placeholderLabel.isHidden = text.characters.count != 0
        invalidateIntrinsicContentSize()
    }
    
    // MARK: UITextView Methods
    
    override var intrinsicContentSize: CGSize {
        let contentWidth = max(textWidth, placeholderWidth) + textContainerInset.left + textContainerInset.right + 2.0 * textContainer.lineFragmentPadding + 4.0
        return CGSize(width: contentWidth, height: UIViewNoIntrinsicMetric)
    }
}

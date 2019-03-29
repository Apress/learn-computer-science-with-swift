//  PopoverInputCell.swift

import UIKit

class PopoverInputCell : InputCell, UIPopoverPresentationControllerDelegate {
    let popoverViewController = UIViewController()
    private var popoverPresented = false
    
    var popoverContentSize: CGSize {
        get {
            return popoverViewController.preferredContentSize
        }
        set (size) {
            textEntryMinimumWidthConstraint.constant = size.width
            popoverViewController.preferredContentSize = size
        }
    }
    
    class override var reuseIdentifier: String {
        return "PopoverInputCell"
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        popoverViewController.modalPresentationStyle = .popover
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func popoverWillPresent() {
        // Override size class to always present as popover
        popoverViewController.presentationController?.overrideTraitCollection = UITraitCollection(horizontalSizeClass: .regular)
        
        if let popover = popoverViewController.popoverPresentationController {
            popover.delegate = self
            popover.sourceView = self
            popover.sourceRect = textEntryView.frame.insetBy(dx: -8, dy: -8)
            popover.permittedArrowDirections = .up
            popover.passthroughViews = [submitButton]
        }
    }
    
    // MARK: UITableViewCell Methods
    
    override func prepareForReuse() {
        super.prepareForReuse()
        popoverPresented = false
    }
    
    // MARK: Actions
    
    @objc override func submit(_ sender: Any?) {
        guard inputEnabled && textEntryView.text.characters.count > 0 else {
            return
        }
        
        delegate?.dismissPopover(popoverViewController, for: self)
        popoverPresented = false
        super.submit(sender)
    }
    
    // MARK: UITextViewDelegate Methods
    
    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        guard !popoverPresented else {
            return false
        }
        
        becomeFirstResponder()
        
        if let shouldPresent = delegate?.cellShouldPresentPopover(self), !shouldPresent {
            return false
        }
        
        popoverWillPresent()
        delegate?.presentPopover(popoverViewController, for: self)
        popoverPresented = true
        
        return false
    }
    
    @objc(textView:shouldChangeTextInRange:replacementText:) override func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        return false
    }
    
    // MARK: UIPopoverPresentationControllerDelegate
    
    func popoverPresentationControllerShouldDismissPopover(_ popoverPresentationController: UIPopoverPresentationController) -> Bool {
        delegate?.cell(self, willDismissPopover: popoverViewController)
        return true
    }
    
    func popoverPresentationControllerDidDismissPopover(_ popoverPresentationController: UIPopoverPresentationController) {
        popoverPresented = false
    }
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
}

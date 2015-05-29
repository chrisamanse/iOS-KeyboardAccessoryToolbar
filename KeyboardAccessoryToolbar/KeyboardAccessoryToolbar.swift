//
//  KeyboardAccessoryToolbar.swift
//  FocusBooster-Pomodoro
//
//  Created by Chris Amanse on 5/9/15.
//  Copyright (c) 2015 Joe Christopher Paul Amanse. All rights reserved.
//

import UIKit

class KeyboardAccessoryToolbar: UIToolbar {
    private static let toolBarHeight: CGFloat = 44
    
    // MARK: - Initialization
    init() {
        super.init(frame: CGRect(x: 0, y: 0, width: 0, height: KeyboardAccessoryToolbar.toolBarHeight))
        addBarItems()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addBarItems()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: - Custom bar items
    func addBarItems() {
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil)
        let doneBarButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Done, target: self, action: Selector("done"))
        items = [flexibleSpace, doneBarButton]
    }
    
    func done() {
        // Pressing done asks delegate if textField should end editing
        // If delegate never implemented it, default to true
        // Simulate a return key press
        var shouldReturn = true
        if let textField = currentView as? UITextField {
            shouldReturn = textField.delegate?.textFieldShouldEndEditing?(textField) ?? shouldReturn
        } else if let textView = currentView as? UITextView {
            shouldReturn = textView.delegate?.textViewShouldEndEditing?(textView) ?? shouldReturn
        }

        if shouldReturn {
            println("shouldReturn")
            // If delegate allow currentView to end editing, then resign as first responder
            currentView?.resignFirstResponder()
        }
    }
    
    // MARK: - Current view relation
    weak var currentView: UIView? {
        didSet {
            if let textField = currentView as? UITextField {
                println("isTextField")
                textField.inputAccessoryView = self
            } else if let textView = currentView as? UITextView {
                println("isTextView")
                textView.inputAccessoryView = self
            }
        }
    }
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}

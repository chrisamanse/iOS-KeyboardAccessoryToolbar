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
        let cancelBarButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Cancel, target: self, action: Selector("cancel"))
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil)
        let doneBarButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Done, target: self, action: Selector("done"))
        items = [cancelBarButton, flexibleSpace, doneBarButton]
    }
    
    func cancel() {
        currentTextField?.resignFirstResponder()
    }
    
    func done() {
        // Pressing done sends message to the textfield's delegate if text field should return
        // Simulate a return key press
        var shouldReturn = currentTextField?.delegate?.textFieldShouldReturn?(currentTextField!)
        
        // If delegate never implemented should return, then default to true
        shouldReturn = (shouldReturn == nil) ? true : shouldReturn!
        if shouldReturn! {
            // If delegate allow textfield to return, then resign as first responder
            currentTextField?.resignFirstResponder()
        }
    }
    
    // MARK: - Text field relation
    
    weak var currentTextField: UITextField?
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}

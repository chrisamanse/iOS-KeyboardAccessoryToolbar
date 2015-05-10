//
//  ViewController.swift
//  KeyboardAccessoryToolbar
//
//  Created by Chris Amanse on 5/10/15.
//  Copyright (c) 2015 Joe Christopher Paul Amanse. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var textField: UITextField!
    
    // Recycle toolbar for other text fields for less memory consumption
    private lazy var accessoryToolbar = KeyboardAccessoryToolbar()
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        // Set to specific text field
        if textField == self.textField {
            
            // Set to text field if not yet added
            if textField.inputAccessoryView == nil {
                textField.inputAccessoryView = accessoryToolbar
            }
            
            // Set toolbar's current text field to active text field
            accessoryToolbar.currentTextField = textField
        }
        
        return true
    }
}


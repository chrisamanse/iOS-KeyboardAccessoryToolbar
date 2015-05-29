# KeyboardAccessoryToolbar

A simple keyboard accessory toolbar for iOS implemented in Swift.
![](./Images/AppPreview.png)

## Installation

Simply add KeyboardAccessoryToolbar.swift in your project.

## Usage

```swift
extension ViewController: UITextFieldDelegate {
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        // Set to specific text field
        if textField == self.textField {
            // Set toolbar's current view to active text field
            // This will also set the view's input accessory view to accessory toolbar
            accessoryToolbar.currentView = textField
        }

        return true
    }
}  
```
## License

Copyright (c) 2015 Joe Christopher Paul Amanse. This software is licensed under the [MIT License](./LICENSE.md)


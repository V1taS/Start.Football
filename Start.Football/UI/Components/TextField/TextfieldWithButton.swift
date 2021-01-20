//
//  TextfieldWithButton.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 20.01.2021.
//

import SwiftUI

struct TextfieldWithButton: UIViewRepresentable {
    
    let placeholder: String
    @Binding var text: String
    var font: UIFont
    var foregroundColor: UIColor
    var keyType: UIKeyboardType
    var isSecureText: Bool
    
    func makeUIView(context: Context) -> UITextField {
        let textfield = UITextField()
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: textfield.frame.size.width, height: 44))
        let doneButton = UIBarButtonItem(title: "Готово", style: .done, target: self, action: #selector(textfield.doneButtonTapped(button:)))
        let flexButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let color = UIColor.inactive
        
        textfield.keyboardType = keyType
        textfield.textColor = foregroundColor
        textfield.font = font
        textfield.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor : color])
        textfield.isSecureTextEntry = isSecureText
        
        doneButton.tintColor = .secondaryColor
        toolBar.items = [flexButton, doneButton]
        toolBar.setItems([flexButton, doneButton], animated: true)
        textfield.inputAccessoryView = toolBar
        return textfield
    }
    
    func updateUIView(_ uiView: UITextField, context: Context) {
        uiView.text = text
    }
}

extension  UITextField{
    @objc func doneButtonTapped(button:UIBarButtonItem) -> Void {
        self.resignFirstResponder()
    }
    
}

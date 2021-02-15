//
//  TextfieldWithButton.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 20.01.2021.
//

import SwiftUI
import Combine

struct TextFieldUIKit: UIViewRepresentable {
    
    private var textField = UITextField()
    let placeholder: String
    @Binding var text: String
    var font: UIFont
    var foregroundColor: UIColor
    var keyType: UIKeyboardType
    var isSecureText: Bool
    var textAlignment: NSTextAlignment
    var limitLength: Int
    
    init(placeholder: String,
         text: Binding<String>,
         font: UIFont,
         foregroundColor: UIColor,
         keyType: UIKeyboardType,
         isSecureText: Bool,
         textAlignment: NSTextAlignment,
         limitLength: Int) {
        self.placeholder = placeholder
        self._text = text
        self.font = font
        self.foregroundColor = foregroundColor
        self.keyType = keyType
        self.isSecureText = isSecureText
        self.textAlignment = textAlignment
        self.limitLength = limitLength
    }
    
    func makeUIView(context: Context) -> UITextField {
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: textField.frame.size.width, height: 44))
        let doneButton = UIBarButtonItem(title: "Готово", style: .done, target: self, action: #selector(textField.doneButtonTapped(button:)))
        let flexButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        textField.delegate = context.coordinator
        textField.keyboardType = keyType
        textField.textColor = foregroundColor
        textField.font = font
        textField.textAlignment = textAlignment
        textField.attributedPlaceholder = NSAttributedString(string: placeholder)
        textField.autocorrectionType = .no
        textField.isSecureTextEntry = isSecureText
        
        doneButton.tintColor = .secondaryColor
        toolBar.items = [flexButton, doneButton]
        toolBar.setItems([flexButton, doneButton], animated: true)
        textField.inputAccessoryView = toolBar
        return textField
    }
    
    func updateUIView(_ uiView: UITextField, context: Context) {
        uiView.text = text
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(textField: self.textField, text: self._text, limitLength: limitLength)
    }
    
    class Coordinator: NSObject, UITextFieldDelegate {
        private var dispose = Set<AnyCancellable>()
        private var limitLength: Int
        @Binding var text: String
        
        init(textField: UITextField,
             text: Binding<String>,
             limitLength: Int) {
            self._text = text
            self.limitLength = limitLength
            super.init()
            
            NotificationCenter.default
                .publisher(for: UITextField.textDidChangeNotification, object: textField)
                .compactMap { $0.object as? UITextField }
                .compactMap { $0.text }
                .receive(on: RunLoop.main)
                .assign(to: \.text, on: self)
                .store(in: &dispose)
        }
        
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            textField.resignFirstResponder()
            return true
        }
        
        func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

            let currentCharacterCount = textField.text?.count ?? 0
            if range.length + range.location > currentCharacterCount {
                return false
            }
            let newLength = currentCharacterCount + string.count - range.length
            return newLength <= limitLength
        }
    }
}

extension  UITextField {
    @objc func doneButtonTapped(button:UIBarButtonItem) -> Void {
        self.endEditing(true)
    }
}

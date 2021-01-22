//
//  TextView.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 18.01.2021.
//

import SwiftUI

struct TextView: UIViewRepresentable {
    
    let placeholder: String
    @Binding var text: String
    
    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: textView.frame.size.width, height: 44))
        let doneButton = UIBarButtonItem(title: "Готово", style: .done, target: self, action: #selector(textView.doneButtonTapped(button:)))
        let flexButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)

        textView.delegate = context.coordinator
        
        textView.font = UIFont.event.robotoRegular18!
        textView.textColor = UIColor.inactive
        textView.autocapitalizationType = .sentences
        textView.isSelectable = true
        textView.isUserInteractionEnabled = true
        textView.autocorrectionType = .no
        
        doneButton.tintColor = .secondaryColor
        toolBar.items = [flexButton, doneButton]
        toolBar.setItems([flexButton, doneButton], animated: true)
        textView.inputAccessoryView = toolBar
        
        return textView
    }
    
    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.text = text
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator($text, placeholder: placeholder)
    }
    
    class Coordinator: NSObject, UITextViewDelegate {
        var text: Binding<String>
        var placeholder: String
        
        init(_ text: Binding<String>, placeholder: String) {
            self.text = text
            self.placeholder = placeholder
        }
        
        func textViewDidChange(_ textView: UITextView) {
            self.text.wrappedValue = textView.text
        }
        
        func textViewDidBeginEditing(_ textView: UITextView) {
            if textView.textColor == UIColor.inactive {
                textView.text = nil
                textView.textColor = .secondaryColor
            }
        }
        
        func textViewDidEndEditing(_ textView: UITextView) {
            if textView.text.isEmpty {
                textView.text = placeholder
                textView.textColor = UIColor.inactive
            }
        }
    }
}

extension  UITextView {
    @objc func doneButtonTapped(button:UIBarButtonItem) -> Void {
        self.endEditing(true)
    }
    
}

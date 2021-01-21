//
//  PasswordTextFieldView.swift.swift
//  Start.Football
//
//  Created by Виталий Сосин on 02.12.2020.
//

import SwiftUI

struct PasswordTextFieldView: View {
    
    let height = UIScreen.screenHeight
    let width = UIScreen.screenWidth
    
    @Binding var text: String
    var success: Bool
    @State var showPassword = false
    let placeholder: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Пароль")
                .foregroundColor(Color(success ? .defaultColor : .error))
                .font(Font.event.robotoMedium14)
                .padding(.bottom, UIScreen.screenHeight * Size.shared.getAdaptSizeHeight(px: 18))
            
            HStack {
                Image("passwordTF")
                    .renderingMode(.template)
                    .foregroundColor(text.isEmpty ? .defaultColor : .secondaryColor)
                
                if showPassword {
                    TextFieldUIKit(placeholder: placeholder,
                                        text: $text,
                                        font: UIFont.event.robotoMedium16!,
                                        foregroundColor: .secondaryColor,
                                        keyType: .default,
                                        isSecureText: false)
                        .frame(height: 30)
                } else {
                    TextFieldUIKit(placeholder: placeholder,
                                        text: $text,
                                        font: UIFont.event.robotoMedium16!,
                                        foregroundColor: .secondaryColor,
                                        keyType: .default,
                                        isSecureText: true)
                        .frame(height: 30)
                }
                
                Image(showPassword ? "eye.slash" : "eye")
                    .onTapGesture { showPassword.toggle() }
                
            } .padding(.bottom, UIScreen.screenHeight * Size.shared.getAdaptSizeHeight(px: 11))
            
            Color(success ? .dividerColor : .error)
                .frame(width: width * Size.shared.getAdaptSizeWidth(px: 270),
                       height: height * Size.shared.getAdaptSizeHeight(px: 2))
        }
    }
}

struct PasswordTextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        PasswordTextFieldView(text: .constant("Placeholder"),
                              success: false,
                              placeholder: "Placeholder")
    }
}

//
//  LoginTextFieldView.swift
//  Start.Football
//
//  Created by Виталий Сосин on 02.12.2020.
//

import SwiftUI

struct LoginTextFieldView: View {
    
    let height = UIScreen.screenHeight
    let width = UIScreen.screenWidth
    
    @Binding var text: String
    var success: Bool
    
    let title: String
    let icon: String
    let placeholder: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(title)
                .foregroundColor(success ? .defaultColor : .error)
                .font(Font.event.robotoMedium14)
                .padding(.bottom, UIScreen.screenHeight * Size.shared.getAdaptSizeHeight(px: 18))
            
            HStack {
                Image(icon)
                    .renderingMode(.template)
                    .foregroundColor(text.isEmpty ? .defaultColor : .secondaryColor)
                
                TextfieldWithButton(placeholder: placeholder,
                                    text: $text,
                                    font: UIFont.event.robotoMedium16!,
                                    foregroundColor: .secondaryColor,
                                    keyType: .default,
                                    isSecureText: false)
                    .frame(height: 30)
                
                Image("itsOk")
                    .renderingMode(.template)
                    .foregroundColor(.error)
                    .opacity(success ? 0 : 1)
            } .padding(.bottom, UIScreen.screenHeight * Size.shared.getAdaptSizeHeight(px: 11))
            
            Color(success ? .dividerColor : .error)
                .frame(width: width * Size.shared.getAdaptSizeWidth(px: 270),
                       height: height * Size.shared.getAdaptSizeHeight(px: 2))
        }
    }
}

struct LoginTextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        LoginTextFieldView(text: .constant("Placeholder"),
                           success: false,
                           title: "Логин или Email",
                           icon: "login",
                           placeholder: "Placeholder")
    }
}

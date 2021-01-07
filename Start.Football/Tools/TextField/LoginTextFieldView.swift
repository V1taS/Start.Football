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
    @Binding var success: Bool
    
    let title: String
    let icon: String
    let placeholder: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(title)
                .foregroundColor(.defaultColor)
                .font(Font.event.robotoMedium14)
                .padding(.bottom, UIScreen.screenHeight * Size.shared.getAdaptSizeHeight(px: 18))
            
            HStack {
                Image(icon)
                    .renderingMode(.template)
                    .foregroundColor(text.isEmpty ? .defaultColor : .secondaryColor)
                
                TextField(placeholder, text: $text)
                    .foregroundColor(.secondaryColor)
                    .font(Font.event.robotoMedium16)
                    .keyboardType(.default)
                
                Image("itsOk")
                    .opacity(success ? 1 : 0)
            } .padding(.bottom, UIScreen.screenHeight * Size.shared.getAdaptSizeHeight(px: 11))
            
            Color(success ? .primaryColor : .dividerColor)
                .frame(width: width * Size.shared.getAdaptSizeWidth(px: 327),
                       height: height * Size.shared.getAdaptSizeHeight(px: 2))
        }
    }
}

struct LoginTextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        LoginTextFieldView(text: .constant("Placeholder"),
                           success: .constant(true),
                           title: "Логин или Email",
                           icon: "login",
                           placeholder: "Placeholder")
    }
}

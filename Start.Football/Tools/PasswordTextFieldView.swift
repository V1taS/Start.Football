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
    @Binding var success: Bool
    @State var showPassword = false
    let placeholder: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Пароль")
                .foregroundColor(Color(success ? #colorLiteral(red: 0.5529411765, green: 0.568627451, blue: 0.6666666667, alpha: 1) : #colorLiteral(red: 1, green: 0.2784313725, blue: 0.2274509804, alpha: 1)))
                .font(Font.event.robotoMedium14)
                .padding(.bottom, UIScreen.screenHeight * Size.shared.getAdaptSizeHeight(px: 18))
            
            HStack {
                Image("passwordTF")
                
                if showPassword {
                    TextField(placeholder, text: $text)
                        .foregroundColor(Color(success ? #colorLiteral(red: 0.262745098, green: 0.2901960784, blue: 0.3960784314, alpha: 1) : #colorLiteral(red: 1, green: 0.2784313725, blue: 0.2274509804, alpha: 1)))
                        .font(Font.event.robotoMedium16)
                        .keyboardType(.default)
                } else {
                    SecureField(placeholder, text: $text)
                        .foregroundColor(Color(success ? #colorLiteral(red: 0.262745098, green: 0.2901960784, blue: 0.3960784314, alpha: 1) : #colorLiteral(red: 1, green: 0.2784313725, blue: 0.2274509804, alpha: 1)))
                        .font(Font.event.robotoMedium16)
                        .keyboardType(.default)
                }
                
                Image(showPassword ? "eye.slash" : "eye")
                    .onTapGesture { showPassword.toggle() }
                
            } .padding(.bottom, UIScreen.screenHeight * Size.shared.getAdaptSizeHeight(px: 11))
            
            Color(success ? #colorLiteral(red: 0.9137254902, green: 0.9137254902, blue: 0.9254901961, alpha: 1) : #colorLiteral(red: 1, green: 0.2784313725, blue: 0.2274509804, alpha: 1))
                .frame(width: width * Size.shared.getAdaptSizeWidth(px: 327),
                       height: height * Size.shared.getAdaptSizeHeight(px: 2))
        } .padding(.horizontal, width * Size.shared.getAdaptSizeWidth(px: 24))
    }
}

struct PasswordTextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        PasswordTextFieldView(text: .constant("Placeholder"),
                              success: .constant(false),
                              placeholder: "Placeholder")
    }
}

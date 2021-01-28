//
//  LoginTextFieldView.swift
//  Start.Football
//
//  Created by Виталий Сосин on 02.12.2020.
//

import SwiftUI

struct LoginTextFieldView: View {
    
    @Binding var text: String
    var success: Bool
    let title: String
    let icon: String
    let placeholder: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            header
            
            HStack(spacing: 10) {
                iconView
                textField
            }
            divider
                .padding(.top, 7)
        }
    }
}


// MARK: UI
private extension LoginTextFieldView {
    private var header: AnyView {
        AnyView(
            Text(title)
                .foregroundColor(success ? .defaultColor : .error)
                .font(Font.event.robotoMedium14)
                .padding(.bottom, 16)
        )
    }
}

private extension LoginTextFieldView {
    private var iconView: AnyView {
        AnyView(
            Image(icon)
                .renderingMode(.template)
                .foregroundColor(text.isEmpty ?
                                    .defaultColor :
                                    .secondaryColor)
        )
    }
}

private extension LoginTextFieldView {
    private var textField: AnyView {
        AnyView(
            TextFieldUIKit(placeholder: placeholder,
                           text: $text,
                           font: UIFont.event.robotoMedium16!,
                           foregroundColor: .secondaryColor,
                           keyType: .default,
                           isSecureText: false)
                .frame(height: 24)
        )
    }
}

private extension LoginTextFieldView {
    private var divider: AnyView {
        AnyView(
            Color(success ? .dividerColor : .error)
                .frame(width: UIScreen.screenWidth * Size.shared.getAdaptSizeWidth(px: 327),
                       height: UIScreen.screenHeight *
                        Size.shared.getAdaptSizeHeight(px: 2))
        )
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

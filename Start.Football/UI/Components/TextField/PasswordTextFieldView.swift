//
//  PasswordTextFieldView.swift.swift
//  Start.Football
//
//  Created by Виталий Сосин on 02.12.2020.
//

import SwiftUI

struct PasswordTextFieldView: View {
    
    @Binding var text: String
    var success: Bool
    @State var showPassword = false
    let placeholder: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            header
            
            HStack {
                iconTextField
                textField
                eyeView
            }
            .padding(.bottom, 11)
            divider
        }
    }
}


// MARK: UI
private extension PasswordTextFieldView {
    private var header: AnyView {
        AnyView(
            Text("Пароль")
                .foregroundColor(Color(success ? .defaultColor : .error))
                .font(Font.event.robotoMedium14)
                .padding(.bottom, 18)
        )
    }
}

private extension PasswordTextFieldView {
    private var iconTextField: AnyView {
        AnyView(
            Image("passwordTF")
                .renderingMode(.template)
                .foregroundColor(text.isEmpty ? .defaultColor : .secondaryColor)
        )
    }
}

private extension PasswordTextFieldView {
    private var textField: AnyView {
        AnyView(
            VStack(spacing: 0) {
                if showPassword {
                    textFieldUsual
                } else {
                    textFieldSecure
                }
            }
        )
    }
}

private extension PasswordTextFieldView {
    private var textFieldUsual: AnyView {
        AnyView(
            VStack(spacing: 0) {
                TextFieldUIKit(placeholder: placeholder,
                               text: $text,
                               font: UIFont.event.robotoMedium16!,
                               foregroundColor: .secondaryColor,
                               keyType: .default,
                               isSecureText: false)
                    .frame(height: 30)
            }
        )
    }
}

private extension PasswordTextFieldView {
    private var textFieldSecure: AnyView {
        AnyView(
            TextFieldUIKit(placeholder: placeholder,
                           text: $text,
                           font: UIFont.event.robotoMedium16!,
                           foregroundColor: .secondaryColor,
                           keyType: .default,
                           isSecureText: true)
                .frame(height: 30)
        )
    }
}

private extension PasswordTextFieldView {
    private var eyeView: AnyView {
        AnyView(
            Image(showPassword ? "eye.slash" : "eye")
                .onTapGesture {
                    showPasswordToggle()
                }
        )
    }
}

private extension PasswordTextFieldView {
    private var divider: AnyView {
        AnyView(
            Color(success ? .dividerColor : .error)
                .frame(width: UIScreen.screenWidth *
                        Size.shared.getAdaptSizeWidth(px: 327),
                       height:  UIScreen.screenHeight *
                        Size.shared.getAdaptSizeHeight(px: 2))
        )
    }
}


// MARK: Actions
private extension PasswordTextFieldView {
    private func showPasswordToggle() {
        showPassword.toggle()
    }
}

struct PasswordTextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        PasswordTextFieldView(text: .constant("Placeholder"),
                              success: false,
                              placeholder: "Placeholder")
    }
}

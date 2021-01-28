//
//  TextfieldOneLineView.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 07.01.2021.
//

import SwiftUI

struct TextfieldOneLineView: View {
    
    let height = UIScreen.screenHeight
    let width = UIScreen.screenWidth
    
    @Binding var text: String
    let title: String
    let icon: String
    let iconShow: Bool
    let placeholder: String
    let keyboardType: UIKeyboardType
    var success: Bool
    
    var body: some View {
        VStack(spacing: 0) {
            VStack(alignment: .leading, spacing: 0) {
                header
                
                HStack(spacing: 10) {
                    iconView
                    textField
                    Spacer()
                    
                }
                .padding(.bottom, 8)
            }
            divider
        }
    }
}


// MARK: UI
private extension TextfieldOneLineView {
    private var header: AnyView {
        AnyView(
            Text(title)
                .foregroundColor(.defaultColor)
                .font(Font.event.robotoRegular14)
                .padding(.bottom, 16)
        )
    }
}

private extension TextfieldOneLineView {
    private var textField: AnyView {
        AnyView(
            TextFieldUIKit(placeholder: placeholder,
                           text: $text,
                           font: UIFont.event.robotoRegular18!,
                           foregroundColor: .secondaryColor,
                           keyType: keyboardType,
                           isSecureText: false)
                .frame(width: 270, height: 30)
        )
    }
}

private extension TextfieldOneLineView {
    private var iconView: AnyView {
        AnyView(
            VStack(spacing: 0) {
                if iconShow {
                    Image(icon)
                    
                }
            }
        )
    }
}

private extension TextfieldOneLineView {
    private var divider: AnyView {
        AnyView(
            VStack(alignment: .leading, spacing: 0) {
                Color(success ? .dividerColor : .error)
                    .frame(width: width * Size.shared.getAdaptSizeWidth(px: 327),
                           height: height * Size.shared.getAdaptSizeHeight(px: 2))
            }
        )
    }
}

struct TextfieldOneLineView_Previews: PreviewProvider {
    static var previews: some View {
        TextfieldOneLineView(text: .constant(""),
                             title: "Название",
                             icon: "locationCreateGame",
                             iconShow: true,
                             placeholder: "Введите название",
                             keyboardType: .default, success: true)
    }
}

//
//  TextFieldView.swift
//  Start.Football
//
//  Created by Виталий Сосин on 23.11.2020.
//

import SwiftUI

struct TextFieldView: View {
    
    let title: String
    let secureField: Bool
    let placeholder: String
    let height = UIScreen.screenHeight
    let width = UIScreen.screenWidth
    @Binding var text: String
    @Binding var success: Bool
    @State var showPassword = false
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 3)
                .stroke(success ? Color.black : .red, lineWidth: 1)
                .padding(.horizontal, width * Size.shared.getAdaptSizeWidth(px: 16))
                .frame(height: height * Size.shared.getAdaptSizeHeight(px: 52))
            ZStack {
                Text(title)
                    .font(Font.event.robotoMedium14)
                    .padding(.horizontal, width * Size.shared.getAdaptSizeWidth(px: 5))
                    .foregroundColor(success ? Color(#colorLiteral(red: 0.5529411765, green: 0.568627451, blue: 0.6666666667, alpha: 1)) : Color.red)
                    .background(Color.whiteColor)
                    .offset(x: -(width * Size.shared.getAdaptSizeWidth(px: 45)),
                            y: -(height * Size.shared.getAdaptSizeHeight(px: 26)))
            } .frame(minWidth: width * Size.shared.getAdaptSizeWidth(px: 30),
                     maxWidth: width * Size.shared.getAdaptSizeWidth(px: 228),
                     alignment: .leading)
            if secureField {
                if showPassword {
                    ZStack {
                        Image("eye")
                            .imageScale(.medium)
                            .foregroundColor(.whiteColor)
                    }
                    .offset(x: width * Size.shared.getAdaptSizeWidth(px: 148))
                    .onTapGesture {
                        showPassword.toggle()
                    }
                } else {
                    ZStack {
                        Image("eye.slash")
                            .imageScale(.medium)
                            .foregroundColor(.whiteColor)
                    }
                    .offset(x: width * Size.shared.getAdaptSizeWidth(px: 148))
                    .onTapGesture {
                        showPassword.toggle()
                    }
                }
            }
            
            if secureField {
                if showPassword {
                    TextField(placeholder, text: $text)
                        .foregroundColor(.black)
                        .font(Font.event.robotoRegular16)
                        .keyboardType(.default)
                        .frame(width: width * Size.shared.getAdaptSizeWidth(px: 260),
                               height: 52, alignment: .leading)
                        .offset(x: -(width * Size.shared.getAdaptSizeWidth(px: 25)))
                } else {
                    SecureField(placeholder, text: $text)
                        .foregroundColor(.black)
                        .font(Font.event.robotoRegular16)
                        .keyboardType(.default)
                        .frame(width: width * Size.shared.getAdaptSizeWidth(px: 260),
                               height: 52, alignment: .leading)
                        .offset(x: -(width * Size.shared.getAdaptSizeWidth(px: 25)))
                }
            } else {
                TextField(placeholder, text: $text)
                    .foregroundColor(.black)
                    .font(Font.event.robotoRegular16)
                    .keyboardType(.default)
                    .frame(width: width * Size.shared.getAdaptSizeWidth(px: 260),
                           height: 52, alignment: .leading)
                    .offset(x: -(width * Size.shared.getAdaptSizeWidth(px: 25)))
            }
        }
    }
}

struct TextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldView(title: "Name",
                      secureField: true,
                      placeholder: "Sosin Vitalii",
                      text: .constant(""),
                      success: .constant(true))
    }
}

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
    let height: CGFloat
    let width: CGFloat
    @Binding var text: String
    @Binding var success: Bool
    @State var showPassword = false
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 3)
                .stroke(success ? Color.black : .red, lineWidth: 1)
                .padding(.horizontal, 16)
                .frame(height: height * 0.0639)
            ZStack {
                Text(title)
                    .font(Font.event.robotoMedium14)
                    .padding(.horizontal, 5)
                    .foregroundColor(success ? Color(#colorLiteral(red: 0.5529411765, green: 0.568627451, blue: 0.6666666667, alpha: 1)) : Color.red)
                    .background(Color.white)
                    .offset(x: -(width * 0.1208), y: -(height * 0.0319))
            } .frame(minWidth: width * 0.0725, maxWidth: width * 0.6039, alignment: .leading)
            if secureField {
                ZStack {
                    Image("eye")
                        .imageScale(.medium)
                        .foregroundColor(.white)
                        .overlay(
                            Group {
                                if showPassword {
                                    Image("eye.slash")
                                        .imageScale(.medium)
                                        .foregroundColor(.white)
                                }
                            }
                        )
                }
                .offset(x: width * 0.3865)
                .onTapGesture {
                    showPassword.toggle()
                }
            }
            
            if secureField {
                if showPassword {
                    TextField(placeholder, text: $text)
                        .foregroundColor(.black)
                        .font(Font.event.robotoRegular16)
                        .keyboardType(.default)
                        .offset(x: -(width * 0.0845))
                        .frame(minWidth: width * 0.0725, maxWidth: width * 0.6522, alignment: .leading)
                } else {
                    SecureField(placeholder, text: $text)
                        .foregroundColor(.black)
                        .font(Font.event.robotoRegular16)
                        .keyboardType(.default)
                        .offset(x: -(width * 0.0845))
                        .frame(minWidth: width * 0.0725, maxWidth: width * 0.6522, alignment: .leading)
                }
            } else {
                TextField(placeholder, text: $text)
                    .foregroundColor(.black)
                    .font(Font.event.robotoRegular16)
                    .keyboardType(.default)
                    .offset(x: -(width * 0.0845))
                    .frame(minWidth: width * 0.0725, maxWidth: width * 0.6522, alignment: .leading)
            }
        }
    }
}

struct TextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldView(title: "",
                      secureField: false,
                      placeholder: "",
                      height: 12,
                      width: 12,
                      text: .constant(""),
                      success: .constant(false))
    }
}

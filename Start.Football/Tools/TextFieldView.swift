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
    @Binding var text: String
    @Binding var success: Bool
    @State var showPassword = false
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 3)
                .stroke(success ? Color.black : .red, lineWidth: 1)
                .padding(.horizontal, 16)
                .frame(height: 52)
            ZStack {
                Text(title)
                    .font(Font.custom("Roboto", size: 14))
                    .padding(.horizontal, 5)
                    .foregroundColor(success ? Color(#colorLiteral(red: 0.5529411765, green: 0.568627451, blue: 0.6666666667, alpha: 1)) : Color.red)
                    .background(Color.white)
                    .offset(x: -50, y: -26)
            } .frame(minWidth: 30, maxWidth: 250, alignment: .leading)
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
                .offset(x: 160)
                .onTapGesture {
                    showPassword.toggle()
                }
            }
            
            if secureField {
                if showPassword {
                    TextField(placeholder, text: $text)
                        .foregroundColor(.black)
                        .font(Font.custom("Roboto", size: 16))
                        .keyboardType(.default)
                        .offset(x: -35)
                        .frame(minWidth: 30, maxWidth: 270, alignment: .leading)
                } else {
                    SecureField(placeholder, text: $text)
                        .foregroundColor(.black)
                        .font(Font.custom("Roboto", size: 16))
                        .keyboardType(.default)
                        .offset(x: -35)
                        .frame(minWidth: 30, maxWidth: 270, alignment: .leading)
                }
            } else {
                TextField(placeholder, text: $text)
                    .foregroundColor(.black)
                    .font(Font.custom("Roboto", size: 16))
                    .keyboardType(.default)
                    .offset(x: -35)
                    .frame(minWidth: 30, maxWidth: 270, alignment: .leading)
            }
        }
    }
}

struct TextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldView(title: "Имя",
                      secureField: true,
                      placeholder: "Player",
                      text: .constant(""),
                      success: .constant(false))
    }
}

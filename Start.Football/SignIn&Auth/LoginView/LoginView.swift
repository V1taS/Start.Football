//
//  LoginView.swift
//  Start.Football
//
//  Created by Виталий Сосин on 23.11.2020.
//

import SwiftUI

struct LoginView: View {
    
    @ObservedObject var viewModel = LoginViewModel()
    
    var body: some View {
        VStack {
            Text("Вход в аккаунт")
                .font(Font.custom("Roboto", size: 32))
                .padding(.top, 76)
            
            VStack(spacing: 24) {
                TextFieldView(title: "E-mail",
                              secureField: false,
                              placeholder: "ronaldo@mail.ru",
                              text: $viewModel.mail,
                              success: $viewModel.mailSuccess)
                
                TextFieldView(title: "Пароль",
                              secureField: true,
                              placeholder: "878ujss2",
                              text: $viewModel.password,
                              success: $viewModel.passwordSuccess)
                
                Button(action: {}) {
                    ButtonView(background: #colorLiteral(red: 0.1294117647, green: 0.6117647059, blue: 0.4196078431, alpha: 1),
                               text: "Войти")
                }
            } .padding(.top, 156)
            
            Spacer()
            
            Button(action: {}) {
                Text("Не могу войти")
                    .font(Font.custom("Roboto", size: 16))
                    .foregroundColor(Color(#colorLiteral(red: 0.1294117647, green: 0.6117647059, blue: 0.4196078431, alpha: 1)))
            } .padding(.bottom, 32)
            
            Divider()
                .padding(.bottom, 32)
            
            Button(action: {}) {
                Text("Забыли пароль?")
                    .font(Font.custom("Roboto", size: 16))
                    .foregroundColor(Color(#colorLiteral(red: 0.1294117647, green: 0.6117647059, blue: 0.4196078431, alpha: 1)))
            } .padding(.bottom, 32)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

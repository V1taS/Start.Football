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
            GeometryReader { geometry in
                VStack {
                    Text("Вход в аккаунт")
                        .font(Font.event.robotoRegular32)
                        .padding(.top, geometry.size.height * 0.0934)
                    
                    VStack(spacing: geometry.size.height * 0.0295) {
                        TextFieldView(title: "E-mail",
                                      secureField: false,
                                      placeholder: "ronaldo@mail.ru",
                                      height: geometry.size.height,
                                      width: geometry.size.width,
                                      text: $viewModel.mail,
                                      success: $viewModel.mailSuccess)
                        
                        TextFieldView(title: "Пароль",
                                      secureField: true,
                                      placeholder: "• • • • • • • •",
                                      height: geometry.size.height,
                                      width: geometry.size.width,
                                      text: $viewModel.password,
                                      success: $viewModel.passwordSuccess)
                        
                                        Button(action: {}) {
                                            ButtonView(background: #colorLiteral(red: 0.1294117647, green: 0.6117647059, blue: 0.4196078431, alpha: 1),
                                                       text: "Войти",
                                                       height: geometry.size.height)
                                        }
                    } .padding(.top, geometry.size.height * 0.1916)
                    
                    Spacer()
                    
                    Button(action: {}) {
                        Text("Не могу войти")
                            .font(Font.event.robotoRegular16)
                            .foregroundColor(Color(#colorLiteral(red: 0.1294117647, green: 0.6117647059, blue: 0.4196078431, alpha: 1)))
                    } .padding(.bottom, geometry.size.height * 0.0393)
                    
                    Divider()
                        .padding(.bottom, geometry.size.height * 0.0393)
                    
                    Button(action: {}) {
                        Text("Забыли пароль?")
                            .font(Font.event.robotoRegular16)
                            .foregroundColor(Color(#colorLiteral(red: 0.1294117647, green: 0.6117647059, blue: 0.4196078431, alpha: 1)))
                    } .padding(.bottom, geometry.size.height * 0.0393)
                }
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

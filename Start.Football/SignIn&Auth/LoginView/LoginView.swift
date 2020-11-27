//
//  LoginView.swift
//  Start.Football
//
//  Created by Виталий Сосин on 23.11.2020.
//

import SwiftUI

struct LoginView: View {
    
    @ObservedObject var viewModel = LoginViewModel()
    @Environment(\.viewController) private var viewControllerHolder: UIViewController?
    private var viewController: UIViewController? {
        self.viewControllerHolder!
    }
    
    var body: some View {
        VStack {
            GeometryReader { geometry in
                VStack {
                    Text("Вход в аккаунт")
                        .foregroundColor(Color(#colorLiteral(red: 0.262745098, green: 0.2901960784, blue: 0.3960784314, alpha: 1)))
                        .font(Font.event.robotoRegular32)
                        .padding(.top, geometry.size.height * Size.shared.getAdaptSizeHeight(px: 32))
                    
                    VStack(spacing: geometry.size.height * Size.shared.getAdaptSizeHeight(px: 24)) {
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
                        
                        Button(action: {
                            self.viewController?.present(style: .fullScreen) {
                                TabViewApp()
                            }
                        }) {
                            ButtonView(background: #colorLiteral(red: 0.1294117647, green: 0.6117647059, blue: 0.4196078431, alpha: 1),
                                       text: "Войти",
                                       height: geometry.size.height,
                                       width: geometry.size.width)
                        }
                    } .padding(.top, geometry.size.height * Size.shared.getAdaptSizeHeight(px: 156))
                    
                    Spacer()
                    
                    Button(action: {}) {
                        Text("Не могу войти")
                            .font(Font.event.robotoRegular16)
                            .foregroundColor(Color(#colorLiteral(red: 0.1294117647, green: 0.6117647059, blue: 0.4196078431, alpha: 1)))
                    } .padding(.bottom, geometry.size.height * Size.shared.getAdaptSizeHeight(px: 32))
                    
                    Divider()
                        .padding(.bottom, geometry.size.height * Size.shared.getAdaptSizeHeight(px: 32))
                    
                    Button(action: {}) {
                        Text("Забыли пароль?")
                            .font(Font.event.robotoRegular16)
                            .foregroundColor(Color(#colorLiteral(red: 0.1294117647, green: 0.6117647059, blue: 0.4196078431, alpha: 1)))
                    } .padding(.bottom, geometry.size.height * Size.shared.getAdaptSizeHeight(px: 32))
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

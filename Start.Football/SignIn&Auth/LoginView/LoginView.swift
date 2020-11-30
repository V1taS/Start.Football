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
            Text("Вход в аккаунт")
                .foregroundColor(Color(#colorLiteral(red: 0.262745098, green: 0.2901960784, blue: 0.3960784314, alpha: 1)))
                .font(Font.event.robotoRegular32)
                .padding(.top, UIScreen.screenHeight * Size.shared.getAdaptSizeHeight(px: 20))
            
            VStack(spacing: UIScreen.screenHeight * Size.shared.getAdaptSizeHeight(px: 32)) {
                TextFieldView(title: "E-mail",
                              secureField: false,
                              placeholder: "ronaldo@mail.ru",
                              text: $viewModel.mail,
                              success: $viewModel.mailSuccess)
                
                TextFieldView(title: "Пароль",
                              secureField: true,
                              placeholder: "• • • • • • • •",
                              text: $viewModel.password,
                              success: $viewModel.passwordSuccess)
                
                Button(action: {
                    self.viewController?.present(style: .fullScreen) {
                        TabViewApp()
                    }
                }) {
                    ButtonView(background: #colorLiteral(red: 0.1294117647, green: 0.6117647059, blue: 0.4196078431, alpha: 1),
                               text: "Войти")
                }
                
                Button(action: {}) {
                    Text("Не могу войти")
                        .font(Font.event.robotoRegular16)
                        .foregroundColor(Color(#colorLiteral(red: 0.1294117647, green: 0.6117647059, blue: 0.4196078431, alpha: 1)))
                }
            } .padding(.top, UIScreen.screenHeight * Size.shared.getAdaptSizeHeight(px: 128))
            
            Spacer()
            
            Divider()
                .padding(.bottom, UIScreen.screenHeight * Size.shared.getAdaptSizeHeight(px: 16))
            
            Button(action: {}) {
                Text("Забыли пароль?")
                    .font(Font.event.robotoRegular16)
                    .foregroundColor(Color(#colorLiteral(red: 0.1294117647, green: 0.6117647059, blue: 0.4196078431, alpha: 1)))
            } .padding(.bottom, UIScreen.screenHeight * Size.shared.getAdaptSizeHeight(px: 16))
        }
        .dismissingKeyboard()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

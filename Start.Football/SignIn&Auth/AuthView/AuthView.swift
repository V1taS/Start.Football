//
//  ContentView.swift
//  Start.Football
//
//  Created by Виталий Сосин on 23.11.2020.
//

import SwiftUI

struct AuthView: View {
    
    let height = UIScreen.screenHeight
    let width = UIScreen.screenWidth
    
    @ObservedObject var viewModel = AuthViewModel()
    @Environment(\.viewController) private var viewControllerHolder: UIViewController?
    private var viewController: UIViewController? {
        self.viewControllerHolder!
    }
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                VStack(alignment: .leading, spacing: height * Size.shared.getAdaptSizeHeight(px: 3)) {
                    Text("Авторизация")
                        .foregroundColor(Color(#colorLiteral(red: 0.262745098, green: 0.2901960784, blue: 0.3960784314, alpha: 1)))
                        .font(Font.event.robotoMedium32)
                    
                    Text("С возвращением, вас не хватало!")
                        .foregroundColor(Color(#colorLiteral(red: 0.262745098, green: 0.2901960784, blue: 0.3960784314, alpha: 1)))
                        .font(Font.event.robotoRegular16)
                    
                }
                .padding(.horizontal, width * Size.shared.getAdaptSizeWidth(px: 24))
                .padding(.top, height * Size.shared.getAdaptSizeHeight(px: 11))
                Spacer()
            }
            
            VStack(spacing: height * Size.shared.getAdaptSizeHeight(px: 40)) {
                
                LoginTextFieldView(text: $viewModel.login,
                                   success: $viewModel.loginSuccess,
                                   title: "Логин или Email",
                                   icon: "login",
                                   placeholder: "Placeholder")
                
                PasswordTextFieldView(text: $viewModel.password,
                                      success: $viewModel.passwordSuccess,
                                      placeholder: "Placeholder")
                
                Button(action: {
                    self.viewController?.present(style: .fullScreen) {
                        SignUpView()
                    }
                }) {
                    ButtonView(background: #colorLiteral(red: 0.6666666667, green: 0.6666666667, blue: 0.6666666667, alpha: 1), text: "Войти")
                }
                
            } .padding(.top, height * Size.shared.getAdaptSizeHeight(px: 37))
            
            HStack {
                Text("Забыли")
                    .foregroundColor(Color(#colorLiteral(red: 0.262745098, green: 0.2901960784, blue: 0.3960784314, alpha: 1)))
                    .font(Font.event.robotoRegular16)
                Button(action: {} ) {
                    Text("пароль?")
                        .foregroundColor(Color(#colorLiteral(red: 0.1294117647, green: 0.6117647059, blue: 0.4196078431, alpha: 1)))
                        .font(Font.event.robotoMedium18)
                }
                
            } .padding(.top, height * Size.shared.getAdaptSizeHeight(px: 33))
            
            Spacer()
            
            HStack {
                Text("Нет аккаунта?")
                    .foregroundColor(Color(#colorLiteral(red: 0.262745098, green: 0.2901960784, blue: 0.3960784314, alpha: 1)))
                    .font(Font.event.robotoRegular16)
                Button(action: {} ) {
                    Text("Зарегистрируйтесь")
                        .foregroundColor(Color(#colorLiteral(red: 0.1294117647, green: 0.6117647059, blue: 0.4196078431, alpha: 1)))
                        .font(Font.event.robotoMedium18)
                }
                
            }
            .padding(.bottom, height * Size.shared.getAdaptSizeHeight(px: 33))
            
            HStack {
                VStack {
                    Divider()
                }
                Text("или")
                    .foregroundColor(Color(#colorLiteral(red: 0.4549019608, green: 0.4549019608, blue: 0.4549019608, alpha: 1)))
                    .font(Font.event.robotoRegular14)
                VStack {
                    Divider()
                }
            }
            .padding(.bottom, height * Size.shared.getAdaptSizeHeight(px: 24))
            
            VStack(spacing: height * Size.shared.getAdaptSizeHeight(px: 16)) {
                Button(action: {} ) {
                    ButtonApple()
                }
                
                Button(action: {} ) {
                    ButtonGoogle()
                }
            }
            .padding(.bottom, height * Size.shared.getAdaptSizeHeight(px: 17))
        } .dismissingKeyboard()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}

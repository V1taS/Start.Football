//
//  AuthView.swift
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
        ZStack {
            Color(.backgroundColor)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 0) {
                HStack {
                    VStack(alignment: .leading, spacing: height * Size.shared.getAdaptSizeHeight(px: 3)) {
                        Text("Авторизация")
                            .foregroundColor(.secondaryColor)
                            .font(Font.event.robotoMedium32)
                        
                        Text("С возвращением, вас не хватало!")
                            .foregroundColor(.desc)
                            .font(Font.event.robotoRegular16)
                        
                    }
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
                        ButtonView(background: .inactive,
                                   textColor: .whiteColor,
                                   borderColor: .inactive,
                                   text: "Войти")
                    }
                    
                } .padding(.top, height * Size.shared.getAdaptSizeHeight(px: 37))
                
                HStack {
                    Text("Забыли")
                        .foregroundColor(.desc)
                        .font(Font.event.robotoRegular16)
                    Button(action: {} ) {
                        Text("пароль?")
                            .foregroundColor(.primaryColor)
                            .font(Font.event.robotoMedium18)
                    }
                    
                } .padding(.top, height * Size.shared.getAdaptSizeHeight(px: 33))
                
                Spacer()
                
                HStack {
                    Text("Нет аккаунта?")
                        .foregroundColor(.desc)
                        .font(Font.event.robotoRegular16)
                    Button(action: {} ) {
                        Text("Зарегистрируйтесь")
                            .foregroundColor(.primaryColor)
                            .font(Font.event.robotoMedium18)
                    }
                    
                }
                .padding(.bottom, height * Size.shared.getAdaptSizeHeight(px: 33))
                
                HStack {
                    VStack {
                        Divider()
                    }
                    Text("или")
                        .foregroundColor(.desc)
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
            }
        }
        .padding(.horizontal, 24)
        .dismissingKeyboard()
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}

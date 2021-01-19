//
//  AuthView.swift
//  Start.Football
//
//  Created by Виталий Сосин on 23.11.2020.
//

import SwiftUI

struct AuthView: View {
    
    private var appBinding: Binding<AppState.AppData>
    init(appBinding: Binding<AppState.AppData>) {
        self.appBinding = appBinding
    }
    @Environment(\.injected) private var injected: DIContainer
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
                    VStack(alignment: .leading, spacing: 3) {
                        Text("Авторизация")
                            .foregroundColor(.secondaryColor)
                            .font(Font.event.robotoMedium32)
                        
                        Text("С возвращением, вас не хватало!")
                            .foregroundColor(.desc)
                            .font(Font.event.robotoRegular16)
                        
                    }
                    .padding(.top, 11)
                    Spacer()
                }
                
                VStack(spacing: 40) {
                    
                    LoginTextFieldView(text: appBinding.signInAuth.login,
                                       success: appBinding.signInAuth.loginSuccess,
                                       title: "Логин или Email",
                                       icon: "login",
                                       placeholder: "Placeholder")
                    
                    PasswordTextFieldView(text: appBinding.signInAuth.password,
                                          success: appBinding.signInAuth.passwordSuccess,
                                          placeholder: "Placeholder")
                    
                    Button(action: {
                        self.viewController?.present(style: .fullScreen) {
                            SignUpView(appBinding: appBinding)
                        }
                    }) {
                        ButtonView(background: .inactive,
                                   textColor: .whiteColor,
                                   borderColor: .inactive,
                                   text: "Войти",
                                   switchImage: false,
                                   image: "")
                    }
                    
                } .padding(.top, 37)
                
                HStack {
                    Text("Забыли")
                        .foregroundColor(.desc)
                        .font(Font.event.robotoRegular16)
                    Button(action: {} ) {
                        Text("пароль?")
                            .foregroundColor(.primaryColor)
                            .font(Font.event.robotoMedium18)
                    }
                    
                }
                .padding(.top, 33)
                
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
                .padding(.bottom, 33)
                
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
                .padding(.bottom, 24)
                
                VStack(spacing: 16) {
                    Button(action: {} ) {
                        ButtonApple()
                    }
                    
                    Button(action: {} ) {
                        ButtonGoogle()
                    }
                }
                .padding(.bottom, 17)
            }
        }
        .padding(.horizontal, 24)
        .dismissingKeyboard()
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView(appBinding: .constant(.init()))
    }
}

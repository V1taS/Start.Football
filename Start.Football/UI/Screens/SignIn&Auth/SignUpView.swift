//
//  SignUpView.swift
//  Start.Football
//
//  Created by Виталий Сосин on 23.11.2020.
//

import SwiftUI

struct SignUpView: View {
    
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
                        Text("Регистрация")
                            .foregroundColor(.secondaryColor)
                            .font(Font.event.robotoMedium32)
                        
                        Text("Создайте аккаунт чтобы продолжить")
                            .foregroundColor(.desc)
                            .font(Font.event.robotoRegular16)
                        
                    }
                    .padding(.top, 11)
                    Spacer()
                }
                
                VStack(spacing: 40) {
                    
                    LoginTextFieldView(text: appBinding.signUpAuth.mail,
                                       success: appBinding.signUpAuth.mailSuccess.wrappedValue,
                                       title: "Email",
                                       icon: "mail",
                                       placeholder: "roman@start.football")
                    
                    LoginTextFieldView(text: appBinding.signUpAuth.login,
                                       success: appBinding.signUpAuth.loginSuccess.wrappedValue,
                                       title: "Логин",
                                       icon: "login",
                                       placeholder: "Roman")
                    
                    PasswordTextFieldView(text: appBinding.signUpAuth.password,
                                          success: appBinding.signUpAuth.passwordSuccess.wrappedValue,
                                          placeholder: "**********")
                    
                    
                    
                }
                .padding(.top, 37)
                
                VStack(alignment: .leading, spacing: 16) {
                    CheckboxFieldView(checked: appBinding.signUpAuth.confidentiality,
                                      text: "Создавая аккаунт вы принимаете правила сервиса и политику конфиденциальности")
                    CheckboxFieldView(checked: appBinding.signUpAuth.receiveNews,
                                      text: "Хочу получать новости на почту")
                }
                .padding(.top, 16)
                
                Spacer()
                
                Button(action: {
                    self.viewController?.present(style: .fullScreen) {
                        PasswordResetView(appBinding: appBinding)
                    }
                }) {
                    ButtonView(background: .primaryColor,
                               textColor: .whiteColor,
                               borderColor: .primaryColor,
                               text: "Зарегистрироваться",
                               switchImage: false,
                               image: "")
                }
                .padding(.bottom, 33)
                
                HStack {
                    Text("Уже есть аккаунт?")
                        .foregroundColor(.desc)
                        .font(Font.event.robotoRegular16)
                    Button(action: {} ) {
                        Text("Войдите")
                            .foregroundColor(.primaryColor)
                            .font(Font.event.robotoMedium18)
                    }
                    
                }
                .padding(.bottom, 17)
            }
        }
        .padding(.horizontal, 24)
        .dismissingKeyboard()
    }
}

struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView(appBinding: .constant(.init()))
    }
}

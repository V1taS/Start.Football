//
//  SignUpView.swift
//  Start.Football
//
//  Created by Виталий Сосин on 23.11.2020.
//

import SwiftUI

struct SignUpView: View {
    
    let height = UIScreen.screenHeight
    let width = UIScreen.screenWidth
    
    @ObservedObject var viewModel = SignUpViewModel()
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
                        Text("Регистрация")
                            .foregroundColor(.secondaryColor)
                            .font(Font.event.robotoMedium32)
                        
                        Text("Создайте аккаунт чтобы продолжить")
                            .foregroundColor(.desc)
                            .font(Font.event.robotoRegular16)
                        
                    }
                    .padding(.horizontal, width * Size.shared.getAdaptSizeWidth(px: 24))
                    .padding(.top, height * Size.shared.getAdaptSizeHeight(px: 11))
                    Spacer()
                }
                
                VStack(spacing: height * Size.shared.getAdaptSizeHeight(px: 40)) {
                    
                    LoginTextFieldView(text: $viewModel.mail,
                                       success: $viewModel.mailSuccess,
                                       title: "Email",
                                       icon: "mail",
                                       placeholder: "roman@start.football")
                    
                    LoginTextFieldView(text: $viewModel.login,
                                       success: $viewModel.loginSuccess,
                                       title: "Логин",
                                       icon: "login",
                                       placeholder: "Roman")
                    
                    PasswordTextFieldView(text: $viewModel.password,
                                          success: $viewModel.passwordSuccess,
                                          placeholder: "**********")
                    
                    
                    
                } .padding(.top, height * Size.shared.getAdaptSizeHeight(px: 37))
                
                VStack(alignment: .leading, spacing: height * Size.shared.getAdaptSizeHeight(px: 16)) {
                    CheckboxFieldView(checked: $viewModel.confidentiality, text: "Создавая аккаунт вы принимаете правила сервиса и политику конфиденциальности")
                    CheckboxFieldView(checked: $viewModel.receiveNews, text: "Хочу получать новости на почту")
                } .padding(.top, height * Size.shared.getAdaptSizeHeight(px: 16))
                
                Spacer()
                
                Button(action: {
                    self.viewController?.present(style: .fullScreen) {
                        PasswordResetView()
                    }
                }) {
                    ButtonView(background: .primaryColor,
                               textColor: .whiteColor,
                               borderColor: .primaryColor,
                               text: "Зарегистрироваться")
                }
                .padding(.bottom, height * Size.shared.getAdaptSizeHeight(px: 33))
                
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
                .padding(.bottom, height * Size.shared.getAdaptSizeHeight(px: 17))
            } .dismissingKeyboard()
        }
    }
}

struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}

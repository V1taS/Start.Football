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
        VStack(spacing: 0) {
            HStack {
                VStack(alignment: .leading, spacing: height * Size.shared.getAdaptSizeHeight(px: 3)) {
                    Text("Регистрация")
                        .foregroundColor(Color(#colorLiteral(red: 0.262745098, green: 0.2901960784, blue: 0.3960784314, alpha: 1)))
                        .font(Font.event.robotoMedium32)
                    
                    Text("Создайте аккаунт чтобы продолжить")
                        .foregroundColor(Color(#colorLiteral(red: 0.262745098, green: 0.2901960784, blue: 0.3960784314, alpha: 1)))
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
                ButtonView(background: #colorLiteral(red: 0.1294117647, green: 0.6117647059, blue: 0.4196078431, alpha: 1),
                           textColor: .white,
                           borderColor: #colorLiteral(red: 0.1294117647, green: 0.6117647059, blue: 0.4196078431, alpha: 1),
                           text: "Зарегистрироваться")
            }
            .padding(.bottom, height * Size.shared.getAdaptSizeHeight(px: 33))
            
            HStack {
                Text("Уже есть аккаунт?")
                    .foregroundColor(Color(#colorLiteral(red: 0.262745098, green: 0.2901960784, blue: 0.3960784314, alpha: 1)))
                    .font(Font.event.robotoRegular16)
                Button(action: {} ) {
                    Text("Войдите")
                        .foregroundColor(Color(#colorLiteral(red: 0.1294117647, green: 0.6117647059, blue: 0.4196078431, alpha: 1)))
                        .font(Font.event.robotoMedium18)
                }
                
            }
            .padding(.bottom, height * Size.shared.getAdaptSizeHeight(px: 17))
        } .dismissingKeyboard()
    }
}

struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}

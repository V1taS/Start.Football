//
//  SignUpView.swift
//  Start.Football
//
//  Created by Виталий Сосин on 23.11.2020.
//

import SwiftUI

struct SignUpView: View {
    
    @ObservedObject var viewModel = SignUpViewModel()
    @Environment(\.viewController) private var viewControllerHolder: UIViewController?
    private var viewController: UIViewController? {
        self.viewControllerHolder!
    }
    
    var body: some View {
        VStack {
            Text("Регистрация")
                .foregroundColor(Color(#colorLiteral(red: 0.262745098, green: 0.2901960784, blue: 0.3960784314, alpha: 1)))
                .font(Font.event.robotoMedium18)
                .padding(.top, Size.shared.getAdaptSizeHeight(px: 20))
            
            VStack(spacing: UIScreen.screenHeight * Size.shared.getAdaptSizeHeight(px: 32)) {
                TextFieldView(title: "Имя",
                              secureField: false,
                              placeholder: "Криштиано",
                              text: $viewModel.firstName,
                              success: $viewModel.firstNameSuccess)
                
                TextFieldView(title: "Фамилия",
                              secureField: false,
                              placeholder: "Роналдо",
                              text: $viewModel.lastName,
                              success: $viewModel.lastNameSuccess)
                
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
                
                TextFieldView(title: "Подтверждение пароля",
                              secureField: true,
                              placeholder: "• • • • • • • •",
                              text: $viewModel.passwordConfirm,
                              success: $viewModel.passwordConfirmSuccess)
            } .padding(.top, UIScreen.screenHeight * Size.shared.getAdaptSizeHeight(px: 32))
            
            HStack {
                VStack(alignment: .leading, spacing: UIScreen.screenHeight * Size.shared.getAdaptSizeHeight(px: 20)) {
                    CheckboxFieldView(checked: $viewModel.newsChecked,
                                      text: "Хочу получать новости на почту")
                    CheckboxFieldView(checked: $viewModel.userAgreementChecked,
                                      text: "Согласен с правилами сервиса")
                } .padding(.top, UIScreen.screenHeight * Size.shared.getAdaptSizeHeight(px: 23))
                Spacer()
            } .padding(.horizontal, UIScreen.screenWidth * Size.shared.getAdaptSizeHeight(px: 16))
            
            HStack {
                VStack(alignment: .leading, spacing: UIScreen.screenHeight * Size.shared.getAdaptSizeHeight(px: 8)) {
                    Text("Что-то пошло не так:")
                        .foregroundColor(Color(#colorLiteral(red: 1, green: 0.2784313725, blue: 0.2274509804, alpha: 1)))
                        .font(Font.event.robotoBold14)
                    Text("Поле должно быть заполнено")
                        .foregroundColor(Color(#colorLiteral(red: 1, green: 0.2784313725, blue: 0.2274509804, alpha: 1)))
                        .font(Font.event.robotoRegular16)
                        .padding(.top, UIScreen.screenHeight * Size.shared.getAdaptSizeHeight(px: 8))
                    Text("Введенные пароли не совпадают")
                        .foregroundColor(Color(#colorLiteral(red: 1, green: 0.2784313725, blue: 0.2274509804, alpha: 1)))
                        .font(Font.event.robotoRegular16)
                    
                }.padding(.horizontal, UIScreen.screenWidth * Size.shared.getAdaptSizeHeight(px: 32))
                .padding(.top, UIScreen.screenHeight * Size.shared.getAdaptSizeHeight(px: 31))
                Spacer()
            }
            
            Button(action: {
                self.viewController?.present(style: .fullScreen) {
                    LoginView()
                }
            }) {
                ButtonView(background: #colorLiteral(red: 0.1294117647, green: 0.6117647059, blue: 0.4196078431, alpha: 1),
                           text: "Зарегистрироваться")
            } .padding(.top, UIScreen.screenHeight * Size.shared.getAdaptSizeHeight(px: 22))
        } .dismissingKeyboard()
    }
}

struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}

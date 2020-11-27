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
            GeometryReader { geometry in
                VStack {
                    Text("Регистрация")
                        .foregroundColor(Color(#colorLiteral(red: 0.262745098, green: 0.2901960784, blue: 0.3960784314, alpha: 1)))
                        .font(Font.event.robotoMedium18)
                        .padding(.top, Size.shared.getAdaptSizeHeight(px: 13))
                    
                    VStack(spacing: geometry.size.height * Size.shared.getAdaptSizeHeight(px: 24)) {
                        TextFieldView(title: "Имя",
                                      secureField: false,
                                      placeholder: "Криштиано",
                                      height: geometry.size.height,
                                      width: geometry.size.width,
                                      text: $viewModel.firstName,
                                      success: $viewModel.firstNameSuccess)
                        
                        TextFieldView(title: "Фамилия",
                                      secureField: false,
                                      placeholder: "Роналдо",
                                      height: geometry.size.height,
                                      width: geometry.size.width,
                                      text: $viewModel.lastName,
                                      success: $viewModel.lastNameSuccess)
                        
                        TextFieldView(title: "E-mail",
                                      secureField: false,
                                      placeholder: "ronaldo@mail.ru",
                                      height: geometry.size.height,
                                      width: geometry.size.width,
                                      text: $viewModel.mail,
                                      success: $viewModel.mailSuccess)
                        
                        TextFieldView(title: "Пароль",
                                      secureField: true,
                                      placeholder: "878ujss2",
                                      height: geometry.size.height,
                                      width: geometry.size.width,
                                      text: $viewModel.password,
                                      success: $viewModel.passwordSuccess)
                        
                        TextFieldView(title: "Подтверждение пароля",
                                      secureField: true,
                                      placeholder: "• • • • • • • •",
                                      height: geometry.size.height,
                                      width: geometry.size.width,
                                      text: $viewModel.passwordConfirm,
                                      success: $viewModel.passwordConfirmSuccess)
                    } .padding(.top, geometry.size.height * Size.shared.getAdaptSizeHeight(px: 40))
                    
                    HStack {
                        VStack(alignment: .leading,
                               spacing: geometry.size.height * Size.shared.getAdaptSizeHeight(px: 16)) {
                            CheckboxFieldView(checked: $viewModel.newsChecked,
                                              text: "Хочу получать новости на почту",
                                              width: geometry.size.width)
                            CheckboxFieldView(checked: $viewModel.userAgreementChecked,
                                              text: "Согласен с правилами сервиса",
                                              width: geometry.size.width)
                        } .padding(.top, geometry.size.height * Size.shared.getAdaptSizeHeight(px: 32))
                        Spacer()
                    } .padding(.horizontal, geometry.size.height * Size.shared.getAdaptSizeHeight(px: 16))
                    
                    Spacer()
                    
                    Button(action: {
                        self.viewController?.present(style: .fullScreen) {
                            LoginView()
                        }
                    }) {
                        ButtonView(background: #colorLiteral(red: 0.1294117647, green: 0.6117647059, blue: 0.4196078431, alpha: 1),
                                   text: "Зарегистрироваться",
                                   height: geometry.size.height,
                                   width: geometry.size.width)
                    } .padding(.bottom, geometry.size.height * Size.shared.getAdaptSizeHeight(px: 29))
                }
            }
        }
    }
}

struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}

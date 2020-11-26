//
//  SignUpView.swift
//  Start.Football
//
//  Created by Виталий Сосин on 23.11.2020.
//

import SwiftUI

struct SignUpView: View {
    
    @ObservedObject var viewModel = SignUpViewModel()
    
    var body: some View {
        VStack {
            GeometryReader { geometry in
                VStack {
                    Text("Регистрация")
                        .font(Font.event.robotoMedium18)
                        .padding(.top, geometry.size.height * 0.07)
                    
                    VStack(spacing: geometry.size.height * 0.0295) {
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
                    } .padding(.top, geometry.size.height * 0.0197)
                    
                    HStack {
                        VStack(alignment: .leading, spacing: geometry.size.height * 0.0197) {
                            CheckboxFieldView(checked: $viewModel.newsChecked,
                                              text: "Хочу получать новости на почту",
                                              width: geometry.size.width)
                            CheckboxFieldView(checked: $viewModel.userAgreementChecked,
                                              text: "Согласен с правилами сервиса",
                                              width: geometry.size.width)
                        } .padding(.top, geometry.size.height * 0.0393)
                        Spacer()
                    } .padding(.horizontal, geometry.size.height * 0.0197)
                    
                    Spacer()
                    
                    Button(action: {}) {
                        ButtonView(background: #colorLiteral(red: 0.1294117647, green: 0.6117647059, blue: 0.4196078431, alpha: 1),
                                   text: "Зарегистрироваться",
                                   height: geometry.size.height)
                    } .padding(.bottom, geometry.size.height * 0.0356)
                    
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

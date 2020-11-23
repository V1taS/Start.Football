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
            Text("Регистрация")
                .font(Font.custom("Roboto", size: 18))
                .padding(.top, 57)
            
            VStack(spacing: 24) {
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
            } .padding(.top, 40)
            
            HStack {
                VStack(alignment: .leading, spacing: 16) {
                    CheckboxFieldView(checked: $viewModel.newsChecked,
                                      text: "Хочу получать новости на почту")
                    CheckboxFieldView(checked: $viewModel.userAgreementChecked,
                                      text: "Согласен с правилами сервиса")
                } .padding(.top, 32)
                Spacer()
            } .padding(.horizontal, 16)
            
            Spacer()
            
            Button(action: {}) {
                ButtonView(background: #colorLiteral(red: 0.1294117647, green: 0.6117647059, blue: 0.4196078431, alpha: 1),
                           text: "Зарегистрироваться")
            } .padding(.bottom, 29)
            
        }
    }
}

struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}

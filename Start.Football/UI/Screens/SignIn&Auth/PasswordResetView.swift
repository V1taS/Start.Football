//
//  PasswordResetView.swift
//  Start.Football
//
//  Created by Виталий Сосин on 23.11.2020.
//

import SwiftUI

struct PasswordResetView: View {
    
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
                        Text("Сброс пароля")
                            .foregroundColor(.secondaryColor)
                            .font(Font.event.robotoMedium32)
                        
                        Text("Введите email, указанный при регистрации")
                            .foregroundColor(.desc)
                            .font(Font.event.robotoRegular16)
                        
                    }
                    .padding(.top, 11)
                    Spacer()
                }
                
                VStack(spacing: 40) {
                    
                    LoginTextFieldView(text: appBinding.resetAuth.mail,
                                       success: appBinding.resetAuth.mailSuccess,
                                       title: "Email",
                                       icon: "mail",
                                       placeholder: "Placeholder")
                } .padding(.top, 37)
                
                Spacer()
                
                VStack(spacing: 16) {
                    Button(action: {
                        self.viewController?.present(style: .fullScreen) {
                            TabViewApp()
                        }
                    }) {
                        ButtonView(background: .primaryColor,
                                   textColor: .whiteColor,
                                   borderColor: .primaryColor,
                                   text: "Зарегистрироваться",
                                   switchImage: false,
                                   image: "")
                    }
                    
                    Button(action: {}) {
                        ButtonCancel()
                    }
                } .padding(.bottom, 17)
                
            }
        }
        .padding(.horizontal, 24)
        .dismissingKeyboard()
    }
}

struct PasswordResetView_Previews: PreviewProvider {
    static var previews: some View {
        PasswordResetView(appBinding: .constant(.init()))
    }
}

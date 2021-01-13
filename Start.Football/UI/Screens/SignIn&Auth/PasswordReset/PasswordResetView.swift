//
//  PasswordResetView.swift
//  Start.Football
//
//  Created by Виталий Сосин on 23.11.2020.
//

import SwiftUI

struct PasswordResetView: View {
    
    let height = UIScreen.screenHeight
    let width = UIScreen.screenWidth
    
    @ObservedObject var viewModel = PasswordResetViewModel()
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
                        Text("Сброс пароля")
                            .foregroundColor(.secondaryColor)
                            .font(Font.event.robotoMedium32)
                        
                        Text("Введите email, указанный при регистрации")
                            .foregroundColor(.desc)
                            .font(Font.event.robotoRegular16)
                        
                    }
                    .padding(.top, height * Size.shared.getAdaptSizeHeight(px: 11))
                    Spacer()
                }
                
                VStack(spacing: height * Size.shared.getAdaptSizeHeight(px: 40)) {
                    
                    LoginTextFieldView(text: $viewModel.mail,
                                       success: $viewModel.mailSuccess,
                                       title: "Email",
                                       icon: "mail",
                                       placeholder: "Placeholder")
                } .padding(.top, height * Size.shared.getAdaptSizeHeight(px: 37))
                
                Spacer()
                
                VStack(spacing: height * Size.shared.getAdaptSizeHeight(px: 16)) {
                    Button(action: {
                        self.viewController?.present(style: .fullScreen) {
                            TabViewApp()
                        }
                    }) {
                        ButtonView(background: .primaryColor,
                                   textColor: .whiteColor,
                                   borderColor: .primaryColor,
                                   text: "Зарегистрироваться")
                    }
                    
                    Button(action: {}) {
                        ButtonCancel()
                    }
                } .padding(.bottom, height * Size.shared.getAdaptSizeHeight(px: 17))
                
            }
        }
        .padding(.horizontal, 24)
        .dismissingKeyboard()
    }
}

struct PasswordResetView_Previews: PreviewProvider {
    static var previews: some View {
        PasswordResetView()
    }
}
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
        VStack(spacing: 0) {
            HStack {
                VStack(alignment: .leading, spacing: height * Size.shared.getAdaptSizeHeight(px: 3)) {
                    Text("Сброс пароля")
                        .foregroundColor(Color(#colorLiteral(red: 0.262745098, green: 0.2901960784, blue: 0.3960784314, alpha: 1)))
                        .font(Font.event.robotoMedium32)
                    
                    Text("Введите email, указанный при регистрации")
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
                                   placeholder: "Placeholder")
            } .padding(.top, height * Size.shared.getAdaptSizeHeight(px: 37))
            
            Spacer()
            
            VStack(spacing: height * Size.shared.getAdaptSizeHeight(px: 16)) {
                Button(action: {
                    self.viewController?.present(style: .fullScreen) {
                        TabViewApp()
                    }
                }) {
                    ButtonView(background: #colorLiteral(red: 0.1294117647, green: 0.6117647059, blue: 0.4196078431, alpha: 1),
                               textColor: .white,
                               borderColor: #colorLiteral(red: 0.1294117647, green: 0.6117647059, blue: 0.4196078431, alpha: 1),
                               text: "Зарегистрироваться")
                }
                
                Button(action: {}) {
                    ButtonCancel()
                }
            } .padding(.bottom, height * Size.shared.getAdaptSizeHeight(px: 17))
            
        } .dismissingKeyboard()
    }
}

struct PasswordResetView_Previews: PreviewProvider {
    static var previews: some View {
        PasswordResetView()
    }
}

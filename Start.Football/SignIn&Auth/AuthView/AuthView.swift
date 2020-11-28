//
//  ContentView.swift
//  Start.Football
//
//  Created by Виталий Сосин on 23.11.2020.
//

import SwiftUI

struct AuthView: View {
    
    @ObservedObject var viewModel = AuthViewModel()
    @Environment(\.viewController) private var viewControllerHolder: UIViewController?
    private var viewController: UIViewController? {
        self.viewControllerHolder!
    }
    
    var body: some View {
        VStack {
            VStack {
                Text("Регистрация")
                    .foregroundColor(Color(#colorLiteral(red: 0.262745098, green: 0.2901960784, blue: 0.3960784314, alpha: 1)))
                    .font(Font.event.robotoRegular32)
                    .padding(.top, UIScreen.screenHeight * Size.shared.getAdaptSizeHeight(px: 32))
                
                VStack(spacing: UIScreen.screenHeight * Size.shared.getAdaptSizeHeight(px: 24)) {
                    Button(action: {
                        self.viewController?.present(style: .fullScreen) {
                            SignUpView()
                        }
                        
                    }) {
                        ButtonView(background: #colorLiteral(red: 0.1294117647, green: 0.6117647059, blue: 0.4196078431, alpha: 1),
                                   text: "Продолжить с Apple")
                    }
                    
                    Button(action: {}) {
                        ButtonView(background: #colorLiteral(red: 0.1294117647, green: 0.6117647059, blue: 0.4196078431, alpha: 1),
                                   text: "Зарегистрироваться с Google")
                    }
                    
                    Button(action: {}) {
                        ButtonView(background: #colorLiteral(red: 0.1294117647, green: 0.6117647059, blue: 0.4196078431, alpha: 1),
                                   text: "Зарегистрироваться с VK")
                    }
                    
                    Button(action: {}) {
                        ButtonView(background: #colorLiteral(red: 0.1294117647, green: 0.6117647059, blue: 0.4196078431, alpha: 1),
                                   text: "Зарегистрироваться с Facebook")
                    }
                    
                    HStack {
                        Text("Регистрация")
                            .foregroundColor(Color(#colorLiteral(red: 0.262745098, green: 0.2901960784, blue: 0.3960784314, alpha: 1)))
                            .font(Font.event.robotoRegular16)
                        Button(action: {}) {
                            Text("по e-mail")
                                .font(Font.event.robotoRegular16)
                                .foregroundColor(Color(#colorLiteral(red: 0.1294117647, green: 0.6117647059, blue: 0.4196078431, alpha: 1)))
                        }
                    }
                } .padding(.top, UIScreen.screenHeight * Size.shared.getAdaptSizeHeight(px: 147))
                
                Spacer()
                
                Divider()
                    .padding(.bottom, UIScreen.screenHeight * Size.shared.getAdaptSizeHeight(px: 32))
                
                HStack {
                    Text("Уже есть аккаунт?")
                        .foregroundColor(Color(#colorLiteral(red: 0.262745098, green: 0.2901960784, blue: 0.3960784314, alpha: 1)))
                        .font(Font.event.robotoRegular16)
                    Button(action: {
                        self.viewController?.present(style: .fullScreen) {
                            LoginView()
                        }
                    }) {
                        Text("Войдите")
                            .font(Font.event.robotoRegular16)
                            .foregroundColor(Color(#colorLiteral(red: 0.1294117647, green: 0.6117647059, blue: 0.4196078431, alpha: 1)))
                    }
                } .padding(.bottom, UIScreen.screenHeight * Size.shared.getAdaptSizeHeight(px: 32))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}

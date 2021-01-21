//
//  AuthView.swift
//  Start.Football
//
//  Created by Виталий Сосин on 23.11.2020.
//

import SwiftUI

struct AuthView: View {
    
    @State private var appState: AppState.AppData = .init()
    private var appBinding: Binding<AppState.AppData> {
        $appState.dispatched(to: injected.appState, \.appData)
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
                header
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 0) {
                        VStack(spacing: 40) {
                            loginTextField
                            passwordTextField
                        }
                        authError
                        loginButton
                    }
                    .padding(.top, 37)
                    
                    resetPasswordButtton
                    Spacer()
                    signUPButtton
                    or
                    
                    VStack(spacing: 16) {
                        signUPApple
                        signUPGoogle
                    }
                    .padding(.bottom, 17) 
                }
            }
        }
        .padding(.horizontal, 24)
        .dismissingKeyboard()
    }
}

// MARK: UI
private extension AuthView {
    private var header: AnyView {
        AnyView(
            HStack {
                VStack(alignment: .leading, spacing: 3) {
                    Text("Авторизация")
                        .foregroundColor(.secondaryColor)
                        .font(Font.event.robotoMedium32)
                    
                    Text("С возвращением, вас не хватало!")
                        .foregroundColor(.desc)
                        .font(Font.event.robotoRegular16)
                    
                }
                .padding(.top, 11)
                Spacer()
            }
        )
    }
}

private extension AuthView {
    private var loginTextField: AnyView {
        AnyView(
            LoginTextFieldView(text: appBinding.signInAuth.login,
                               success: appBinding.signInAuth.loginSuccess.wrappedValue,
                               title: "Логин или Email",
                               icon: "login",
                               placeholder: "admin@Start.Football.ru")
        )
    }
}

private extension AuthView {
    private var passwordTextField: AnyView {
        AnyView(
            PasswordTextFieldView(text: appBinding.signInAuth.password,
                                  success: appBinding.signInAuth.passwordSuccess.wrappedValue,
                                  placeholder: "aSMLg%")
        )
    }
}

private extension AuthView {
    private var authError: AnyView {
        AnyView(
            ZStack {
                HStack {
                    Text("\(appBinding.signInAuth.authError.wrappedValue.rawValue)")
                        .foregroundColor(.error)
                        .font(Font.event.robotoMedium14)
                    Spacer()
                }
            }
            .padding(.top, 8)
        )
    }
}

private extension AuthView {
    private var loginButton: AnyView {
        AnyView(
            Button(action: {
                verificationLogin()
                verificationPassword()
                presentLogINView()
            }) {
                ButtonView(background: .primaryColor,
                           textColor: .whiteColor,
                           borderColor: .primaryColor,
                           text: "Войти",
                           switchImage: false,
                           image: "")
                    .padding(.top, 37)
            }
        )
    }
}

private extension AuthView {
    private var resetPasswordButtton: AnyView {
        AnyView(
            HStack {
                Text("Забыли")
                    .foregroundColor(.desc)
                    .font(Font.event.robotoRegular16)
                Button(action: {
                    presentRessetPassView()
                } ) {
                    Text("пароль?")
                        .foregroundColor(.primaryColor)
                        .font(Font.event.robotoMedium18)
                }
            }
            .padding(.top, 33)
        )
    }
}

private extension AuthView {
    private var signUPButtton: AnyView {
        AnyView(
            HStack {
                Text("Нет аккаунта?")
                    .foregroundColor(.desc)
                    .font(Font.event.robotoRegular16)
                Button(action: {
                    presentSignUpView()
                } ) {
                    Text("Зарегистрируйтесь")
                        .foregroundColor(.primaryColor)
                        .font(Font.event.robotoMedium18)
                }
            }
            .padding(.bottom, 33)
        )
    }
}

private extension AuthView {
    private var or: AnyView {
        AnyView(
            HStack {
                VStack {
                    Divider()
                }
                Text("или")
                    .foregroundColor(.desc)
                    .font(Font.event.robotoRegular14)
                VStack {
                    Divider()
                }
            }
            .padding(.bottom, 24)
        )
    }
}

private extension AuthView {
    private var signUPApple: AnyView {
        AnyView(
            Button(action: {
                presentAppleView()
            } ) {
                ButtonApple()
            }
        )
    }
}

private extension AuthView {
    private var signUPGoogle: AnyView {
        AnyView(
            Button(action: {
                presentGoogleView()
            } ) {
                ButtonGoogle()
            }
        )
    }
}


// MARK: Actions
private extension AuthView {
    private func verificationLogin() {
        injected.interactors.authInteractor.verificationLogin(state: appBinding)
    }
    
    private func verificationPassword() {
        injected.interactors.authInteractor.verificationPassword(state: appBinding)
    }
    
    private func presentLogINView() {
        if appBinding.signInAuth.loginSuccess.wrappedValue && appBinding.signInAuth.passwordSuccess.wrappedValue {
            appBinding.signInAuth.authError.wrappedValue = .success
            self.viewController?.present(style: .fullScreen) {
                TabViewApp()
            }
        }
        appBinding.signInAuth.authError.wrappedValue = .notFilled
    }
    
    private func presentRessetPassView() {
        self.viewController?.present(style: .pageSheet) {
            PasswordResetView()
        }
    }
    
    private func presentSignUpView() {
        self.viewController?.present(style: .fullScreen) {
            SignUpView()
        }
    }
    
    private func presentAppleView() {
    }
    
    private func presentGoogleView() {
        self.viewController?.present(style: .fullScreen) {
            TabViewApp()
        }
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}

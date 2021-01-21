//
//  SignUpView.swift
//  Start.Football
//
//  Created by Виталий Сосин on 23.11.2020.
//

import SwiftUI

struct SignUpView: View {
    
    @State var isHiddenTextConfidentiality = true
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
                    VStack(spacing: 40) {
                        mailTextField
                        loginTextField
                        passwordTextField
                    }
                    .padding(.top, 37)
                    authError
                    
                    VStack(alignment: .leading, spacing: 10) {
                        confidentiality
                        getNews
                    }
                    .padding(.top, 16)
                    
                    Spacer()
                    signUPButtton
                    loginButton
                }
            }
            
        }
        .padding(.horizontal, 24)
        .dismissingKeyboard()
    }
}

// MARK: Header
private extension SignUpView {
    private var header: AnyView {
        AnyView(
            HStack {
                VStack(alignment: .leading, spacing: 3) {
                    Text("Регистрация")
                        .foregroundColor(.secondaryColor)
                        .font(Font.event.robotoMedium32)
                    
                    Text("Создайте аккаунт чтобы продолжить")
                        .foregroundColor(.desc)
                        .font(Font.event.robotoRegular16)
                    
                }
                .padding(.top, 11)
                Spacer()
            }
        )
    }
}

// MARK: Mail text field
private extension SignUpView {
    private var mailTextField: AnyView {
        AnyView(
            LoginTextFieldView(text: appBinding.signUpAuth.mail,
                               success: appBinding.signUpAuth.mailSuccess.wrappedValue,
                               title: "Email",
                               icon: "mail",
                               placeholder: "roman@start.football")
        )
    }
}

// MARK: Login text field
private extension SignUpView {
    private var loginTextField: AnyView {
        AnyView(
            LoginTextFieldView(text: appBinding.signUpAuth.login,
                               success: appBinding.signUpAuth.loginSuccess.wrappedValue,
                               title: "Логин",
                               icon: "login",
                               placeholder: "Roman")
        )
    }
}

// MARK: Password text field
private extension SignUpView {
    private var passwordTextField: AnyView {
        AnyView(
            PasswordTextFieldView(text: appBinding.signUpAuth.password,
                                  success: appBinding.signUpAuth.passwordSuccess.wrappedValue,
                                  placeholder: "**********")
        )
    }
}

// MARK: Сonfidentiality
private extension SignUpView {
    
    private var confidentiality: AnyView {
        AnyView(
            VStack(spacing: 0) {
                CheckboxFieldView(checked: appBinding.signUpAuth.confidentiality,
                                  text: "Создавая аккаунт вы принимаете правила сервиса и политику конфиденциальности")
                accessTextConfidentiality
            }
            .padding(.top, 24)
        )
    }
}

// MARK: Get news
private extension SignUpView {
    private var getNews: AnyView {
        AnyView(
            CheckboxFieldView(checked: appBinding.signUpAuth.receiveNews,
                              text: "Хочу получать новости на почту")
        )
    }
}

// MARK: SignUP buttton
private extension SignUpView {
    private var signUPButtton: AnyView {
        AnyView(
            Button(action: {
                register()
                switchConfidentiality()
                presentPage()
            }) {
                ButtonView(background: .primaryColor,
                           textColor: .whiteColor,
                           borderColor: .primaryColor,
                           text: "Зарегистрироваться",
                           switchImage: false,
                           image: "")
            }
            .padding(.bottom, 33)
        )
    }
}

// MARK: Login button
private extension SignUpView {
    private var loginButton: AnyView {
        AnyView(
            HStack {
                Text("Уже есть аккаунт?")
                    .foregroundColor(.desc)
                    .font(Font.event.robotoRegular16)
                Button(action: {
                    self.viewController?.dismiss(animated: true, completion: nil)
                } ) {
                    Text("Войдите")
                        .foregroundColor(.primaryColor)
                        .font(Font.event.robotoMedium18)
                }
            }
            .padding(.bottom, 17)
        )
    }
}

// MARK: Auth error
private extension SignUpView {
    private var authError: AnyView {
        AnyView(
            HStack {
                Text("\(appBinding.signUpAuth.authError.wrappedValue.rawValue)")
                    .foregroundColor(.error)
                    .font(Font.event.robotoMedium14)
                Spacer()
            }
        )
    }
}

// MARK: Access text confidentiality
private extension SignUpView {
    private var accessTextConfidentiality: AnyView {
        AnyView(
            HStack {
                Text(isHiddenTextConfidentiality ? "" : "Подтвердите правила сервиса")
                    .foregroundColor(.error)
                    .font(Font.event.robotoMedium14)
                Spacer()
            }
        )
    }
}

private extension SignUpView {
    private func register() {
        injected.interactors.authInteractor.register(state: appBinding)
    }
}

private extension SignUpView {
    private func switchConfidentiality() {
        if appBinding.signUpAuth.confidentiality.wrappedValue {
            isHiddenTextConfidentiality = true
        } else {
            isHiddenTextConfidentiality = false
        }
    }
}

private extension SignUpView {
    private func presentPage() {
        if appBinding.signUpAuth.mailSuccess.wrappedValue &&
            appBinding.signUpAuth.loginSuccess.wrappedValue &&
            appBinding.signUpAuth.passwordSuccess.wrappedValue &&
            appBinding.signUpAuth.confidentiality.wrappedValue {
            self.viewController?.present(style: .fullScreen) {
                TabViewApp()
            }
        }
    }
}

struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}

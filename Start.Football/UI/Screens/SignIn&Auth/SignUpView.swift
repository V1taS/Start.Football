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
                    VStack(spacing: UIScreen.screenHeight *
                            Size.shared.getAdaptSizeHeight(px: 24)) {
                        mailTextField
                        loginTextField
                        passwordTextField
                    }
                    .padding(.top, UIScreen.screenHeight *
                                Size.shared.getAdaptSizeHeight(px: 24))
                    authError
                    
                    VStack(alignment: .leading, spacing: 10) {
                        confidentiality
                        getNews
                    }
                    .padding(.top)
                    
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

// MARK: UI
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

private extension SignUpView {
    private var passwordTextField: AnyView {
        AnyView(
            PasswordTextFieldView(text: appBinding.signUpAuth.password,
                                  success: appBinding.signUpAuth.passwordSuccess.wrappedValue,
                                  placeholder: "**********")
        )
    }
}

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

private extension SignUpView {
    private var confidentiality: AnyView {
        AnyView(
            VStack(spacing: 0) {
                CheckboxFieldView(checked: appBinding.signUpAuth.confidentiality,
                                  text: "Создавая аккаунт вы принимаете правила сервиса и политику конфиденциальности")
                showTextConfidentialityError
            }
        )
    }
}

private extension SignUpView {
    private var showTextConfidentialityError: AnyView {
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
    private var getNews: AnyView {
        AnyView(
            CheckboxFieldView(checked: appBinding.signUpAuth.receiveNews,
                              text: "Хочу получать новости на почту")
                .padding(.bottom, UIScreen.screenHeight *
                            Size.shared.getAdaptSizeHeight(px: 24))
        )
    }
}

private extension SignUpView {
    private var signUPButtton: AnyView {
        AnyView(
            Button(action: {
                
                configureValidators(state: appBinding)
                presentSignUpView(state: appBinding)
            }) {
                ButtonView(background: .primaryColor,
                           textColor: .whiteColor,
                           borderColor: .primaryColor,
                           text: "Зарегистрироваться",
                           switchImage: false,
                           image: "")
            }
            .padding(.bottom, UIScreen.screenHeight *
                        Size.shared.getAdaptSizeHeight(px: 24))
        )
    }
}

private extension SignUpView {
    private var loginButton: AnyView {
        AnyView(
            HStack {
                Text("Уже есть аккаунт?")
                    .foregroundColor(.desc)
                    .font(Font.event.robotoRegular16)
                Button(action: {
                    presentLogINView()
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


// MARK: Actions
private extension SignUpView {
    private func configureValidators(state: Binding<AppState.AppData>) {
        validatorSignUpMail(state: state)
        validatorSignUpLogin(state: state)
        validatorSignUpPassword(state: state)
        switchConfidentiality(state: state)
    }
    
    private func validatorSignUpMail(state: Binding<AppState.AppData>) {
        injected.interactors.authInteractor.validatorSignUpMail(state: state)
    }
    
    private func validatorSignUpLogin(state: Binding<AppState.AppData>) {
        injected.interactors.authInteractor.validatorSignUpLogin(state: state)
    }
    
    private func validatorSignUpPassword(state: Binding<AppState.AppData>) {
        injected.interactors.authInteractor.validatorSignUpPassword(state: state)
    }
    
    private func switchConfidentiality(state: Binding<AppState.AppData>) {
        isHiddenTextConfidentiality = injected.interactors.authInteractor
            .switchConfidentiality(state: state)
    }
    
    private func presentSignUpView(state: Binding<AppState.AppData>) {
        if injected.interactors.authInteractor.presentSignUpView(state: state) {
            self.viewController?.present(style: .fullScreen) {
                TabViewApp()
            }
        }
    }
    
    private func presentLogINView() {
        self.viewController?.dismiss(animated: true, completion: nil)
    }
}

struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}

//
//  PasswordResetView.swift
//  Start.Football
//
//  Created by Виталий Сосин on 23.11.2020.
//

import SwiftUI

struct PasswordResetView: View {
    
    @State var showPage = false
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
                loginTextField
                authError
                Spacer()
                
                VStack(spacing: 16) {
                    loginButton
                    cancelButton
                }
                .padding(.bottom, 17)
                
            }
        }
        .padding(.horizontal, 24)
        .dismissingKeyboard()
    }
}

// MARK: Header
private extension PasswordResetView {
    private var header: AnyView {
        AnyView(
            HStack {
                VStack(alignment: .leading, spacing: 3) {
                    Text("Сброс пароля")
                        .foregroundColor(.secondaryColor)
                        .font(Font.event.robotoMedium32)
                    
                    Text("Введите email, указанный при регистрации")
                        .foregroundColor(.desc)
                        .font(Font.event.robotoRegular16)
                    
                }
                .padding(.top, 60)
                Spacer()
            }
        )
    }
}

// MARK: Text field
private extension PasswordResetView {
    private var loginTextField: AnyView {
        AnyView(
            LoginTextFieldView(text: appBinding.resetAuth.mail,
                               success: appBinding.resetAuth.mailSuccess.wrappedValue,
                               title: "Email",
                               icon: "mail",
                               placeholder: "admin@Start.Football.ru")
                .padding(.top, 37)
        )
    }
}

// MARK: Login button
private extension PasswordResetView {
    private var loginButton: AnyView {
        AnyView(
            Button(action: {
                verificationMail()
                showPage = appBinding.resetAuth.mailSuccess.wrappedValue
                presentPage()
            }) {
                ButtonView(background: .primaryColor,
                           textColor: .whiteColor,
                           borderColor: .primaryColor,
                           text: "Продолжить",
                           switchImage: false,
                           image: "")
            }
        )
    }
}

// MARK: Cancel button
private extension PasswordResetView {
    private var cancelButton: AnyView {
        AnyView(
            Button(action: {
                self.viewController?.dismiss(animated: true, completion: nil)
            }) {
                ButtonCancel()
            }
        )
    }
}

// MARK: Auth error
private extension PasswordResetView {
    private var authError: AnyView {
        AnyView(
            ZStack {
                HStack {
                    Text("\(appBinding.resetAuth.authError.wrappedValue.rawValue)")
                        .foregroundColor(.error)
                        .font(Font.event.robotoMedium14)
                    Spacer()
                }
            }
            .padding(.top, 34)
        )
    }
}

private extension PasswordResetView {
    private func verificationMail() {
        injected.interactors.authInteractor.resetVerificationMail(state: appBinding)
    }
}

private extension PasswordResetView {
    private func presentPage() {
        if showPage {
            self.viewController?.present(style: .fullScreen) {
                TabViewApp() // логика во востановлению пароля
            }
        }
    }
}

struct PasswordResetView_Previews: PreviewProvider {
    static var previews: some View {
        PasswordResetView()
    }
}

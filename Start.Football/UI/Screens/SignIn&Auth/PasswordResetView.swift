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

// MARK: UI
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

private extension PasswordResetView {
    private var authError: AnyView {
        AnyView(
            HStack {
                Text("\(appBinding.resetAuth.authError.wrappedValue.rawValue)")
                    .foregroundColor(.error)
                    .font(Font.event.robotoMedium14)
                Spacer()
            }
        )
    }
}

private extension PasswordResetView {
    private var loginButton: AnyView {
        AnyView(
            Button(action: {
                verificationMail()
                resetPass()
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

private extension PasswordResetView {
    private var cancelButton: AnyView {
        AnyView(
            Button(action: {
                dismissButton()
            }) {
                ButtonCancel()
            }
        )
    }
}


// MARK: Actions
private extension PasswordResetView {
    private func verificationMail() {
        injected.interactors.authInteractor.resetVerificationMail(state: appBinding)
        showPage = appBinding.resetAuth.mailSuccess.wrappedValue
    }
    
    private func resetPass() {
        if showPage {
            self.viewController?.present(style: .fullScreen) {
                TabViewApp()
            }
        }
    }
    
    private func dismissButton() {
        self.viewController?.dismiss(animated: true, completion: nil)
    }
}

struct PasswordResetView_Previews: PreviewProvider {
    static var previews: some View {
        PasswordResetView()
    }
}

//
//  SignUPAuthInteractor.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 19.01.2021.
//

import Combine
import SwiftUI

protocol SignUPAuthInteractor  {
    func register(state: Binding<AppState.AppData>)
}

extension AuthInteractorImpl {
    func register(state: Binding<AppState.AppData>) {
        
        guard Validators.isFilled(email: state.signUpAuth.mail.wrappedValue,
                                  password: state.signUpAuth.password.wrappedValue) else {
            state.signUpAuth.authError.wrappedValue = .notFilled
            state.signUpAuth.mailSuccess.wrappedValue = false
            state.signUpAuth.loginSuccess.wrappedValue = false
            state.signUpAuth.passwordSuccess.wrappedValue = false
            return
        }
        
        guard Validators.isSimpleEmail(state.signUpAuth.mail.wrappedValue) else {
            state.signUpAuth.authError.wrappedValue = .invalidEmail
            state.signUpAuth.mailSuccess.wrappedValue = false
            return
        }
        
        state.signUpAuth.authError.wrappedValue = .success
        state.signUpAuth.mailSuccess.wrappedValue = true
        state.signUpAuth.loginSuccess.wrappedValue = true
        state.signUpAuth.passwordSuccess.wrappedValue = true
    }
}

//
//  AuthInteractor.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 19.01.2021.
//

import Combine
import SwiftUI

protocol AuthInteractor: SignUPAuthInteractor, ResetAuthInteractor  {
    func verificationLogin(state: Binding<AppState.AppData>)
    func verificationPassword(state: Binding<AppState.AppData>)
}

struct AuthInteractorImpl: AuthInteractor {
    func verificationLogin(state: Binding<AppState.AppData>) {
        guard !state.signInAuth.login.wrappedValue.isEmpty else {
            state.signInAuth.loginSuccess.wrappedValue = false
            return
        }
        guard state.signInAuth.login.wrappedValue.count >= 4 else {
            state.signInAuth.loginSuccess.wrappedValue = false
            return
        }
        state.signInAuth.loginSuccess.wrappedValue = true
    }
    
    func verificationPassword(state: Binding<AppState.AppData>) {
        guard !state.signInAuth.password.wrappedValue.isEmpty else {
            state.signInAuth.passwordSuccess.wrappedValue = false
            return
        }
        guard state.signInAuth.password.wrappedValue.count >= 6 else {
            state.signInAuth.passwordSuccess.wrappedValue = false
            return
        }
        state.signInAuth.passwordSuccess.wrappedValue = true
    }
}

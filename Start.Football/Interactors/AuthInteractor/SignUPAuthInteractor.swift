//
//  SignUPAuthInteractor.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 19.01.2021.
//

import Combine
import SwiftUI

protocol SignUPAuthInteractor  {
    func validatorSignUpMail(state: Binding<AppState.AppData>)
    func validatorSignUpLogin(state: Binding<AppState.AppData>)
    func validatorSignUpPassword(state: Binding<AppState.AppData>)
    func switchConfidentiality(state: Binding<AppState.AppData>) -> Bool
    func presentSignUpView(state: Binding<AppState.AppData>) -> Bool
}

extension AuthInteractorImpl {
    func validatorSignUpMail(state: Binding<AppState.AppData>) {
        
        guard Validators.isSimpleEmail(state.signUpAuth.mail.wrappedValue) else {
            state.signUpAuth.authError.wrappedValue = .notFilled
            state.signUpAuth.mailSuccess.wrappedValue = false
            return
        }
        state.signUpAuth.authError.wrappedValue = .success
        state.signUpAuth.mailSuccess.wrappedValue = true
    }
    
    func validatorSignUpLogin(state: Binding<AppState.AppData>) {
        guard Validators.isSimpleLogin(state.signUpAuth.login.wrappedValue) else {
            state.signUpAuth.authError.wrappedValue = .notFilled
            state.signUpAuth.loginSuccess.wrappedValue = false
            return
        }
        
        state.signUpAuth.authError.wrappedValue = .success
        state.signUpAuth.loginSuccess.wrappedValue = true
    }
    
    func validatorSignUpPassword(state: Binding<AppState.AppData>) {
        guard Validators.isFilled(password: state.signUpAuth.password.wrappedValue) else {
            state.signUpAuth.authError.wrappedValue = .notFilled
            state.signUpAuth.passwordSuccess.wrappedValue = false
            return
        }
        
        state.signUpAuth.authError.wrappedValue = .success
        state.signUpAuth.passwordSuccess.wrappedValue = true
    }
    
    func switchConfidentiality(state: Binding<AppState.AppData>) -> Bool {
        if state.signUpAuth.confidentiality.wrappedValue {
            return true
        } else {
            return false
        }
    }
    
    func presentSignUpView(state: Binding<AppState.AppData>) -> Bool {
        if state.signUpAuth.mailSuccess.wrappedValue &&
            state.signUpAuth.loginSuccess.wrappedValue &&
            state.signUpAuth.passwordSuccess.wrappedValue &&
            state.signUpAuth.confidentiality.wrappedValue {
            return true
        }
        return false
    }
}

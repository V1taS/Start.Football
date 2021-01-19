//
//  ResetAuthInteractor.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 19.01.2021.
//

import Combine
import SwiftUI

protocol ResetAuthInteractor  {
    func resetVerificationMail(state: Binding<AppState.AppData>)
}

extension AuthInteractorImpl {
    func resetVerificationMail(state: Binding<AppState.AppData>) {
        guard Validators.isSimpleEmail(state.resetAuth.mail.wrappedValue) else {
            state.resetAuth.authError.wrappedValue = .invalidEmail
            state.resetAuth.mailSuccess.wrappedValue = false
            return
        }
        state.resetAuth.mailSuccess.wrappedValue = true
        state.resetAuth.authError.wrappedValue = .success
    }
}

//
//  ResetAuth.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 19.01.2021.
//

import Foundation

extension AppState.AppData {
    struct ResetAuth: Equatable {
        var mail: String = ""
        var mailSuccess: Bool = true
        var authError: AppActions.AuthActions.AuthError = .success
    }
}

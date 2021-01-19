//
//  SignInAuth.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 19.01.2021.
//

import Foundation

extension AppState.AppData {
    struct SignInAuth: Equatable {
        var login: String = ""
        var loginSuccess: Bool = false
        
        var password: String = ""
        var passwordSuccess: Bool = true
    }
}

//
//  SignUpAuth.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 19.01.2021.
//

import Foundation

extension AppState.AppData {
    struct SignUpAuth: Equatable {
        var mail: String = ""
        var mailSuccess: Bool = true
        
        var login: String = ""
        var loginSuccess: Bool = true
        
        var password: String = ""
        var passwordSuccess: Bool = true
        
        var confidentiality: Bool = false
        var receiveNews: Bool = false
    }
}

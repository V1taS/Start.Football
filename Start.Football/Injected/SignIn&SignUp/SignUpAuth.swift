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
        var mailSuccess: Bool = false
        
        var login: String = ""
        var loginSuccess: Bool = false
        
        var password: String = ""
        var passwordSuccess: Bool = true
        
        var confidentiality: Bool = false
        var receiveNews: Bool = false
    }
}

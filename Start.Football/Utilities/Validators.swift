//
//  Validators.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 19.01.2021.
//

import Foundation

class Validators {
    static func isFilled(password: String?) -> Bool {
        guard let password = password, password != "" else { return false }
        return true
    }
    
    static func isSimpleEmail(_ email: String) -> Bool {
        let emailRegEx = "^.+@.+\\..{2,}$"
        return check(text: email, regEx: emailRegEx)
    }
    
    static func isSimpleLogin(_ login: String) -> Bool {
        guard !login.isEmpty else { return false }
        guard login.count >= 4 else { return false }
        return true
    }
    
    private static func check(text: String, regEx: String) -> Bool {
        let predicate = NSPredicate(format: "SELF MATCHES %@", regEx)
        return predicate.evaluate(with: text)
    }
}

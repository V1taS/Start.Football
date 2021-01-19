//
//  Validators.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 19.01.2021.
//

import Foundation

class Validators {
    static func isFilled(email: String?, password: String?) -> Bool {
        guard let password = password,
              let email = email,
              password != "",
              email != "" else { return false }
        return true
    }
    
    
    static func isSimpleEmail(_ email: String) -> Bool {
        let emailRegEx = "^.+@.+\\..{2,}$"
        return check(text: email, regEx: emailRegEx)
    }
    
    private static func check(text: String, regEx: String) -> Bool {
        let predicate = NSPredicate(format: "SELF MATCHES %@", regEx)
        return predicate.evaluate(with: text)
    }
}

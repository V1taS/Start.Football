//
//  LoginViewModel.swift
//  Start.Football
//
//  Created by Виталий Сосин on 23.11.2020.
//

import Foundation
import Combine

protocol LoginViewModelProtocol {
    
    var mail: String { get }
    var mailSuccess: Bool { get }
    
    var password: String { get }
    var passwordSuccess: Bool { get }
}

class LoginViewModel: LoginViewModelProtocol, ObservableObject {
    
    @Published var mail: String = "" {
        didSet {
            if mail.count <= 3 {
                mailSuccess = false
            } else {
                mailSuccess = true
            }
        }
    }
    @Published var mailSuccess: Bool = true
    
    @Published var password: String = "" {
        didSet {
            if password.count >= 5 {
                passwordSuccess = true
            } else {
                passwordSuccess = false
            }
        }
    }
    @Published var passwordSuccess: Bool = true
}

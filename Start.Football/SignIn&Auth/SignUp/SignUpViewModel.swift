//
//  SignUpViewModel.swift
//  Start.Football
//
//  Created by Виталий Сосин on 23.11.2020.
//

import Foundation
import Combine

protocol SignUpViewModelProtocol {
    
    var firstName: String { get }
    var firstNameSuccess: Bool { get }
    
    var lastName: String { get }
    var lastNameSuccess: Bool { get }
    
    var mail: String { get }
    var mailSuccess: Bool { get }
    
    var password: String { get }
    var passwordSuccess: Bool { get }
    
    var passwordConfirm: String { get }
    var passwordConfirmSuccess: Bool { get }
    
    var newsChecked: Bool { get }
    var userAgreementChecked: Bool { get }
}

class SignUpViewModel: SignUpViewModelProtocol, ObservableObject {

    @Published var firstName: String = "" {
        didSet {
            if firstName.count <= 1 {
                firstNameSuccess = false
            } else {
                firstNameSuccess = true
            }
        }
    }
    @Published var firstNameSuccess: Bool = true
    
    @Published var lastName: String = "" {
        didSet {
            if lastName.count <= 1 {
                lastNameSuccess = false
            } else {
                lastNameSuccess = true
            }
        }
    }
    @Published var lastNameSuccess: Bool = true
    
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
    
    @Published var passwordConfirm: String = "" {
        didSet {
            if passwordConfirm.count >= 5 && passwordConfirm == password {
                passwordConfirmSuccess = true
            } else {
                passwordConfirmSuccess = false
            }
        }
    }
    @Published var passwordConfirmSuccess: Bool = true
    
    @Published var newsChecked: Bool = false
    @Published var userAgreementChecked: Bool = false
}

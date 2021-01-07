//
//  SignUpViewModel.swift
//  Start.Football
//
//  Created by Виталий Сосин on 23.11.2020.
//

import Foundation
import Combine

protocol SignUpViewModelProtocol {
    
    var mail: String { get }
    var mailSuccess: Bool { get }
    
    var login: String { get }
    var loginSuccess: Bool { get }
    
    var password: String { get }
    var passwordSuccess: Bool { get }
    
    var confidentiality: Bool { get }
    var receiveNews: Bool { get }
}

class SignUpViewModel: SignUpViewModelProtocol, ObservableObject {
    @Published var mail: String = ""
    @Published var mailSuccess: Bool = false
    
    @Published var login: String = ""
    @Published var loginSuccess: Bool = false
    
    @Published var password: String = ""
    @Published var passwordSuccess: Bool = true
    
    @Published var confidentiality: Bool = false
    @Published var receiveNews: Bool = false
}

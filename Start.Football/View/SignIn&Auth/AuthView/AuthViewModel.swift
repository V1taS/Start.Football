//
//  AuthViewModel.swift
//  Start.Football
//
//  Created by Виталий Сосин on 23.11.2020.
//

import SwiftUI
import Combine

protocol AuthViewModelProtocol {
    var login: String { get }
    var loginSuccess: Bool { get }
    
    var password: String { get }
    var passwordSuccess: Bool { get }
}

class AuthViewModel: AuthViewModelProtocol, ObservableObject {
    @Published var login: String = ""
    @Published var loginSuccess: Bool = false
    
    @Published var password: String = ""
    @Published var passwordSuccess: Bool = true
}

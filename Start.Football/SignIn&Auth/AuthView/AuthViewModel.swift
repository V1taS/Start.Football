//
//  AuthViewModel.swift
//  Start.Football
//
//  Created by Виталий Сосин on 23.11.2020.
//

import Foundation
import Combine

protocol AuthViewModelProtocol {
    var isPresentedProfile: Bool { get }
    var isPresentedLogin: Bool { get }
}

class AuthViewModel: AuthViewModelProtocol, ObservableObject {
    @Published var isPresentedProfile: Bool = false
    @Published var isPresentedLogin: Bool = false
}

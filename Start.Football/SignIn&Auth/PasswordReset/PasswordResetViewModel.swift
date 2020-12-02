//
//  PasswordResetViewModel.swift
//  Start.Football
//
//  Created by Виталий Сосин on 23.11.2020.
//

import Foundation
import Combine

protocol PasswordResetlProtocol {
    var mail: String { get }
    var mailSuccess: Bool { get }
}

class PasswordResetViewModel: PasswordResetlProtocol, ObservableObject {
    @Published var mail: String = ""
    @Published var mailSuccess: Bool = false
}

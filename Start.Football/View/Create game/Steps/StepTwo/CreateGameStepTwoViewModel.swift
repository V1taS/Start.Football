//
//  CreateGameStepTwoViewModel.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 08.01.2021.
//

import SwiftUI
import Combine

enum SelectionRegularGame {
    case yes
    case no
}

protocol CreateGameStepTwoViewModelProtocol {
    var selectionRegularGame: SelectionRegularGame { get }
    var showTimePicker: Bool { get }
    
    var mo: Bool { get }
    var tu: Bool { get }
    var we: Bool { get }
    var th: Bool { get }
    var fr: Bool { get }
    var sa: Bool { get }
    var su: Bool { get }
}

class CreateGameStepTwoViewModel: CreateGameStepTwoViewModelProtocol, ObservableObject {
    @Published var selectionRegularGame: SelectionRegularGame = .no
    @Published var showTimePicker: Bool = false
    
    // MARK: - 
    @Published var mo: Bool = false
    @Published var tu: Bool = false
    @Published var we: Bool = false
    @Published var th: Bool = false
    @Published var fr: Bool = false
    @Published var sa: Bool = false
    @Published var su: Bool = false
}

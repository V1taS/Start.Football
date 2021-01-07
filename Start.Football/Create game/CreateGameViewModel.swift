//
//  CreateGameViewModel.swift
//  Start.Football
//
//  Created by Виталий Сосин on 09.12.2020.
//

import SwiftUI
import Combine

enum PrivacyGame {
    case open
    case close
}

enum SelectionRegularGame {
    case yes
    case no
}

enum SelectionCreateGame {
    case stepOne
    case stepTwo
    case stepThree
    case stepFour
    case stepFive
}

protocol CreateGameViewModelProtocol {
    var selectionCreateGame: SelectionCreateGame { get }
    var selectionRegularGame: SelectionRegularGame { get }
    var privacyGame: PrivacyGame { get }
    var maxCountPlayers: Double { get }
    var maxReservePlayers: Double { get }
    var progressValue: Float { get }
    var showParkingView: Bool { get }
}

class CreateGameViewModel: CreateGameViewModelProtocol, ObservableObject {
    @Published var selectionCreateGame: SelectionCreateGame = .stepThree {
        didSet {
            switch selectionCreateGame {
            case .stepOne:
                progressValue = 0.0
            case .stepTwo:
                progressValue = 0.25
            case .stepThree:
                progressValue = 0.50
            case .stepFour:
                progressValue = 0.75
            case .stepFive:
                progressValue = 1.0
            }
        }
    }
    @Published var selectionRegularGame: SelectionRegularGame = .yes
    @Published var privacyGame: PrivacyGame = .open
    @Published var maxCountPlayers: Double = 18
    @Published var maxReservePlayers: Double = 5
    @Published var progressValue: Float = 0.0
    @Published var showParkingView: Bool = false
}

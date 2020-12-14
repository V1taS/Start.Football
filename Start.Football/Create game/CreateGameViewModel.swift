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
    case stepSix
}

protocol CreateGameViewModelProtocol {
    var selectionCreateGame: SelectionCreateGame { get }
    var selectionRegularGame: SelectionRegularGame { get }
    var privacyGame: PrivacyGame { get }
    var maxCountPlayers: Double { get }
    var maxReservePlayers: Double { get }
}

class CreateGameViewModel: CreateGameViewModelProtocol, ObservableObject {
    @Published var selectionCreateGame: SelectionCreateGame = .stepTwo
    @Published var selectionRegularGame: SelectionRegularGame = .yes
    @Published var privacyGame: PrivacyGame = .open
    @Published var maxCountPlayers: Double = 18
    @Published var maxReservePlayers: Double = 5
}

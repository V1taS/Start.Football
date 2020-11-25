//
//  GameViewModel.swift
//  Start.Football
//
//  Created by Виталий Сосин on 25.11.2020.
//

import SwiftUI
import Combine

enum SelectionGame {
    case allGame
    case myGames
}

protocol GameViewModelProtocol {
    var selectionGame: SelectionGame { get }
}

class GameViewModel: GameViewModelProtocol, ObservableObject {
    @Published var selectionGame: SelectionGame = .allGame
}

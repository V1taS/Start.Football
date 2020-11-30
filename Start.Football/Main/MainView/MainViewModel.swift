//
//  MainViewModel.swift
//  Start.Football
//
//  Created by Виталий Сосин on 25.11.2020.
//

import SwiftUI
import Combine

enum SelectionGame {
    case allGame
    case myGames
    case map
}

protocol MainViewProtocol {
    var selectionGame: SelectionGame { get }
}

class MainViewModel: MainViewProtocol, ObservableObject {
    @Published var selectionGame: SelectionGame = .allGame
}

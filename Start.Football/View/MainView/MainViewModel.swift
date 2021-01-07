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
}

protocol MainViewProtocol {
    var selectionGame: SelectionGame { get }
    var showFiltrsView: Bool { get }
}

class MainViewModel: MainViewProtocol, ObservableObject {
    @Published var selectionGame: SelectionGame = .allGame
    @Published var showFiltrsView: Bool = false
}

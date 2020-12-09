//
//  CreateGameViewModel.swift
//  Start.Football
//
//  Created by Виталий Сосин on 09.12.2020.
//

import SwiftUI
import Combine

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
}

class CreateGameViewModel: CreateGameViewModelProtocol, ObservableObject {
    @Published var selectionCreateGame: SelectionCreateGame = .stepOne
    @Published var selectionRegularGame: SelectionRegularGame = .yes
}

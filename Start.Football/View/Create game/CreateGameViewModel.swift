//
//  CreateGameViewModel.swift
//  Start.Football
//
//  Created by Виталий Сосин on 09.12.2020.
//

import SwiftUI
import Combine

enum SelectionCreateGame {
    case stepOne
    case stepTwo
    case stepThree
    case stepFour
    case stepFive
}

protocol CreateGameViewModelProtocol {
    var selectionCreateGame: SelectionCreateGame { get }
    var progressValue: Float { get }
}

class CreateGameViewModel: CreateGameViewModelProtocol, ObservableObject {
    @Published var selectionCreateGame: SelectionCreateGame = .stepOne {
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
    @Published var progressValue: Float = 0.0

}

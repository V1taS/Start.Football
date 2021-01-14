//
//  CreateGameInteractor.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 14.01.2021.
//

import Combine
import SwiftUI

protocol CreateGameInteractorProtocol {
    func refreshProgressBar(step: SelectionCreateGame)
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

struct CreateGameInteractor: CreateGameInteractorProtocol {
    let appState: Store<AppState>
    
    init(appState: Store<AppState>) {
        self.appState = appState
    }
    
    func refreshProgressBar(step: SelectionCreateGame) {
        switch step {
        case .stepOne:
            appState[\.appData.createGame.progressValue] = 0.0
        case .stepTwo:
            appState[\.appData.createGame.progressValue] = 0.25
        case .stepThree:
            appState[\.appData.createGame.progressValue] = 0.50
        case .stepFour:
            appState[\.appData.createGame.progressValue] = 0.75
        case .stepFive:
            appState[\.appData.createGame.progressValue] = 1.0
        }
    }
}

struct StubCreateGameInteractor: CreateGameInteractorProtocol {
    func refreshProgressBar(step: SelectionCreateGame) {
        //
    }
}

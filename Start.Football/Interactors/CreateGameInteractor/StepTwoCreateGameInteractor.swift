//
//  StepTwoCreateGameInteractor.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 18.01.2021.
//

import SwiftUI

protocol StepTwoCreateGameInteractor {
    func noSelectionRegularGame(state: Binding<AppState.AppData>)
    func yesSelectionRegularGame(state: Binding<AppState.AppData>)
}

extension CreateGameInteractorImpl {
    func noSelectionRegularGame(state: Binding<AppState.AppData>) {
        state.createGame.selectionRegularGame.wrappedValue = .no
    }
    
    func yesSelectionRegularGame(state: Binding<AppState.AppData>) {
        state.createGame.selectionRegularGame.wrappedValue = .yes
    }
}

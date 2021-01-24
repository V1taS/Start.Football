//
//  CreateGameInteractor.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 14.01.2021.
//

import Combine
import SwiftUI

protocol CreateGameInteractor: StepOneCreateGameInteractor,
                               StepTwoCreateGameInteractor,
                               StepThreeCreateGameInteractor,
                               StepFourCreateGameInteractor {
    func refreshProgressBar(state: Binding<AppState.AppData>)
    func nextStepProgressBar(state: Binding<AppState.AppData>)
    func backStepProgressBar(state: Binding<AppState.AppData>)
}

struct CreateGameInteractorImpl: CreateGameInteractor {
    func refreshProgressBar(state: Binding<AppState.AppData>) {
        switch state.createGame.selectionCreateGame.wrappedValue {
        case .stepOne:
            state.createGame.progressValue.wrappedValue = 0.0
        case .stepTwo:
            state.createGame.progressValue.wrappedValue = 0.25
        case .stepThree:
            state.createGame.progressValue.wrappedValue = 0.50
        case .stepFour:
            state.createGame.progressValue.wrappedValue = 0.75
        case .stepFive:
            state.createGame.progressValue.wrappedValue = 1.0
        }
    }
    
    func nextStepProgressBar(state: Binding<AppState.AppData>)  {
        switch state.createGame.selectionCreateGame.wrappedValue {
        case .stepOne:
            state.createGame.selectionCreateGame.wrappedValue = .stepTwo
        case .stepTwo:
            state.createGame.selectionCreateGame.wrappedValue = .stepThree
        case .stepThree:
            state.createGame.selectionCreateGame.wrappedValue = .stepFour
        case .stepFour:
            state.createGame.selectionCreateGame.wrappedValue = .stepFive
        case .stepFive:
            break
        }
    }
    
    func backStepProgressBar(state: Binding<AppState.AppData>)  {
        switch state.createGame.selectionCreateGame.wrappedValue {
        case .stepOne:
            state.createGame.selectionCreateGame.wrappedValue = .stepOne
        case .stepTwo:
            state.createGame.selectionCreateGame.wrappedValue = .stepOne
        case .stepThree:
            state.createGame.selectionCreateGame.wrappedValue = .stepTwo
        case .stepFour:
            state.createGame.selectionCreateGame.wrappedValue = .stepThree
        case .stepFive:
            state.createGame.selectionCreateGame.wrappedValue = .stepFour
        }
    }
}

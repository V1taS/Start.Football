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
    func refreshProgressBar(state: Binding<AppState.AppData.CreateGame>)
    func nextStepProgressBar(state: Binding<AppState.AppData.CreateGame>)
    func backStepProgressBar(state: Binding<AppState.AppData.CreateGame>)
}

struct CreateGameInteractorImpl: CreateGameInteractor {
    func refreshProgressBar(state: Binding<AppState.AppData.CreateGame>) {
        switch state.selectionCreateGame.wrappedValue {
        case .stepOne:
            state.progressValue.wrappedValue = 0.0
        case .stepTwo:
            state.progressValue.wrappedValue = 0.25
        case .stepThree:
            state.progressValue.wrappedValue = 0.50
        case .stepFour:
            state.progressValue.wrappedValue = 0.75
        case .stepFive:
            state.progressValue.wrappedValue = 1.0
        }
    }
    
    func nextStepProgressBar(state: Binding<AppState.AppData.CreateGame>)  {
        switch state.selectionCreateGame.wrappedValue {
        case .stepOne:
            state.selectionCreateGame.wrappedValue = .stepTwo
        case .stepTwo:
            state.selectionCreateGame.wrappedValue = .stepThree
        case .stepThree:
            state.selectionCreateGame.wrappedValue = .stepFour
        case .stepFour:
            state.selectionCreateGame.wrappedValue = .stepFive
        case .stepFive:
            break
        }
    }
    
    func backStepProgressBar(state: Binding<AppState.AppData.CreateGame>)  {
        switch state.selectionCreateGame.wrappedValue {
        case .stepOne:
            state.selectionCreateGame.wrappedValue = .stepOne
        case .stepTwo:
            state.selectionCreateGame.wrappedValue = .stepOne
        case .stepThree:
            state.selectionCreateGame.wrappedValue = .stepTwo
        case .stepFour:
            state.selectionCreateGame.wrappedValue = .stepThree
        case .stepFive:
            state.selectionCreateGame.wrappedValue = .stepFour
        }
    }
}

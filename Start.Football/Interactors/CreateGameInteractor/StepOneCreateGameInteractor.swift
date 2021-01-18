//
//  StepOneCreateGameInteractor.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 18.01.2021.
//

import SwiftUI

protocol StepOneCreateGameInteractor {
    func showTimeInTextfield(state: Binding<AppState.AppData.CreateGame>)
    func showDayInTextfield(state: Binding<AppState.AppData.CreateGame>)
}

extension CreateGameInteractorImpl {
    func showTimeInTextfield(state: Binding<AppState.AppData.CreateGame>) {
        state.oneTime.wrappedValue = GetDateStringFromDate
            .shared.getTimeString(date: state.currentDate.wrappedValue)
    }
    
    func showDayInTextfield(state: Binding<AppState.AppData.CreateGame>) {
        state.oneDay.wrappedValue = GetDateStringFromDate
            .shared.getDateString(date: state.currentDate.wrappedValue)
    }
    
}

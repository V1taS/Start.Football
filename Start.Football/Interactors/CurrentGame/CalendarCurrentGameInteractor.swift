//
//  CalendarCurrentGameInteractor.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 26.01.2021.
//

import Combine
import SwiftUI

protocol CalendarCurrentGameInteractor {
    func timeString(date: Date) -> String
    func fullDateString(date: Date) -> String
    func showDaysInRegularCalendar(state: Binding<AppState.AppData>, game: Game)
    func showOneDayInRegularCalendar(state: Binding<AppState.AppData>, game: Game)
}

extension CurrentGameInteractorImpl {
    func timeString(date: Date) -> String {
        GetDateStringFromDate.shared.getTimeString(date: date)
    }
    
    func fullDateString(date: Date) -> String {
        GetDateStringFromDate.shared.getDateStringFull(date: date).firstUppercased
    }
    
    func showDaysInRegularCalendar(state: Binding<AppState.AppData>, game: Game) {
        state.currentGame.mo.wrappedValue = game.listGameRegularGame[0]
        state.currentGame.tu.wrappedValue = game.listGameRegularGame[1]
        state.currentGame.we.wrappedValue = game.listGameRegularGame[2]
        state.currentGame.th.wrappedValue = game.listGameRegularGame[3]
        state.currentGame.fr.wrappedValue = game.listGameRegularGame[4]
        state.currentGame.sa.wrappedValue = game.listGameRegularGame[5]
        state.currentGame.su.wrappedValue = game.listGameRegularGame[6]
    }
    
    func showOneDayInRegularCalendar(state: Binding<AppState.AppData>, game: Game) {
        if GetDateStringFromDate.shared.getDateString(date: game.oneGameDate).firstUppercased == "Понедельник" {
            state.currentGame.mo.wrappedValue = true
        }
        
        if GetDateStringFromDate.shared.getDateString(date: game.oneGameDate).firstUppercased == "Вторник" {
            state.currentGame.tu.wrappedValue = true
        }
        
        if GetDateStringFromDate.shared.getDateString(date: game.oneGameDate).firstUppercased == "Среда" {
            state.currentGame.we.wrappedValue = true
        }
        
        if GetDateStringFromDate.shared.getDateString(date: game.oneGameDate).firstUppercased == "Четверг" {
            state.currentGame.th.wrappedValue = true
        }
        
        if GetDateStringFromDate.shared.getDateString(date: game.oneGameDate).firstUppercased == "Пятница" {
            state.currentGame.fr.wrappedValue = true
        }
        
        if GetDateStringFromDate.shared.getDateString(date: game.oneGameDate).firstUppercased == "Суббота" {
            state.currentGame.sa.wrappedValue = true
        }
        
        if GetDateStringFromDate.shared.getDateString(date: game.oneGameDate).firstUppercased == "Воскресенье" {
            state.currentGame.su.wrappedValue = true
        }
    }
}

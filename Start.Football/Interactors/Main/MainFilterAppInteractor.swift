//
//  MainFilterAppInteractor.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 20.01.2021.
//

import Combine
import SwiftUI

protocol MainFilterAppInteractor {
    func selectMiniFootball(state: Binding<AppState.AppData>)
    func selectFootball(state: Binding<AppState.AppData>)
    func selectFootsal(state: Binding<AppState.AppData>)
    
    func selectStreet(state: Binding<AppState.AppData>)
    func selectManege(state: Binding<AppState.AppData>)
    func selectHall(state: Binding<AppState.AppData>)
}

// MARK: Type Game
extension MainAppInteractorImpl {
    func selectMiniFootball(state: Binding<AppState.AppData>) {
        state.main.filter.miniFootball.wrappedValue = true
        state.main.filter.football.wrappedValue = false
        state.main.filter.footsal.wrappedValue = false
    }
    
    func selectFootball(state: Binding<AppState.AppData>) {
        state.main.filter.football.wrappedValue = true
        state.main.filter.miniFootball.wrappedValue = false
        state.main.filter.footsal.wrappedValue = false
    }
    
    func selectFootsal(state: Binding<AppState.AppData>) {
        state.main.filter.footsal.wrappedValue = true
        state.main.filter.miniFootball.wrappedValue = false
        state.main.filter.football.wrappedValue = false
    }
}

// MARK: Place Play
extension MainAppInteractorImpl {
    func selectStreet(state: Binding<AppState.AppData>) {
        state.main.filter.street.wrappedValue = true
        state.main.filter.manege.wrappedValue = false
        state.main.filter.hall.wrappedValue = false
    }
    
    func selectManege(state: Binding<AppState.AppData>) {
        state.main.filter.manege.wrappedValue = true
        state.main.filter.street.wrappedValue = false
        state.main.filter.hall.wrappedValue = false
    }
    
    func selectHall(state: Binding<AppState.AppData>) {
        state.main.filter.manege.wrappedValue = false
        state.main.filter.street.wrappedValue = false
        state.main.filter.hall.wrappedValue = true
    }
}

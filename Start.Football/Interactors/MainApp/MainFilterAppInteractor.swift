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
        state.main.miniFootball.wrappedValue = true
        state.main.football.wrappedValue = false
        state.main.footsal.wrappedValue = false
    }
    
    func selectFootball(state: Binding<AppState.AppData>) {
        state.main.football.wrappedValue = true
        state.main.miniFootball.wrappedValue = false
        state.main.footsal.wrappedValue = false
    }
    
    func selectFootsal(state: Binding<AppState.AppData>) {
        state.main.footsal.wrappedValue = true
        state.main.miniFootball.wrappedValue = false
        state.main.football.wrappedValue = false
    }
}

// MARK: Place Play
extension MainAppInteractorImpl {
    func selectStreet(state: Binding<AppState.AppData>) {
        state.main.street.wrappedValue = true
        state.main.manege.wrappedValue = false
        state.main.hall.wrappedValue = false
    }
    
    func selectManege(state: Binding<AppState.AppData>) {
        state.main.manege.wrappedValue = true
        state.main.street.wrappedValue = false
        state.main.hall.wrappedValue = false
    }
    
    func selectHall(state: Binding<AppState.AppData>) {
        state.main.manege.wrappedValue = false
        state.main.street.wrappedValue = false
        state.main.hall.wrappedValue = true
    }
}

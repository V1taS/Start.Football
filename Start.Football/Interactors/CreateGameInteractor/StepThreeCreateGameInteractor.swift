//
//  StepThreeCreateGameInteractor.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 18.01.2021.
//

import SwiftUI

protocol StepThreeCreateGameInteractor {
    func selectMiniFootball(state: Binding<AppState.AppData>)
    func selectFootball(state: Binding<AppState.AppData>)
    func selectFootsal(state: Binding<AppState.AppData>)
    
    func selectStreet(state: Binding<AppState.AppData>)
    func selectManege(state: Binding<AppState.AppData>)
    func selectHall(state: Binding<AppState.AppData>)
    
    func selectParquet(state: Binding<AppState.AppData>)
    func selectGrass(state: Binding<AppState.AppData>)
    func selectCaoutchouc(state: Binding<AppState.AppData>)
    
    func selectSynthetics(state: Binding<AppState.AppData>)
    func selectHair(state: Binding<AppState.AppData>)
    func selectCrumb(state: Binding<AppState.AppData>)
    
    func paidCity(state: Binding<AppState.AppData>)
    func paidOnTheTerritory(state: Binding<AppState.AppData>)
    func freeOnTheTerritory(state: Binding<AppState.AppData>)
    func freeCity(state: Binding<AppState.AppData>)
    
    func oneTime(state: Binding<AppState.AppData>)
    func inAnHour(state: Binding<AppState.AppData>)
    func non(state: Binding<AppState.AppData>)
}

// MARK: Type Game
extension CreateGameInteractorImpl {
    func selectMiniFootball(state: Binding<AppState.AppData>) {
        state.createGame.miniFootball.wrappedValue = true
        state.createGame.usualFootball.wrappedValue = false
        state.createGame.footsal.wrappedValue = false
    }
    
    func selectFootball(state: Binding<AppState.AppData>) {
        state.createGame.usualFootball.wrappedValue = true
        state.createGame.miniFootball.wrappedValue = false
        state.createGame.footsal.wrappedValue = false
    }
    
    func selectFootsal(state: Binding<AppState.AppData>) {
        state.createGame.footsal.wrappedValue = true
        state.createGame.miniFootball.wrappedValue = false
        state.createGame.usualFootball.wrappedValue = false
    }
}

// MARK: Place Play
extension CreateGameInteractorImpl {
    func selectStreet(state: Binding<AppState.AppData>) {
        state.createGame.street.wrappedValue = true
        state.createGame.manege.wrappedValue = false
        state.createGame.hall.wrappedValue = false
    }
    
    func selectManege(state: Binding<AppState.AppData>) {
        state.createGame.manege.wrappedValue = true
        state.createGame.street.wrappedValue = false
        state.createGame.hall.wrappedValue = false
    }
    
    func selectHall(state: Binding<AppState.AppData>) {
        state.createGame.manege.wrappedValue = false
        state.createGame.street.wrappedValue = false
        state.createGame.hall.wrappedValue = true
    }
}

// MARK: Type Field
extension CreateGameInteractorImpl {
    func selectParquet(state: Binding<AppState.AppData>) {
        state.createGame.parquet.wrappedValue = true
        state.createGame.grass.wrappedValue = false
        state.createGame.caoutchouc.wrappedValue = false
    }
    
    func selectGrass(state: Binding<AppState.AppData>) {
        state.createGame.parquet.wrappedValue = false
        state.createGame.grass.wrappedValue = true
        state.createGame.caoutchouc.wrappedValue = false
    }
    
    func selectCaoutchouc(state: Binding<AppState.AppData>) {
        state.createGame.parquet.wrappedValue = false
        state.createGame.grass.wrappedValue = false
        state.createGame.caoutchouc.wrappedValue = true
    }
}

// MARK: Coating Properties
extension CreateGameInteractorImpl {
    func selectSynthetics(state: Binding<AppState.AppData>) {
        state.createGame.synthetics.wrappedValue = true
        state.createGame.hair.wrappedValue = false
        state.createGame.crumb.wrappedValue = false
    }
    
    func selectHair(state: Binding<AppState.AppData>) {
        state.createGame.synthetics.wrappedValue = false
        state.createGame.hair.wrappedValue = true
        state.createGame.crumb.wrappedValue = false
    }
    
    func selectCrumb(state: Binding<AppState.AppData>) {
        state.createGame.synthetics.wrappedValue = false
        state.createGame.hair.wrappedValue = false
        state.createGame.crumb.wrappedValue = true
    }
    
    // MARK: Type of parking
    func paidCity(state: Binding<AppState.AppData>) {
        state.createGame.typeOfParking.wrappedValue = .paidCity
    }
    
    func paidOnTheTerritory(state: Binding<AppState.AppData>) {
        state.createGame.typeOfParking.wrappedValue = .paidOnTheTerritory
    }
    
    func freeOnTheTerritory(state: Binding<AppState.AppData>) {
        state.createGame.typeOfParking.wrappedValue = .freeOnTheTerritory
    }
    
    func freeCity(state: Binding<AppState.AppData>) {
        state.createGame.typeOfParking.wrappedValue = .freeCity
    }
    
    // MARK: Payment for parking
    func oneTime(state: Binding<AppState.AppData>) {
        state.createGame.paymentForParking.wrappedValue = .oneTime
    }
    
    func inAnHour(state: Binding<AppState.AppData>) {
        state.createGame.paymentForParking.wrappedValue = .inAnHour
    }
    
    func non(state: Binding<AppState.AppData>) {
        state.createGame.paymentForParking.wrappedValue = .non
    }
}

//
//  StepThreeCreateGameInteractor.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 18.01.2021.
//

import SwiftUI

protocol StepThreeCreateGameInteractor {
    func selectMiniFootball(state: Binding<AppState.AppData.CreateGame>)
    func selectFootball(state: Binding<AppState.AppData.CreateGame>)
    func selectFootsal(state: Binding<AppState.AppData.CreateGame>)
    
    func selectStreet(state: Binding<AppState.AppData.CreateGame>)
    func selectManege(state: Binding<AppState.AppData.CreateGame>)
    func selectHall(state: Binding<AppState.AppData.CreateGame>)
    
    func selectParquet(state: Binding<AppState.AppData.CreateGame>)
    func selectGrass(state: Binding<AppState.AppData.CreateGame>)
    func selectCaoutchouc(state: Binding<AppState.AppData.CreateGame>)
    
    func selectSynthetics(state: Binding<AppState.AppData.CreateGame>)
    func selectHair(state: Binding<AppState.AppData.CreateGame>)
    func selectCrumb(state: Binding<AppState.AppData.CreateGame>)
    
    func paidCity(state: Binding<AppState.AppData.CreateGame>)
    func paidOnTheTerritory(state: Binding<AppState.AppData.CreateGame>)
    func freeOnTheTerritory(state: Binding<AppState.AppData.CreateGame>)
    func freeCity(state: Binding<AppState.AppData.CreateGame>)
    
    func oneTime(state: Binding<AppState.AppData.CreateGame>)
    func inAnHour(state: Binding<AppState.AppData.CreateGame>)
    func non(state: Binding<AppState.AppData.CreateGame>)
}

// MARK: Type Game
extension CreateGameInteractorImpl {
    func selectMiniFootball(state: Binding<AppState.AppData.CreateGame>) {
        state.miniFootball.wrappedValue = true
        state.football.wrappedValue = false
        state.footsal.wrappedValue = false
    }
    
    func selectFootball(state: Binding<AppState.AppData.CreateGame>) {
        state.football.wrappedValue = true
        state.miniFootball.wrappedValue = false
        state.footsal.wrappedValue = false
    }
    
    func selectFootsal(state: Binding<AppState.AppData.CreateGame>) {
        state.footsal.wrappedValue = true
        state.miniFootball.wrappedValue = false
        state.football.wrappedValue = false
    }
}

// MARK: Place Play
extension CreateGameInteractorImpl {
    func selectStreet(state: Binding<AppState.AppData.CreateGame>) {
        state.street.wrappedValue = true
        state.manege.wrappedValue = false
        state.hall.wrappedValue = false
    }
    
    func selectManege(state: Binding<AppState.AppData.CreateGame>) {
        state.manege.wrappedValue = true
        state.street.wrappedValue = false
        state.hall.wrappedValue = false
    }
    
    func selectHall(state: Binding<AppState.AppData.CreateGame>) {
        state.manege.wrappedValue = false
        state.street.wrappedValue = false
        state.hall.wrappedValue = true
    }
}

// MARK: Type Field
extension CreateGameInteractorImpl {
    func selectParquet(state: Binding<AppState.AppData.CreateGame>) {
        state.parquet.wrappedValue = true
        state.grass.wrappedValue = false
        state.caoutchouc.wrappedValue = false
    }
    
    func selectGrass(state: Binding<AppState.AppData.CreateGame>) {
        state.parquet.wrappedValue = false
        state.grass.wrappedValue = true
        state.caoutchouc.wrappedValue = false
    }
    
    func selectCaoutchouc(state: Binding<AppState.AppData.CreateGame>) {
        state.parquet.wrappedValue = false
        state.grass.wrappedValue = false
        state.caoutchouc.wrappedValue = true
    }
}

// MARK: Coating Properties
extension CreateGameInteractorImpl {
    func selectSynthetics(state: Binding<AppState.AppData.CreateGame>) {
        state.synthetics.wrappedValue = true
        state.hair.wrappedValue = false
        state.crumb.wrappedValue = false
    }
    
    func selectHair(state: Binding<AppState.AppData.CreateGame>) {
        state.synthetics.wrappedValue = false
        state.hair.wrappedValue = true
        state.crumb.wrappedValue = false
    }
    
    func selectCrumb(state: Binding<AppState.AppData.CreateGame>) {
        state.synthetics.wrappedValue = false
        state.hair.wrappedValue = false
        state.crumb.wrappedValue = true
    }
    
    // MARK: Type of parking
    func paidCity(state: Binding<AppState.AppData.CreateGame>) {
        state.typeOfParking.wrappedValue = .paidCity
    }
    
    func paidOnTheTerritory(state: Binding<AppState.AppData.CreateGame>) {
        state.typeOfParking.wrappedValue = .paidOnTheTerritory
    }
    
    func freeOnTheTerritory(state: Binding<AppState.AppData.CreateGame>) {
        state.typeOfParking.wrappedValue = .freeOnTheTerritory
    }
    
    func freeCity(state: Binding<AppState.AppData.CreateGame>) {
        state.typeOfParking.wrappedValue = .freeCity
    }
    
    // MARK: Payment for parking
    func oneTime(state: Binding<AppState.AppData.CreateGame>) {
        state.paymentForParking.wrappedValue = .oneTime
    }
    
    func inAnHour(state: Binding<AppState.AppData.CreateGame>) {
        state.paymentForParking.wrappedValue = .inAnHour
    }
    
    func non(state: Binding<AppState.AppData.CreateGame>) {
        state.paymentForParking.wrappedValue = .non
    }
}

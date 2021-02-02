//
//  EditGameInteractor.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 01.02.2021.
//

import Combine
import SwiftUI

protocol EditGameInteractor {
    func dismissSheetParkingButton(state: Binding<AppState.AppData>)
    func appendCurrentGameToMyGameAndAllGame(state: Binding<AppState.AppData>, game: Game)
    func currentGame(state: Binding<AppState.AppData>) -> Game
    func validNameGame(state: Binding<AppState.AppData>)
    func validAddressGame(state: Binding<AppState.AppData>)
    func validCostGame(state: Binding<AppState.AppData>)
    func noSelectionRegularGame(state: Binding<AppState.AppData>)
    func yesSelectionRegularGame(state: Binding<AppState.AppData>)
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
    func dressingRooms(state: Binding<AppState.AppData>)
    func showers(state: Binding<AppState.AppData>)
}

struct EditGameInteractorImpl: EditGameInteractor {
    func dismissSheetParkingButton(state: Binding<AppState.AppData>) {
        if state.editGame.showParking.wrappedValue {
            state.editGame.showParking.wrappedValue = false
        }
    }
    
    func appendCurrentGameToMyGameAndAllGame(state: Binding<AppState.AppData>, game: Game) {
        state.main.listMyGames.wrappedValue.append(game)
        state.main.listAllGames.wrappedValue.append(game)
    }
    
    func currentGame(state: Binding<AppState.AppData>) -> Game {
        Game(
            id: UUID().uuidString,
            name: state.editGame.nameGame.wrappedValue,
            imageStringURL: "",
            gameNumber: "\(state.main.listAllGames.wrappedValue.count + 1)",
            address: state.editGame.addressGame.wrappedValue,
            costGame: state.editGame.costGame.wrappedValue,
            oneGameDate: state.editGame.currentDate.wrappedValue,
            regularGame: state.editGame.selectionRegularGame.wrappedValue.rawValue,
            listGameRegularGame: state.editGame.listGame.wrappedValue,
            listDateRegularGame: state.editGame.listDate.wrappedValue,
            miniFootball: state.editGame.miniFootball.wrappedValue,
            usualFootball: state.editGame.usualFootball.wrappedValue,
            footsal: state.editGame.footsal.wrappedValue,
            street: state.editGame.street.wrappedValue,
            manege: state.editGame.manege.wrappedValue,
            hall: state.editGame.hall.wrappedValue,
            parquet: state.editGame.parquet.wrappedValue,
            grass: state.editGame.grass.wrappedValue,
            caoutchouc: state.editGame.caoutchouc.wrappedValue,
            synthetics: state.editGame.synthetics.wrappedValue,
            hair: state.editGame.hair.wrappedValue,
            crumb: state.editGame.crumb.wrappedValue,
            firstTeamCount: state.editGame.firstValue.wrappedValue,
            secondTeamCount: state.editGame.secondValue.wrappedValue,
            maxCountTeams: state.editGame.maxCountTeams.wrappedValue,
            maxCountPlayers: state.editGame.maxCountPlayers.wrappedValue,
            maxReservePlayers: state.editGame.maxReservePlayers.wrappedValue,
            privacyGame: state.editGame.privacyGame.wrappedValue.rawValue,
            dressingRooms: state.editGame.dressingRooms.wrappedValue,
            showers: state.editGame.showers.wrappedValue,
            typeOfParking: state.editGame.typeOfParking.wrappedValue.rawValue,
            paymentForParking: state.editGame.paymentForParking.wrappedValue.rawValue,
            parkingCost: state.editGame.parkingCost.wrappedValue,
            descriptionGame: state.editGame.descriptionGame.wrappedValue,
            ownRulesGame: state.editGame.ownRules.wrappedValue,
            commentFromOrganizerGame: state.editGame.commentFromOrganizer.wrappedValue,
            howMuchTimeDoWePlay: state.editGame.howMuchTimeDoWePlay.wrappedValue
        )
    }
    
    func validNameGame(state: Binding<AppState.AppData>) {
            if state.editGame.nameGame.wrappedValue.isEmpty {
                state.editGame.nameGameSuccess.wrappedValue = false
            } else {
                state.editGame.nameGameSuccess.wrappedValue = true
            }
            
            if state.editGame.nameGame.wrappedValue.count <= 3 {
                state.editGame.nameGameSuccess.wrappedValue = false
            } else {
                state.editGame.nameGameSuccess.wrappedValue = true
            }
    }
    
    func validAddressGame(state: Binding<AppState.AppData>) {
            if state.editGame.addressGame.wrappedValue.isEmpty {
                state.editGame.addressGameSuccess.wrappedValue = false
            } else {
                state.editGame.addressGameSuccess.wrappedValue = true
            }
            
            if state.editGame.addressGame.wrappedValue.count <= 5 {
                state.editGame.addressGameSuccess.wrappedValue = false
            } else {
                state.editGame.addressGameSuccess.wrappedValue = true
            }
    }
    
    func validCostGame(state: Binding<AppState.AppData>) {
            if state.editGame.costGame.wrappedValue.isEmpty {
                state.editGame.costGameSuccess.wrappedValue = false
            } else {
                state.editGame.costGameSuccess.wrappedValue = true
            }
    }
    
    func noSelectionRegularGame(state: Binding<AppState.AppData>) {
        state.editGame.selectionRegularGame.wrappedValue = .no
    }
    
    func yesSelectionRegularGame(state: Binding<AppState.AppData>) {
        state.editGame.selectionRegularGame.wrappedValue = .yes
    }
    
    func selectMiniFootball(state: Binding<AppState.AppData>) {
        state.editGame.miniFootball.wrappedValue = true
        state.editGame.usualFootball.wrappedValue = false
        state.editGame.footsal.wrappedValue = false
    }
    
    func selectFootball(state: Binding<AppState.AppData>) {
        state.editGame.usualFootball.wrappedValue = true
        state.editGame.miniFootball.wrappedValue = false
        state.editGame.footsal.wrappedValue = false
    }
    
    func selectFootsal(state: Binding<AppState.AppData>) {
        state.editGame.footsal.wrappedValue = true
        state.editGame.miniFootball.wrappedValue = false
        state.editGame.usualFootball.wrappedValue = false
    }
}

// MARK: Place Play
extension EditGameInteractorImpl {
    func selectStreet(state: Binding<AppState.AppData>) {
        state.editGame.street.wrappedValue = true
        state.editGame.manege.wrappedValue = false
        state.editGame.hall.wrappedValue = false
    }
    
    func selectManege(state: Binding<AppState.AppData>) {
        state.editGame.manege.wrappedValue = true
        state.editGame.street.wrappedValue = false
        state.editGame.hall.wrappedValue = false
    }
    
    func selectHall(state: Binding<AppState.AppData>) {
        state.editGame.manege.wrappedValue = false
        state.editGame.street.wrappedValue = false
        state.editGame.hall.wrappedValue = true
    }
}

// MARK: Type Field
extension EditGameInteractorImpl {
    func selectParquet(state: Binding<AppState.AppData>) {
        state.editGame.parquet.wrappedValue = true
        state.editGame.grass.wrappedValue = false
        state.editGame.caoutchouc.wrappedValue = false
    }
    
    func selectGrass(state: Binding<AppState.AppData>) {
        state.editGame.parquet.wrappedValue = false
        state.editGame.grass.wrappedValue = true
        state.editGame.caoutchouc.wrappedValue = false
    }
    
    func selectCaoutchouc(state: Binding<AppState.AppData>) {
        state.editGame.parquet.wrappedValue = false
        state.editGame.grass.wrappedValue = false
        state.editGame.caoutchouc.wrappedValue = true
    }
}

// MARK: Coating Properties
extension EditGameInteractorImpl {
    func selectSynthetics(state: Binding<AppState.AppData>) {
        state.editGame.synthetics.wrappedValue = true
        state.editGame.hair.wrappedValue = false
        state.editGame.crumb.wrappedValue = false
    }
    
    func selectHair(state: Binding<AppState.AppData>) {
        state.editGame.synthetics.wrappedValue = false
        state.editGame.hair.wrappedValue = true
        state.editGame.crumb.wrappedValue = false
    }
    
    func selectCrumb(state: Binding<AppState.AppData>) {
        state.editGame.synthetics.wrappedValue = false
        state.editGame.hair.wrappedValue = false
        state.editGame.crumb.wrappedValue = true
    }
    
    // MARK: Type of parking
    func paidCity(state: Binding<AppState.AppData>) {
        state.editGame.typeOfParking.wrappedValue = .paidCity
    }
    
    func paidOnTheTerritory(state: Binding<AppState.AppData>) {
        state.editGame.typeOfParking.wrappedValue = .paidOnTheTerritory
    }
    
    func freeOnTheTerritory(state: Binding<AppState.AppData>) {
        state.editGame.typeOfParking.wrappedValue = .freeOnTheTerritory
    }
    
    func freeCity(state: Binding<AppState.AppData>) {
        state.editGame.typeOfParking.wrappedValue = .freeCity
    }
    
    // MARK: Payment for parking
    func oneTime(state: Binding<AppState.AppData>) {
        state.editGame.paymentForParking.wrappedValue = .oneTime
    }
    
    func inAnHour(state: Binding<AppState.AppData>) {
        state.editGame.paymentForParking.wrappedValue = .inAnHour
    }
    
    func non(state: Binding<AppState.AppData>) {
        state.editGame.paymentForParking.wrappedValue = .non
    }
    
    func dressingRooms(state: Binding<AppState.AppData>) {
        state.editGame.dressingRooms.wrappedValue.toggle()
    }
    
    func showers(state: Binding<AppState.AppData>) {
        state.editGame.showers.wrappedValue.toggle()
    }
}

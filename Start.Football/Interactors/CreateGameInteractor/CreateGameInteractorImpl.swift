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
    func dismissSheetParkingButton(state: Binding<AppState.AppData>)
    func appendCurrentGameToMyGameAndAllGame(state: Binding<AppState.AppData>, game: Game)
    func clearCreateGame(state: Binding<AppState.AppData>)
    func currentGame(state: Binding<AppState.AppData>) -> Game
    func validNameGame(state: Binding<AppState.AppData>)
    func validAddressGame(state: Binding<AppState.AppData>)
    func validCostGame(state: Binding<AppState.AppData>)
    func disableNextStepButton(state: Binding<AppState.AppData>) -> Bool
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
    
    func dismissSheetParkingButton(state: Binding<AppState.AppData>) {
        if state.createGame.showParking.wrappedValue {
            state.createGame.showParking.wrappedValue = false
        }
    }
    
    func appendCurrentGameToMyGameAndAllGame(state: Binding<AppState.AppData>, game: Game) {
        state.main.listMyGames.wrappedValue.append(game)
        state.main.listAllGames.wrappedValue.append(game)
    }
    
    func clearCreateGame(state: Binding<AppState.AppData>) {
        state.createGame.addressGame.wrappedValue = ""
        
        state.createGame.selectionCreateGame.wrappedValue = .stepOne
        state.createGame.progressValue.wrappedValue = 0.0
        
        // MARK: - Step 1
        state.createGame.nameGame.wrappedValue = ""
        state.createGame.addressGame.wrappedValue = ""
        state.createGame.costGame.wrappedValue = ""
        
        
        state.createGame.currentDate.wrappedValue = Date()
        state.createGame.currentTimeHasBeenChanged.wrappedValue = false
        state.createGame.currentDateHasBeenChanged.wrappedValue = false
        
        // MARK: - Step 2
        state.createGame.selectionRegularGame.wrappedValue = .no
        
        // MARK: Day Of Week
        state.createGame.listGame.wrappedValue = [false, false, false, false, false, false, false]
        state.createGame.listDate.wrappedValue = [Date(), Date(), Date(), Date(), Date(), Date(), Date()]
        state.createGame.anyTimeHasBeenChanged.wrappedValue = false
        
        // MARK: - Step 3
        // MARK: Type Game
        state.createGame.miniFootball.wrappedValue = true
        state.createGame.usualFootball.wrappedValue = false
        state.createGame.footsal.wrappedValue = false
        
        // MARK: Place Play
        state.createGame.street.wrappedValue = true
        state.createGame.manege.wrappedValue = false
        state.createGame.hall.wrappedValue = false
        
        // MARK: Type Field
        state.createGame.parquet.wrappedValue = false
        state.createGame.grass.wrappedValue = true
        state.createGame.caoutchouc.wrappedValue = false
        
        // MARK: Coating Properties
        state.createGame.synthetics.wrappedValue = false
        state.createGame.hair.wrappedValue = false
        state.createGame.crumb.wrappedValue = true
        
        // MARK: Формат игры
        state.createGame.firstValue.wrappedValue = "5"
        state.createGame.secondValue.wrappedValue = "5"
        
        // MARK: Кол-во команд, игроков
        state.createGame.maxCountTeams.wrappedValue = 3
        state.createGame.maxCountPlayers.wrappedValue = 15
        state.createGame.maxReservePlayers.wrappedValue = 3
        
        // MARK: Приватность
        state.createGame.privacyGame.wrappedValue = .open
        
        // MARK: Удобства
        state.createGame.dressingRooms.wrappedValue = false
        state.createGame.showers.wrappedValue = false
        
        // MARK: Парковка
        state.createGame.showParking.wrappedValue = false
        state.createGame.typeOfParking.wrappedValue = .freeCity
        state.createGame.paymentForParking.wrappedValue = .non
        state.createGame.parkingCost.wrappedValue = ""
    }
    
    func currentGame(state: Binding<AppState.AppData>) -> Game {
        Game(
            id: UUID().uuidString,
            name: state.createGame.nameGame.wrappedValue,
            imageStringURL: "",
            gameNumber: "\(state.main.listAllGames.wrappedValue.count + 1)",
            address: state.createGame.addressGame.wrappedValue,
            costGame: state.createGame.costGame.wrappedValue,
            oneGameDate: state.createGame.currentDate.wrappedValue,
            regularGame: state.createGame.selectionRegularGame.wrappedValue.rawValue,
            listGameRegularGame: state.createGame.listGame.wrappedValue,
            listDateRegularGame: state.createGame.listDate.wrappedValue,
            miniFootball: state.createGame.miniFootball.wrappedValue,
            usualFootball: state.createGame.usualFootball.wrappedValue,
            footsal: state.createGame.footsal.wrappedValue,
            street: state.createGame.street.wrappedValue,
            manege: state.createGame.manege.wrappedValue,
            hall: state.createGame.hall.wrappedValue,
            parquet: state.createGame.parquet.wrappedValue,
            grass: state.createGame.grass.wrappedValue,
            caoutchouc: state.createGame.caoutchouc.wrappedValue,
            synthetics: state.createGame.synthetics.wrappedValue,
            hair: state.createGame.hair.wrappedValue,
            crumb: state.createGame.crumb.wrappedValue,
            firstTeamCount: state.createGame.firstValue.wrappedValue,
            secondTeamCount: state.createGame.secondValue.wrappedValue,
            maxCountTeams: state.createGame.maxCountTeams.wrappedValue,
            maxCountPlayers: state.createGame.maxCountPlayers.wrappedValue,
            maxReservePlayers: state.createGame.maxReservePlayers.wrappedValue,
            privacyGame: state.createGame.privacyGame.wrappedValue.rawValue,
            dressingRooms: state.createGame.dressingRooms.wrappedValue,
            showers: state.createGame.showers.wrappedValue,
            typeOfParking: state.createGame.typeOfParking.wrappedValue.rawValue,
            paymentForParking: state.createGame.paymentForParking.wrappedValue.rawValue,
            parkingCost: state.createGame.parkingCost.wrappedValue,
            descriptionGame: state.createGame.descriptionGame.wrappedValue,
            ownRulesGame: state.createGame.ownRules.wrappedValue,
            commentFromOrganizerGame: state.createGame.commentFromOrganizer.wrappedValue
        )
    }
    
    func validNameGame(state: Binding<AppState.AppData>) {
        if state.createGame.selectionCreateGame.wrappedValue == .stepOne {
            if state.createGame.nameGame.wrappedValue.isEmpty {
                state.createGame.nameGameSuccess.wrappedValue = false
            } else {
                state.createGame.nameGameSuccess.wrappedValue = true
            }
            
            if state.createGame.nameGame.wrappedValue.count <= 3 {
                state.createGame.nameGameSuccess.wrappedValue = false
            } else {
                state.createGame.nameGameSuccess.wrappedValue = true
            }
        }
    }
    
    func validAddressGame(state: Binding<AppState.AppData>) {
        if state.createGame.selectionCreateGame.wrappedValue == .stepOne {
            if state.createGame.addressGame.wrappedValue.isEmpty {
                state.createGame.addressGameSuccess.wrappedValue = false
            } else {
                state.createGame.addressGameSuccess.wrappedValue = true
            }
            
            if state.createGame.addressGame.wrappedValue.count <= 5 {
                state.createGame.addressGameSuccess.wrappedValue = false
            } else {
                state.createGame.addressGameSuccess.wrappedValue = true
            }
        }
    }
    
    func validCostGame(state: Binding<AppState.AppData>) {
        if state.createGame.selectionCreateGame.wrappedValue == .stepOne {
            if state.createGame.costGame.wrappedValue.isEmpty {
                state.createGame.costGameSuccess.wrappedValue = false
            } else {
                state.createGame.costGameSuccess.wrappedValue = true
            }
        }
    }
    
    func disableNextStepButton(state: Binding<AppState.AppData>) -> Bool {
        if state.createGame.nameGameSuccess.wrappedValue &&
            state.createGame.addressGameSuccess.wrappedValue &&
            state.createGame.costGameSuccess.wrappedValue {
            return true
        }
        return false
    }
}


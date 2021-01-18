//
//  CreateGame.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 18.01.2021.
//

import Foundation

extension AppState.AppData {
    struct CreateGame: Equatable {
        var selectionCreateGame: AppActions.CreateGame.SelectStep = .stepOne
        var progressValue: Float = 0.0
        
        // MARK: - Step 1
        var nameGame = ""
        var addressGame = ""
        var participationCost = ""
        var currentDate = Date()
        var showTimePicker = false
        var showDatePicker = false
        var oneTime = "Укажите время"
        var oneTimeTextHasBeenChanged = false
        var oneDay = "Укажите дату начала"
        var oneDayTextHasBeenChanged = false
        
        // MARK: - Step 2
        var selectionRegularGame: AppActions.CreateGame.RegularGame = .no
        
        // MARK: Day Of Week
        var mo = false
        var tu = false
        var we = false
        var th = false
        var fr = false
        var sa = false
        var su = false
        var time = "Укажите время"
        var timeTextHasBeenChanged: Bool = false
        
        // MARK: - Step 3
        
        // MARK: Type Game
        var miniFootball = true
        var football = false
        var footsal = false
        
        // MARK: Place Play
        var street = true
        var manege = false
        var hall = false
        
        // MARK: Type Field
        var parquet = false
        var grass = true
        var caoutchouc = false
        
        // MARK: Coating Properties
        var synthetics = false
        var hair = false
        var crumb = true
        
        // MARK: Формат игры
        var firstValue: String = "5"
        var secondValue: String = "5"
        
        // MARK: Кол-во команд, игроков
        var maxCountTeams: Double = 3
        var maxCountPlayers: Double = 15
        var maxReservePlayers: Double = 3
        
        // MARK: Приватность
        var privacyGame: AppActions.CreateGame.PrivacyGame = .open
        
        var dressingRooms: Bool = false
        var showers: Bool = false
        var showParkingView: Bool = false
    }
}

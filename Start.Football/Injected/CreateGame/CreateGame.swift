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
        var mo = false
        var tu = false
        var we = false
        var th = false
        var fr = false
        var sa = false
        var su = false
        var selectDayOfWeek: AppActions.CreateGame.SelectDayOfWeek = .mo
        var time = "Укажите время"
        var timeTextHasBeenChanged: Bool = false
        
        // MARK: - Step 3
        var miniFootball = false
        var football = false
        var footsal = false
        var street = false
        var manege = false
        var hall = false
        var parquet = false
        var grass = false
        var caoutchouc = false
        var synthetics = false
        var hair = false
        var crumb = false
        var firstValue: String = ""
        var secondValue: String = ""
        var maxCountTeams: Double = 0
        var maxCountPlayers: Double = 0
        var maxReservePlayers: Double = 0
        var privacyGame: AppActions.CreateGame.PrivacyGame = .open
        var selectTypeGame: AppActions.CreateGame.SelectTypeGame = .miniFootball
        var selectPlacePlay: AppActions.CreateGame.SelectPlacePlay = .street
        var selectTypeField: AppActions.CreateGame.SelectTypeField = .grass
        var selectCoatingProperties: AppActions.CreateGame.SelectCoatingProperties = .crumb
        
        var dressingRooms: Bool = false
        var showers: Bool = false
        var showParkingView: Bool = false
    }
}

//
//  EditGame.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 01.02.2021.
//

import SwiftUI

extension AppState.AppData {
    struct EditGame: Equatable {
        
        // MARK: - Step 1
        var nameGame = ""
        var nameGameSuccess = true
        
        var addressGame = ""
        var addressGameSuccess = true
        
        var costGame = ""
        var costGameSuccess = true
        
        var howMuchTimeDoWePlay = ""
        var howMuchTimeDoWePlaySuccess = true
        
        var currentDate = Date()
        var currentTimeHasBeenChanged = false
        var currentDateHasBeenChanged = false
        
        var showDatePicker = false
        var showTimePicker = false
        
        // MARK: - Step 2
        var selectionRegularGame: AppActions.CreatGameActions.RegularGame = .no
        
        // MARK: Day Of Week
        var listGame = [false, false, false, false, false, false, false]
        var listDate = [Date(), Date(), Date(), Date(), Date(), Date(), Date()]
        var anyTimeHasBeenChanged: Bool = false
        
        // MARK: - Step 3
        
        // MARK: Type Game
        var miniFootball = true
        var usualFootball = false
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
        var privacyGame: AppActions.CreatGameActions.PrivacyGame = .open
        
        // MARK: Удобства
        var dressingRooms: Bool = false
        var showers: Bool = false
        
        // MARK: Парковка
        var showParking: Bool = false
        var typeOfParking: AppActions.CreatGameActions.TypeOfParking = .freeCity
        var paymentForParking: AppActions.CreatGameActions.PaymentForParking = .non
        
        var parkingCost: String = "0"
        var parkingCostSuccess = true
        
        // MARK: - Step 4
        var descriptionGame = ""
        var ownRules = ""
        var commentFromOrganizer = ""
        
        var images = [Data]()
        
        var uiImageOne: UIImage? = nil
        var uiImageTwo: UIImage? = nil
        
        var showActionOne: Bool = false
        var showImagePickerOne: Bool = false
        
        var showActionTwo: Bool = false
        var showImagePickerTwo: Bool = false
    }
}

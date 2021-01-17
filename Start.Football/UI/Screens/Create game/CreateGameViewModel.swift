//
//  CreateGameViewModel.swift
//  Start.Football
//
//  Created by Виталий Сосин on 09.12.2020.
//

import SwiftUI
import Combine

class CreateGameViewModel: ObservableObject {
    
    // MARK: - Шкала прогресса действий
    @Published var selectionCreateGame: AppActions.CreateGame.SelectionStep = .stepOne
    @Published var progressValue: Float = 0.0
    
    // MARK: - Step 1
    @Published var nameGame = ""
    @Published var addressGame = ""
    @Published var participationCost = ""
    @Published var currentDate = Date() {
        didSet {
            oneTime = GetDateStringFromDate.shared.getTimeString(date: currentDate)
            oneDay = GetDateStringFromDate.shared.getDateString(date: currentDate)
        }
    }
    @Published var showTimePicker = false
    @Published var showDatePicker = false
    
    @Published var oneTime = "Укажите время" {
        didSet {
            oneTimeTextHasBeenChanged = true
            
            if oneTime.isEmpty {
                oneTimeTextHasBeenChanged = false
            }
        }
    }
    @Published var oneTimeTextHasBeenChanged = false
    
    @Published var oneDay = "Укажите дату начала" {
        didSet {
            oneDayTextHasBeenChanged = true
            
            if oneDay.isEmpty {
                oneDayTextHasBeenChanged = false
            }
        }
    }
    @Published var oneDayTextHasBeenChanged = false
    
    // MARK: - Step 2
    @Published var regularDate = [Date(),
                                  Date(),
                                  Date(),
                                  Date(),
                                  Date(),
                                  Date(),
                                  Date()] {
        didSet {
            regularTime = GetDateStringFromDate.shared.getTimeString(date: currentDate)
        }
    }
    @Published var selectionRegularGame: AppActions.CreateGame.SelectionRegularGame = .no
    @Published var regularTimePicker: Bool = false
    
    @Published var regularTime = "Укажите время" {
        didSet {
            timeTextHasBeenChanged = true
            
            if regularTime.isEmpty {
                timeTextHasBeenChanged = false
            }
        }
    }
    @Published var timeTextHasBeenChanged = false
    
    // MARK: -
    @Published var mo: Bool = false
    @Published var tu: Bool = false
    @Published var we: Bool = false
    @Published var th: Bool = false
    @Published var fr: Bool = false
    @Published var sa: Bool = false
    @Published var su: Bool = false

}

//
//  AppState.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 13.01.2021.
//

import SwiftUI
import Combine

struct AppState: Equatable {
    var appData = AppData()
    var routing = ViewRouting()
    var system = System()
}

extension AppState {
    struct AppData: Equatable {
        var createGame = CreateGame()
    }
}

extension AppState.AppData {
    struct CreateGame: Equatable {
        var selectionCreateGame: AppActions.CreateGame.SelectionStep = .stepOne
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
        var selectionRegularGame: AppActions.CreateGame.SelectionRegularGame = .no
        var time = "Укажите время"
        var mo: Bool = false
        var tu: Bool = false
        var we: Bool = false
        var th: Bool = false
        var fr: Bool = false
        var sa: Bool = false
        var su: Bool = false
        var timeTextHasBeenChanged: Bool = false
    }
}

extension AppState {
    struct ViewRouting: Equatable {
        
    }
}

extension AppState {
    struct System: Equatable {
        var isActive: Bool = false
        let height = UIScreen.screenHeight
        let width = UIScreen.screenWidth
    }
}

#if DEBUG
extension AppState {
    static var preview: AppState {
        var state = AppState()
        state.system.isActive = true
        return state
    }
}
#endif

func == (lhs: AppState, rhs: AppState) -> Bool {
    return lhs.routing == rhs.routing &&
        lhs.appData == rhs.appData &&
        lhs.system == rhs.system
}

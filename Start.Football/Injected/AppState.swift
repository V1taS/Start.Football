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
    var system = System()
}

extension AppState {
    struct AppData: Equatable {
        var createGame = CreateGame()
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
    return lhs.appData == rhs.appData &&
        lhs.system == rhs.system
}

//
//  Main.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 20.01.2021.
//

import Foundation

extension AppState.AppData {
    struct Main: Equatable {
        var selectionGame: AppActions.MainApp.SelectionGame = .allGame
        var showFiltrsView: Bool = false
        
        // FilterGameSheet
        var selectedData = Date()
        var timeSince = Date()
        var timeUntil = Date()
        
        var costSince = ""
        var costUntil = ""
        
        var onlyFreeGame = false
        var doNotShowGamesWithReserve = false
        var availableToAll = true
        
        // MARK: Type Game
        var miniFootball = true
        var football = false
        var footsal = false
        
        // MARK: Place Play
        var street = true
        var manege = false
        var hall = false
        
        var loadMoreGames = true
    }
}

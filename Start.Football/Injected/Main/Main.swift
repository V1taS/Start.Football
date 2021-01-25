//
//  Main.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 20.01.2021.
//

import Foundation

extension AppState.AppData {
    struct Main: Equatable {
        var map = Map()
        var filter = Filter()
        
        // Main View
        var listAllGames: [Game] = []
        var listMyGames: [Game] = []
        var currentPlayer = Player.plugPlayer
        var selectionGame: AppActions.MainActions.SelectionGame = .allGame
        var loadMoreGames = true
        var tag = 0
    }
}

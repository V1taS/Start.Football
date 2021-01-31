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
        
        var listAllGames: [Game] = Game.plugGames
        var listMyGames: [Game] = []
        
        var currentPlayer = Player.plugPlayer
        var listPlayers: [Player] = Player.plugPlayers
        
        var listNotificationGames: [NotificationGame] = NotificationGame.plugNotifications
        
        var selectionGame: AppActions.MainActions.SelectionGame = .allGame
        var loadMoreGames = true
        var tabBarMenu: AppActions.MainActions.TabBarMenu = .search
        var showCreateGameView = false
    }
}

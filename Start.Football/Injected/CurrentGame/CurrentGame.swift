//
//  CurrentGame.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 21.01.2021.
//

import Foundation

extension AppState.AppData {
    struct CurrentGame: Equatable {
        
        // Preview current game
        // Type Game
        var miniFootball = true
        var football = false
        var footsal = false
        
        // Формат игры
        var firstValue: String = "5"
        var secondValue: String = "5"
        
        // Приватность
        var privacyGame: AppActions.CreateGame.PrivacyGame = .open
        var currentDate = Date()
        var listDate = [Date(), Date()]
        var addressGame = ""
        
        // Cell current game
        var plugPhotoPlayers = ["p1", "p2", "p3", "p4", "p5"]
        // MARK: Day Of Week
        var mo = false
        var tu = false
        var we = true
        var th = false
        var fr = false
        var sa = false
        var su = true
    }
}

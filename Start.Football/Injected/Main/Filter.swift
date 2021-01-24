//
//  Filter.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 23.01.2021.
//

import Foundation

extension AppState.AppData.Main {
    struct Filter: Equatable {
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
        
        var miniFootball = true
        var football = false
        var footsal = false
        
        var street = true
        var manege = false
        var hall = false
    }
}

//
//  CellCurrentGameInteractor.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 26.01.2021.
//

import Combine
import SwiftUI

protocol CellCurrentGameInteractor {
    func typeGameString(game:Game) -> String
    func formatGame(game: Game) -> String
    func privacyGame(game: Game) -> String
}


extension CurrentGameInteractorImpl {
    func typeGameString(game:Game) -> String {
        if game.miniFootball {
            return "Мини-футбол"
        }
        
        if game.usualFootball {
            return "Футбол"
        }
        
        if game.footsal {
            return "Футзал"
        }
        return ""
    }
    
    func formatGame(game: Game) -> String {
        return "\(game.firstTeamCount) на \(game.secondTeamCount)"
    }
    
    func privacyGame(game: Game) -> String {
        if game.privacyGame == "open" {
            return "Для всех"
        }
        
        if game.privacyGame == "close" {
            return "По заявке"
        }
        return ""
    }
}

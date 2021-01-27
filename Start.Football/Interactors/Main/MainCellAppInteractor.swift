//
//  MainCellAppInteractor.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 27.01.2021.
//

import Combine
import SwiftUI

protocol MainCellAppInteractor {
    func searchDateForRegular(game: Game) -> String
    func searchDateForOneDay(game: Game, oneGameDate: Date) -> String
    func typeGameString(game: Game) -> String
    func formatGame(game: Game) -> String
    func privacyGame(game: Game) -> String
}

// MARK: Type Game
extension MainAppInteractorImpl {
    
    func searchDateForRegular(game: Game) -> String {
        if game.listGameRegularGame[0] {
            return "Ближайшая игра в Понедельник"
        }
        
        if game.listGameRegularGame[1] {
            return "Ближайшая игра во Вторник"
        }
        
        if game.listGameRegularGame[2] {
            return "Ближайшая игра в Среду"
        }
        
        if game.listGameRegularGame[3] {
            return "Ближайшая игра в Четверг"
        }
        
        if game.listGameRegularGame[4] {
            return "Ближайшая игра в Пятницу"
        }
        
        if game.listGameRegularGame[5] {
            return "Ближайшая игра в Субботу"
        }
        
        if game.listGameRegularGame[6] {
            return "Ближайшая игра в Воскресенье"
        }
        
        return "Регулярные игры"
    }
    
    func searchDateForOneDay(game: Game, oneGameDate: Date) -> String {
        let timeString = GetDateStringFromDate.shared
            .getTimeString(date: oneGameDate)
        let dateString = GetDateStringFromDate.shared
            .getDateStringFull(date: oneGameDate).firstUppercased
        return "\(dateString) в \(timeString)"
    }
    
    func typeGameString(game: Game) -> String {
        if game.miniFootball {
            return "Мини"
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

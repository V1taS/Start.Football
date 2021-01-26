//
//  AboutCurrentGameInteractor.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 26.01.2021.
//

import Combine
import SwiftUI

protocol AboutCurrentGameInteractor {
    func typeSpace(game: Game) -> String
    func typeField(game: Game) -> String
    func typeParking(game: Game) -> String
}

extension CurrentGameInteractorImpl {
    
    func typeSpace(game: Game) -> String {
        if game.street {
            return "Игра на улице"
        }
        
        if game.manege {
            return "Игра в манеже"
        }
        
        if game.hall {
            return "Игра в зале"
        }
        return ""
    }
    
    func typeField(game: Game) -> String {
        if game.parquet {
            return "Паркет"
        }
        
        if game.grass {
            if game.grass && game.synthetics {
                return "Газон (Синтетика)"
            }
            
            if game.grass && game.hair {
                return "Газон (Ворс)"
            }
            
            if game.grass && game.crumb {
                return "Газон (Крошка)"
            }
            return "Газон"
        }
        
        if game.caoutchouc {
            return "Резина"
        }
        return ""
    }
    
    func typeParking(game: Game) -> String {
        "\(game.typeOfParking) \(game.paymentForParking) \(game.parkingCost) ₽"
    }
}

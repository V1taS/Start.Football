//
//  AppActions.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 16.01.2021.
//

import Foundation

struct AppActions {
    var createGame: CreateGame
    
}

extension AppActions {
    struct CreateGame {
        enum RegularGame {
            case yes
            case no
        }
        enum SelectStep {
            case stepOne
            case stepTwo
            case stepThree
            case stepFour
            case stepFive
        }
        
        enum PrivacyGame {
            case open
            case close
        }
        
        enum TypeOfParking {
            case paidCity
            case paidOnTheTerritory
            case freeOnTheTerritory
            case freeCity
        }
        
        enum PaymentForParking {
            case oneTime
            case inAnHour
            case non
        }
    }
}

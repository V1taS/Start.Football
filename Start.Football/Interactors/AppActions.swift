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
        enum SelectionRegularGame {
            case yes
            case no
        }
        enum SelectionStep {
            case stepOne
            case stepTwo
            case stepThree
            case stepFour
            case stepFive
        }
    }
}

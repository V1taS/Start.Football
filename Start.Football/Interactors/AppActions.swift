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
        
        enum SelectTypeGame {
            case miniFootball
            case football
            case footsal
        }
        
        enum SelectPlacePlay {
            case street
            case manege
            case hall
        }
        
        enum SelectTypeField {
            case parquet
            case grass
            case caoutchouc
        }
        
        enum SelectCoatingProperties {
            case synthetics
            case hair
            case crumb
        }
        
        enum SelectDayOfWeek {
            case mo
            case tu
            case we
            case th
            case fr
            case sa
            case su
        }
    }
}

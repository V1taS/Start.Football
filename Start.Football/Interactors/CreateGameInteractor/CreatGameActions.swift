//
//  CreatGameActions.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 19.01.2021.
//

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
        
        enum TypeOfParking: String {
            case paidCity = "Платная городская"
            case paidOnTheTerritory = "Платная на территории"
            case freeOnTheTerritory = "Бесплатная на территории"
            case freeCity = "Бесплатная городская"
        }
        
        enum PaymentForParking: String {
            case oneTime = "Разово"
            case inAnHour = "За час"
            case non = ""
        }
    }
}

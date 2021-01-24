//
//  CreatGameActions.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 19.01.2021.
//

extension AppActions {
    struct CreatGameActions {
        enum RegularGame: String {
            case yes = "yes"
            case no = "no"
        }
        enum SelectStep {
            case stepOne
            case stepTwo
            case stepThree
            case stepFour
            case stepFive
        }
        
        enum PrivacyGame: String {
            case open = "open"
            case close = "close"
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

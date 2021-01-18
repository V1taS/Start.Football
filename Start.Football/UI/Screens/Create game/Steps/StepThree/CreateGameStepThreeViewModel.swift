//
//  CreateGameStepThreeViewModel.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 08.01.2021.
//

import SwiftUI
import Combine

class CreateGameStepThreeViewModel: ObservableObject {
    let height = UIScreen.screenHeight
    let width = UIScreen.screenWidth
    
    // MARK: Тип игры
    @Published var miniFootball: Bool = false {
        didSet {
            if miniFootball {
                football = false
                footsal = false
            }
        }
    }
    @Published var football: Bool = true {
        didSet {
            if football {
                miniFootball = false
                footsal = false
            }
        }
    }
    @Published var footsal: Bool = false {
        didSet {
            if footsal {
                miniFootball = false
                football = false
            }
        }
    }
    
    // MARK: Формат игры
    @Published var firstValue = "5"
    @Published var secondValue = "5"
    
    // MARK: Кол-во команд, игроков
    @Published var maxCountTeams: Double = 3
    @Published var maxCountPlayers: Double = 15
    @Published var maxReservePlayers: Double = 3
    
    // MARK: Приватность
    @Published var privacyGame: AppActions.CreateGame.PrivacyGame = .open
    
    // MARK: Где играть
    @Published var street: Bool = true {
        didSet {
            if street {
                manege = false
                hall = false
            }
        }
    }
    @Published var manege: Bool = false {
        didSet {
            if manege {
                street = false
                hall = false
            }
        }
    }
    @Published var hall: Bool = false {
        didSet {
            if hall {
                street = false
                manege = false
            }
        }
    }
    
    // MARK: Тип покрытия
    // Раздел - 1
    @Published var parquet: Bool = false {
        didSet {
            if parquet {
                grass = false
                caoutchouc = false
            }
        }
    }
    @Published var grass: Bool = true {
        didSet {
            if grass {
                parquet = false
                caoutchouc = false
            }
        }
    }
    @Published var caoutchouc: Bool = false {
        didSet {
            if caoutchouc {
                parquet = false
                grass = false
            }
        }
    }
    
    // Раздел - 2
    @Published var synthetics: Bool = false {
        didSet {
            if synthetics {
                hair = false
                crumb = false
            }
        }
    }
    @Published var hair: Bool = false {
        didSet {
            if hair {
                synthetics = false
                crumb = false
            }
        }
    }
    @Published var crumb: Bool = true {
        didSet {
            if crumb {
                synthetics = false
                hair = false
            }
        }
    }
    
    // MARK: Инфраструктура
    @Published var dressingRooms: Bool = true
    @Published var showers: Bool = false
    
    // MARK: Парковка
    @Published var showParkingView: Bool = false
}

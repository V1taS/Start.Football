//
//  Game.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 25.01.2021.
//

import Foundation

struct Game: Hashable, Decodable {
    var id: String
    var name: String
    var address: String
    var costGame: String
    var oneGameDate: Date
    var regularGame: Bool
    var listGameRegularGame: [Bool]
    var listDateRegularGame: [Date]
    var miniFootball: Bool
    var usualFootball: Bool
    var footsal: Bool
    var street: Bool
    var manege: Bool
    var hall: Bool
    var parquet: Bool
    var grass: Bool
    var caoutchouc: Bool
    var synthetics: Bool
    var hair: Bool
    var crumb: Bool
    var firstTeamCount: String
    var secondTeamCount: String
    var maxCountTeams: Double
    var maxCountPlayers: Double
    var maxReservePlayers: Double
    var privacyGame: String
    var dressingRooms: Bool
    var showers: Bool
    var typeOfParking: String
    var paymentForParking: String
    var parkingCost: String
    var descriptionGame: String
    var ownRulesGame: String
    var commentFromOrganizerGame: String
    
    init(id: String,
         name: String,
         address: String,
         costGame: String,
         oneGameDate: Date,
         regularGame: Bool,
         listGameRegularGame: [Bool],
         listDateRegularGame: [Date],
         miniFootball: Bool,
         usualFootball: Bool,
         footsal: Bool,
         street: Bool,
         manege: Bool,
         hall: Bool,
         parquet: Bool,
         grass: Bool,
         caoutchouc: Bool,
         synthetics: Bool,
         hair: Bool,
         crumb: Bool,
         firstTeamCount: String,
         secondTeamCount: String,
         maxCountTeams: Double,
         maxCountPlayers: Double,
         maxReservePlayers: Double,
         privacyGame: String,
         dressingRooms: Bool,
         showers: Bool,
         typeOfParking: String,
         paymentForParking: String,
         parkingCost: String,
         descriptionGame: String,
         ownRulesGame: String,
         commentFromOrganizerGame: String) {
        self.id = UUID().uuidString
        self.name = name
        self.address = address
        self.costGame = costGame
        self.oneGameDate = oneGameDate
        self.regularGame = regularGame
        self.listGameRegularGame = listGameRegularGame
        self.listDateRegularGame = listDateRegularGame
        self.miniFootball = miniFootball
        self.usualFootball = usualFootball
        self.footsal = footsal
        self.street = street
        self.manege = manege
        self.hall = hall
        self.parquet = parquet
        self.grass = grass
        self.caoutchouc = caoutchouc
        self.synthetics = synthetics
        self.hair = hair
        self.crumb = crumb
        self.firstTeamCount = firstTeamCount
        self.secondTeamCount = secondTeamCount
        self.maxCountTeams = maxCountTeams
        self.maxCountPlayers = maxCountPlayers
        self.maxReservePlayers = maxReservePlayers
        self.privacyGame = privacyGame
        self.dressingRooms = dressingRooms
        self.showers = showers
        self.typeOfParking = typeOfParking
        self.paymentForParking = paymentForParking
        self.parkingCost = parkingCost
        self.descriptionGame = descriptionGame
        self.ownRulesGame = ownRulesGame
        self.commentFromOrganizerGame = commentFromOrganizerGame
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: Game, rhs: Game) -> Bool {
        return lhs.id == rhs.id
    }
    
    func contains(filter: String?) -> Bool {
        guard let filter = filter else { return true }
        if filter.isEmpty { return true }
        let lowercasedFilter = filter.lowercased()
        return name.lowercased().contains(lowercasedFilter)
    }
}

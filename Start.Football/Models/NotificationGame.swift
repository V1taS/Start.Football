//
//  NotificationGame.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 31.01.2021.
//

import Foundation

struct NotificationGame: Hashable, Decodable {
    
    var id = UUID().uuidString
    var dataCreateNotifications = Date()
    var description: String
    
    init(description: String) {
        self.description = description
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: NotificationGame, rhs: NotificationGame) -> Bool {
        return lhs.id == rhs.id
    }
}


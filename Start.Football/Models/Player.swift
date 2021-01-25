//
//  Player.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 25.01.2021.
//

import Foundation

struct Player: Hashable, Decodable {
    
    var id: String
    var name: String
    var login: String
    var mail: String
    var password: String
    var tShirtNumber: String
    var position: String
    var avatarStringURL: String
    var weight: String
    var growth: String
    var age: String
    var city: String
    var aboutMe: String
    var takePart: String
    var organized: String
    var phoneNumber: String
    var rating: String
    var payment: String
    
    init(id: String,
         name: String,
         login: String,
         mail: String,
         password: String,
         tShirtNumber: String,
         position: String,
         avatarStringURL: String,
         weight: String,
         growth: String,
         age: String,
         city: String,
         aboutMe: String,
         takePart: String,
         organized: String,
         phoneNumber: String,
         rating: String,
         payment: String) {
        
        self.id = id
        self.name = name
        self.login = login
        self.mail = mail
        self.password = password
        self.tShirtNumber = tShirtNumber
        self.position = position
        self.avatarStringURL = avatarStringURL
        self.weight = weight
        self.growth = growth
        self.age = age
        self.city = city
        self.aboutMe = aboutMe
        self.takePart = takePart
        self.organized = organized
        self.phoneNumber = phoneNumber
        self.rating = rating
        self.payment = payment
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: Player, rhs: Player) -> Bool {
        return lhs.id == rhs.id
    }
    
    func contains(filter: String?) -> Bool {
        guard let filter = filter else { return true }
        if filter.isEmpty { return true }
        let lowercasedFilter = filter.lowercased()
        return name.lowercased().contains(lowercasedFilter)
    }
}

extension Player {
    static var plugPlayer = Player(id: "",
                                   name: "",
                                   login: "",
                                   mail: "",
                                   password: "",
                                   tShirtNumber: "",
                                   position: "",
                                   avatarStringURL: "",
                                   weight: "",
                                   growth: "",
                                   age: "",
                                   city: "",
                                   aboutMe: "",
                                   takePart: "",
                                   organized: "",
                                   phoneNumber: "",
                                   rating: "",
                                   payment: "")
}

//
//  Map.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 23.01.2021.
//

import Foundation

extension AppState.AppData.Main {
    struct Map: Equatable {
        var showMap = false
        
        var gamePoint: [GamePoint] = [
            GamePoint(title: "Арена Химки",
                      coordinate: .init(latitude: 55.891830,longitude: 37.408373),
                      subtitle: "Здесь будет описание"),
            GamePoint(title: "Олимпиец",
                      coordinate: .init(latitude: 55.954037, longitude: 37.469100),
                      subtitle: "Здесь будет описание")
        ]
    }
}

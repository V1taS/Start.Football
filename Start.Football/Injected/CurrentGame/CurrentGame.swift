//
//  CurrentGame.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 21.01.2021.
//

import Foundation

extension AppState.AppData {
    struct CurrentGame: Equatable {
        
        var game = Game.plugGame
        
        // Preview current game
//        var nameGame = "Тренировка в ФОК"
//        var addressGame = "ул. Хачтуряна, 12, стр. 2"
//        var costGame = "500"
//        var idGame = "4867"
        var distance = "5,2"
        
//        var descriptionPlaying = "Большое поле, разделенное на два с 4 прожекторами. Газон обновлялся два года назад в связи с подготовкой к ЧМ. Есть 4 типа ворот: большие, средние, мини-футбольные и для игры в панну."
//        var ownRules = "Играем без подкатов. Любое попадание в руку считается нарушением. Вратарь не берет в руки от своих игроков."
//        var commentFromOrganizer = "Приходим за 10-15 минут. Игра начинается ровно в 21:30. Не задерживайте себя и других игроков!"
        
        
//        var miniFootball = true
//        var football = false
//        var footsal = false
        
        // Формат игры
//        var firstValue: String = "7"
//        var secondValue: String = "7"
        
        // Приватность
//        var privacyGame: AppActions.CreatGameActions.PrivacyGame = .close
        
        // Разовая игра
//        var oneGame = Date()
//        var regularGame: AppActions.CreatGameActions.RegularGame = .no
        
        // Регулярные игры
//        var listDate = [Date(), Date(), Date(), Date(), Date(), Date(), Date()]
        
        var plugPhotoPlayers = ["p1", "p2", "p3", "p4", "p5"]
        
        // MARK: Day Of Week
        var mo = false
        var tu = false
        var we = false
        var th = false
        var fr = false
        var sa = false
        var su = false
    }
}

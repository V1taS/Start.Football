//
//  GetDateStringFromDate.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 08.01.2021.
//

import Foundation

class GetDateStringFromDate {
    static let shared = GetDateStringFromDate()
    
    // MARK: Преобразуем дату в часы и минуты: "21:30"
    func getTimeString(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        dateFormatter.locale = Locale(identifier: "ru_RU")
        let time = dateFormatter.string(from: date)
        return time
    }
    
    // MARK: Преобразуем дату: "четверг 21 января 2021"
    func getDateString(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE d MMMM yyyy"
        dateFormatter.locale = Locale(identifier: "ru_RU")
        let time = dateFormatter.string(from: date)
        return time
    }
}

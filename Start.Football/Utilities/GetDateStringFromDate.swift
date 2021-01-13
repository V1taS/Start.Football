//
//  GetDateStringFromDate.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 08.01.2021.
//

import Foundation

class GetDateStringFromDate {
    static let shared = GetDateStringFromDate()
    
    // MARK: Преобразуем дату в часы и минуты
    func getTimeString(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        dateFormatter.locale = Locale.current
        let time = dateFormatter.string(from: date)
        return time
    }
    
    func getDateString(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yy"
        dateFormatter.locale = Locale.current
        let time = dateFormatter.string(from: date)
        return time
    }
}

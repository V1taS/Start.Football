//
//  CreateGameStepOneViewModel.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 08.01.2021.
//

import SwiftUI
import Combine

protocol CreateGameStepOneViewModelProtocol {
    var currentDate: Date { get }
    var showTimePicker: Bool { get }
    var showDatePicker: Bool { get }
    var time: String { get }
    var timeTextHasBeenChanged: Bool { get }
    var date: String { get }
    var dateTextHasBeenChanged: Bool { get }
}

class CreateGameStepOneViewModel: CreateGameStepOneViewModelProtocol, ObservableObject {
    @Published var currentDate = Date() {
        didSet {
            time = GetDateStringFromDate.shared.getTimeString(date: currentDate)
            date = GetDateStringFromDate.shared.getDateString(date: currentDate)
        }
    }
    @Published var showTimePicker = false
    @Published var showDatePicker = false
    
    @Published var time = "Укажите время" {
        didSet {
            timeTextHasBeenChanged = true
            
            if time.isEmpty {
                timeTextHasBeenChanged = false
            }
        }
    }
    @Published var timeTextHasBeenChanged = false
    
    @Published var date = "Укажите дату начала" {
        didSet {
            dateTextHasBeenChanged = true
            
            if date.isEmpty {
                dateTextHasBeenChanged = false
            }
        }
    }
    @Published var dateTextHasBeenChanged = false
}

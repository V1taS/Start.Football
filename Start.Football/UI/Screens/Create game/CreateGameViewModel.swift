//
//  CreateGameViewModel.swift
//  Start.Football
//
//  Created by Виталий Сосин on 09.12.2020.
//

import SwiftUI
import Combine

protocol CreateGameViewModelProtocol {
    var selectionCreateGame: SelectionCreateGame { get }
    var progressValue: Float { get }
    
    // Step 1
    var nameGame: String { get }
    var addressGame: String { get }
    var participationCost: String { get }
    var currentDate: Date { get }
    var showTimePicker: Bool { get }
    var showDatePicker: Bool { get }
    var oneTime: String { get }
    var oneTimeTextHasBeenChanged: Bool { get }
    var oneDay: String { get }
    var oneDayTextHasBeenChanged: Bool { get }
    
    // Step 2
    var regularDate: [Date] { get }
    var selectionRegularGame: SelectionRegularGame { get }
    var regularTimePicker: Bool { get }
    
    var regularTime: String { get }
    var timeTextHasBeenChanged: Bool { get }
    
    var mo: Bool { get }
    var tu: Bool { get }
    var we: Bool { get }
    var th: Bool { get }
    var fr: Bool { get }
    var sa: Bool { get }
    var su: Bool { get }
}

class CreateGameViewModel: CreateGameViewModelProtocol, ObservableObject {
    
    // MARK: - Шкала прогресса действий
    @Published var selectionCreateGame: SelectionCreateGame = .stepOne {
        didSet {
            switch selectionCreateGame {
            case .stepOne:
                progressValue = 0.0
            case .stepTwo:
                progressValue = 0.25
            case .stepThree:
                progressValue = 0.50
            case .stepFour:
                progressValue = 0.75
            case .stepFive:
                progressValue = 1.0
            }
        }
    }
    @Published var progressValue: Float = 0.0
    
    // MARK: - Step 1
    @Published var nameGame = ""
    @Published var addressGame = ""
    @Published var participationCost = ""
    @Published var currentDate = Date() {
        didSet {
            oneTime = GetDateStringFromDate.shared.getTimeString(date: currentDate)
            oneDay = GetDateStringFromDate.shared.getDateString(date: currentDate)
        }
    }
    @Published var showTimePicker = false
    @Published var showDatePicker = false
    
    @Published var oneTime = "Укажите время" {
        didSet {
            oneTimeTextHasBeenChanged = true
            
            if oneTime.isEmpty {
                oneTimeTextHasBeenChanged = false
            }
        }
    }
    @Published var oneTimeTextHasBeenChanged = false
    
    @Published var oneDay = "Укажите дату начала" {
        didSet {
            oneDayTextHasBeenChanged = true
            
            if oneDay.isEmpty {
                oneDayTextHasBeenChanged = false
            }
        }
    }
    @Published var oneDayTextHasBeenChanged = false
    
    // MARK: - Step 2
    @Published var regularDate = [Date(),
                                  Date(),
                                  Date(),
                                  Date(),
                                  Date(),
                                  Date(),
                                  Date()] {
        didSet {
            regularTime = GetDateStringFromDate.shared.getTimeString(date: currentDate)
        }
    }
    @Published var selectionRegularGame: SelectionRegularGame = .no
    @Published var regularTimePicker: Bool = false
    
    @Published var regularTime = "Укажите время" {
        didSet {
            timeTextHasBeenChanged = true
            
            if regularTime.isEmpty {
                timeTextHasBeenChanged = false
            }
        }
    }
    @Published var timeTextHasBeenChanged = false
    
    // MARK: -
    @Published var mo: Bool = false
    @Published var tu: Bool = false
    @Published var we: Bool = false
    @Published var th: Bool = false
    @Published var fr: Bool = false
    @Published var sa: Bool = false
    @Published var su: Bool = false

}

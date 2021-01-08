//
//  CreateGameStepTwoViewModel.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 08.01.2021.
//

import SwiftUI
import Combine



protocol CreateGameStepTwoViewModelProtocol {
    var currentDate: Date { get }
    var selectionRegularGame: SelectionRegularGame { get }
    var showTimePicker: Bool { get }
    
    var time: String { get }
    var timeTextHasBeenChanged: Bool { get }
    
    var mo: Bool { get }
    var tu: Bool { get }
    var we: Bool { get }
    var th: Bool { get }
    var fr: Bool { get }
    var sa: Bool { get }
    var su: Bool { get }
}

class CreateGameStepTwoViewModel: CreateGameStepTwoViewModelProtocol, ObservableObject {
    @Published var currentDate = Date() {
        didSet {
            time = GetDateStringFromDate.shared.getTimeString(date: currentDate)
        }
    }
    @Published var selectionRegularGame: SelectionRegularGame = .no
    @Published var showTimePicker: Bool = false
    
    @Published var time = "Укажите время" {
        didSet {
            timeTextHasBeenChanged = true
            
            if time.isEmpty {
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

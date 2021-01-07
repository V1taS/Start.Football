//
//  CreateGameStepOneViewModel.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 08.01.2021.
//

import SwiftUI
import Combine

protocol CreateGameStepOneViewModelProtocol {
    var showTimePicker: Bool { get }
    var showDatePicker: Bool { get }
}

class CreateGameStepOneViewModel: CreateGameStepOneViewModelProtocol, ObservableObject {
    @Published var showTimePicker: Bool = false
    @Published var showDatePicker: Bool = false
}

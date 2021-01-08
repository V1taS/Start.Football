//
//  CreateGameView.swift
//  Start.Football
//
//  Created by Виталий Сосин on 09.12.2020.
//

import SwiftUI

struct CreateGameView: View {
    
    let height = UIScreen.screenHeight
    let width = UIScreen.screenWidth
    
    @ObservedObject var viewModel = CreateGameViewModel()
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                HeaderCreateGameView(selectionCreateGame: $viewModel.selectionCreateGame,
                                     progressValue: $viewModel.progressValue)
                
                Group {
                    if viewModel.selectionCreateGame == .stepOne {
                        CreateGameStepOne(nameGame: $viewModel.nameGame,
                                          addressGame: $viewModel.addressGame,
                                          participationCost: $viewModel.participationCost,
                                          currentDate: $viewModel.currentDate,
                                          showTimePicker: $viewModel.showTimePicker,
                                          showDatePicker: $viewModel.showDatePicker,
                                          oneTime: $viewModel.oneTime,
                                          oneTimeTextHasBeenChanged: $viewModel.oneTimeTextHasBeenChanged,
                                          oneDay: $viewModel.oneDay,
                                          oneDayTextHasBeenChanged: $viewModel.oneDayTextHasBeenChanged)
                    }
                    
                    else if viewModel.selectionCreateGame == .stepTwo {
                        CreateGameStepTwo()
                    }
                    
                    else if viewModel.selectionCreateGame == .stepThree {
                        CreateGameStepThree()
                    }
                    else if viewModel.selectionCreateGame == .stepFour {
                        CreateGameStepFour()
                    }
                    
                    else if viewModel.selectionCreateGame == .stepFive {
                        CreateGameStepFive()
                    }
                }
                Spacer()
                ButtonNextStepCreateGameView(selectionCreateGame: $viewModel.selectionCreateGame)
                    .padding(.horizontal, 24)
            }
        } .dismissingKeyboard()
    }
}

struct CreateGameView_Previews: PreviewProvider {
    static var previews: some View {
        CreateGameView()
    }
}

//
//  CreateGameView.swift
//  Start.Football
//
//  Created by Виталий Сосин on 09.12.2020.
//

import SwiftUI
import Combine

struct CreateGameView: View {
    let height = UIScreen.screenHeight
    let width = UIScreen.screenWidth
    
    @State private var routingState: AppState.AppData.CreateGame = .init()
    private var routingBinding: Binding<AppState.AppData.CreateGame> {
        $routingState.dispatched(to: injected.appState, \.appData.createGame)
    }
    @ObservedObject var viewModel = CreateGameViewModel()
    
    
    @Environment(\.injected) private var injected: DIContainer
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                HeaderCreateGameView(selectionCreateGame: $viewModel.selectionCreateGame,
                                     progressValue: $viewModel.progressValue)
                
                Group {
                    if viewModel.selectionCreateGame == .stepOne {
                        CreateGameStepOne()
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

// MARK: - Side Effects

private extension CreateGameView {
    func refreshProgressBar() {
        injected.interactors.createGameInteractor
            .refreshProgressBar(step: routingState.selectionCreateGame)
    }
}

//
//  CreateGameStepTwo.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 07.01.2021.
//

import SwiftUI
import Combine

struct CreateGameStepTwo: View {
    
    private var appBinding: Binding<AppState.AppData>
    init(appBinding: Binding<AppState.AppData>) {
        self.appBinding = appBinding
    }
    @Environment(\.injected) private var injected: DIContainer
    
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 16) {
                header
                selectionRegularGame
                regularGame
                Spacer()
            }
            .padding(.horizontal, 24)
            .padding(.top, 24)
        }
    }
}


// MARK: UI
private extension CreateGameStepTwo {
    private var header: AnyView {
        AnyView(
            Text("Это регулярная игра?")
                .foregroundColor(.defaultColor)
                .font(Font.event.robotoRegular18)
        )
    }
}

private extension CreateGameStepTwo {
    var selectionRegularGame: some View {
        VStack(spacing: 16) {
            Button(action: {
                noSelectionRegularGame(state: appBinding)
            }) {
                oneDayButton
            }
            
            Button(action: {
                yesSelectionRegularGame(state: appBinding)
            }) {
                regularDayButton
            }
        }
    }
}

private extension CreateGameStepTwo {
    var oneDayButton: some View {
        HStack(spacing: 8) {
            ButtonRoundGreen(status: appBinding.createGame
                                .selectionRegularGame.wrappedValue == .no)
                .frame(width: 24)
            
            Text("Разово. Для проведения одной игры.")
                .foregroundColor(.defaultColor)
                .font(Font.event.robotoRegular16)
            Spacer()
        }
    }
}

private extension CreateGameStepTwo {
    var regularDayButton: some View {
        HStack(spacing: 8) {
            ButtonRoundGreen(status: appBinding.createGame
                                .selectionRegularGame.wrappedValue == .yes)
                .frame(width: 24)
            
            Text("Регулярно. Проводится на постоянной основе")
                .foregroundColor(.defaultColor)
                .font(Font.event.robotoRegular16)
            Spacer()
        }
    }
}

private extension CreateGameStepTwo {
    var regularGame: some View {
        VStack(alignment: .leading, spacing: 0) {
            if appBinding.createGame.selectionRegularGame.wrappedValue == .yes {
                boxDateButton
                boxSelectDateGames
            }
        }
    }
}

private extension CreateGameStepTwo {
    private var boxDateButton: AnyView {
        AnyView(
            BoxDateButton(disabledButton: false,
                          mo: appBinding.createGame.listGame[0],
                          tu: appBinding.createGame.listGame[1],
                          we: appBinding.createGame.listGame[2],
                          th: appBinding.createGame.listGame[3],
                          fr: appBinding.createGame.listGame[4],
                          sa: appBinding.createGame.listGame[5],
                          su: appBinding.createGame.listGame[6])
                .padding(.bottom, 8)
        )
    }
}

private extension CreateGameStepTwo {
    private var boxSelectDateGames: AnyView {
        AnyView(
            ScrollView(.vertical, showsIndicators: false) {
                BoxSelectDateGames(title: "Игра в понедельник",
                                   date: appBinding.createGame.listDate[0],
                                   textHasBeenChanged: appBinding.createGame.anyTimeHasBeenChanged,
                                   dayOfGame: appBinding.createGame.listGame[0])
                
                BoxSelectDateGames(title: "Игра во вторник",
                                   date: appBinding.createGame.listDate[1],
                                   textHasBeenChanged: appBinding.createGame.anyTimeHasBeenChanged,
                                   dayOfGame: appBinding.createGame.listGame[1])
                
                BoxSelectDateGames(title: "Игра в среду",
                                   date: appBinding.createGame.listDate[2],
                                   textHasBeenChanged: appBinding.createGame.anyTimeHasBeenChanged,
                                   dayOfGame: appBinding.createGame.listGame[2])
                
                BoxSelectDateGames(title: "Игра в четверг",
                                   date: appBinding.createGame.listDate[3],
                                   textHasBeenChanged: appBinding.createGame.anyTimeHasBeenChanged,
                                   dayOfGame: appBinding.createGame.listGame[3])
                
                BoxSelectDateGames(title: "Игра в пятницу",
                                   date: appBinding.createGame.listDate[4],
                                   textHasBeenChanged: appBinding.createGame.anyTimeHasBeenChanged,
                                   dayOfGame: appBinding.createGame.listGame[4])
                
                BoxSelectDateGames(title: "Игра в субботу",
                                   date: appBinding.createGame.listDate[5],
                                   textHasBeenChanged: appBinding.createGame.anyTimeHasBeenChanged,
                                   dayOfGame: appBinding.createGame.listGame[5])
                
                BoxSelectDateGames(title: "Игра в воскресенье",
                                   date: appBinding.createGame.listDate[6],
                                   textHasBeenChanged: appBinding.createGame.anyTimeHasBeenChanged,
                                   dayOfGame: appBinding.createGame.listGame[6])
            }
            .animation(.easeIn)
        )
    }
}


// MARK: Actions
private extension CreateGameStepTwo {
    private func noSelectionRegularGame(state: Binding<AppState.AppData>) {
        injected.interactors.createGameInteractor
            .noSelectionRegularGame(state: state)
    }
    
    private func yesSelectionRegularGame(state: Binding<AppState.AppData>) {
        injected.interactors.createGameInteractor
            .yesSelectionRegularGame(state: state)
    }
}

struct CreateGameStepTwo_Previews: PreviewProvider {
    static var previews: some View {
        CreateGameStepTwo(appBinding: .constant(.init()))
    }
}

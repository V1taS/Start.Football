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
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Это регулярная игра?")
                .foregroundColor(.defaultColor)
                .font(Font.event.robotoRegular18)
            
            selectionRegularGame
            regularGame
                .animation(.default)
            Spacer()
        }
        .padding(.horizontal, 24)
        .padding(.top, 16)
    }
}

// MARK: UI
private extension CreateGameStepTwo {
    var selectionRegularGame: some View {
        VStack(spacing: 16) {
            VStack(spacing: 0) {
                Button(action: {
                    noSelectionRegularGame()
                }) {
                    HStack(spacing: 8) {
                        ButtonRoundGreen(status: appBinding.createGame.selectionRegularGame.wrappedValue == .no)
                            .frame(width: 20)
                        
                        Text("Разово. Для проведения одной игры.")
                            .foregroundColor(.defaultColor)
                            .font(Font.event.robotoRegular16)
                        Spacer()
                    }
                }
            }
            
            VStack(spacing: 0) {
                Button(action: {
                    yesSelectionRegularGame()
                }) {
                    HStack(spacing: 8) {
                        ButtonRoundGreen(status: appBinding.createGame.selectionRegularGame.wrappedValue == .yes)
                            .frame(width: 20)
                        
                        Text("Регулярно. Проводится на постоянной основе")
                            .foregroundColor(.defaultColor)
                            .font(Font.event.robotoRegular16)
                        Spacer()
                    }
                }
            }
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
    private func noSelectionRegularGame() {
        appBinding.createGame.selectionRegularGame.wrappedValue = .no
    }
    
    private func yesSelectionRegularGame() {
        appBinding.createGame.selectionRegularGame.wrappedValue = .yes
    }
}

struct CreateGameStepTwo_Previews: PreviewProvider {
    static var previews: some View {
        CreateGameStepTwo(appBinding: .constant(.init()))
    }
}

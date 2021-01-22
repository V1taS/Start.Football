//
//  CreateGameStepTwo.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 07.01.2021.
//

import SwiftUI
import Combine

struct CreateGameStepTwo: View {
    
    private var appBinding: Binding<AppState.AppData.CreateGame>
    init(appBinding: Binding<AppState.AppData.CreateGame>) {
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
                        ButtonRoundGreen(status: appBinding.selectionRegularGame.wrappedValue == .no)
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
                        ButtonRoundGreen(status: appBinding.selectionRegularGame.wrappedValue == .yes)
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
            if appBinding.selectionRegularGame.wrappedValue == .yes {
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
                          mo: appBinding.listGame[0],
                          tu: appBinding.listGame[1],
                          we: appBinding.listGame[2],
                          th: appBinding.listGame[3],
                          fr: appBinding.listGame[4],
                          sa: appBinding.listGame[5],
                          su: appBinding.listGame[6])
                .padding(.bottom, 8)
        )
    }
}

private extension CreateGameStepTwo {
    private var boxSelectDateGames: AnyView {
        AnyView(
            ScrollView(.vertical, showsIndicators: false) {
                BoxSelectDateGames(title: "Игра в понедельник",
                                   date: appBinding.anyDate[0],
                                   textHasBeenChanged: appBinding.anyTimeHasBeenChanged,
                                   dayOfGame: appBinding.listGame[0])
                
                BoxSelectDateGames(title: "Игра во вторник",
                                   date: appBinding.anyDate[1],
                                   textHasBeenChanged: appBinding.anyTimeHasBeenChanged,
                                   dayOfGame: appBinding.listGame[1])
                
                BoxSelectDateGames(title: "Игра в среду",
                                   date: appBinding.anyDate[2],
                                   textHasBeenChanged: appBinding.anyTimeHasBeenChanged,
                                   dayOfGame: appBinding.listGame[2])
                
                BoxSelectDateGames(title: "Игра в четверг",
                                   date: appBinding.anyDate[3],
                                   textHasBeenChanged: appBinding.anyTimeHasBeenChanged,
                                   dayOfGame: appBinding.listGame[3])
                
                BoxSelectDateGames(title: "Игра в пятницу",
                                   date: appBinding.anyDate[4],
                                   textHasBeenChanged: appBinding.anyTimeHasBeenChanged,
                                   dayOfGame: appBinding.listGame[4])
                
                BoxSelectDateGames(title: "Игра в субботу",
                                   date: appBinding.anyDate[5],
                                   textHasBeenChanged: appBinding.anyTimeHasBeenChanged,
                                   dayOfGame: appBinding.listGame[5])
                
                BoxSelectDateGames(title: "Игра в воскресенье",
                                   date: appBinding.anyDate[6],
                                   textHasBeenChanged: appBinding.anyTimeHasBeenChanged,
                                   dayOfGame: appBinding.listGame[6])
            }
            .animation(.easeIn)
        )
    }
}

// MARK: Actions
private extension CreateGameStepTwo {
    private func noSelectionRegularGame() {
        appBinding.selectionRegularGame.wrappedValue = .no
    }
    
    private func yesSelectionRegularGame() {
        appBinding.selectionRegularGame.wrappedValue = .yes
    }
}

struct CreateGameStepTwo_Previews: PreviewProvider {
    static var previews: some View {
        CreateGameStepTwo(appBinding: .constant(.init()))
    }
}

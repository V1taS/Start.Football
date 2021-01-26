//
//  CalendarCurrentGame.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 07.01.2021.
//

import SwiftUI

struct CalendarCurrentGame: View {
    
    @State private var appState: AppState.AppData = .init()
    private var appBinding: Binding<AppState.AppData> {
        $appState.dispatched(to: injected.appState, \.appData)
    }
    @Environment(\.injected) private var injected: DIContainer
    
    private var game: Game
    init(game: Game) {
        self.game = game
    }
    
    var body: some View {
        VStack(spacing: 0) {
            VStack(alignment: .leading, spacing: 16) {
                header
                boxCalendarGame
                dateGames
            }
        }
        .padding(.vertical, 24)
    }
}


// MARK: UI
private extension CalendarCurrentGame {
    private var header: AnyView {
        AnyView(
            Text(game.regularGame == "yes" ? "РЕГУЛЯРНЫЕ ТРЕНИРОВКИ" : "РАЗОВАЯ ТРЕНИРОВКА")
                .foregroundColor(.secondaryColor)
                .font(Font.event.robotoMedium18)
        )
    }
}

private extension CalendarCurrentGame {
    private var boxCalendarGame: AnyView {
        AnyView(
            BoxDateButton(disabledButton: true,
                          mo: appBinding.currentGame.mo,
                          tu: appBinding.currentGame.tu,
                          we: appBinding.currentGame.we,
                          th: appBinding.currentGame.th,
                          fr: appBinding.currentGame.fr,
                          sa: appBinding.currentGame.sa,
                          su: appBinding.currentGame.su)
        )
    }
}

private extension CalendarCurrentGame {
    private var dateGames: AnyView {
        AnyView(
            VStack(alignment: .leading, spacing: 0) {
                selectionRegularGame
            }
        )
    }
}

private extension CalendarCurrentGame {
    private var selectionRegularGame: AnyView {
        if game.regularGame == "yes" {
            return AnyView(regularGame)
        } else {
            return AnyView(oneGame)
        }
    }
}

private extension CalendarCurrentGame {
    private var oneGame: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack(spacing: 10) {
                Image("cellDate")
                
                Text("\(fullDateString(date: game.oneGameDate)) в \(timeString(date: game.oneGameDate))")
                    .foregroundColor(.secondaryColor)
                    .font(Font.event.robotoRegular16)
            }
        } .onAppear {
            showOneDayInRegularCalendar(state: appBinding, game: game)
        }
    }
}

private extension CalendarCurrentGame {
    private var regularGame: some View {
        VStack(alignment: .leading, spacing: 8) {
            
            if game.listGameRegularGame[0] {
                HStack(spacing: 10) {
                    Image("cellDate")
                    Text("Понедельник в \(timeString(date: game.listDateRegularGame[0]))")
                        .foregroundColor(.secondaryColor)
                        .font(Font.event.robotoRegular16)
                }
            }
            
            if game.listGameRegularGame[1] {
                HStack(spacing: 10) {
                    Image("cellDate")
                    Text("Вторник в \(timeString(date: game.listDateRegularGame[1]))")
                        .foregroundColor(.secondaryColor)
                        .font(Font.event.robotoRegular16)
                }
            }
            
            if game.listGameRegularGame[2] {
                HStack(spacing: 10) {
                    Image("cellDate")
                    Text("Среда в \(timeString(date: game.listDateRegularGame[2]))")
                        .foregroundColor(.secondaryColor)
                        .font(Font.event.robotoRegular16)
                }
            }
            
            if game.listGameRegularGame[3] {
                HStack(spacing: 10) {
                    Image("cellDate")
                    Text("Четверг в \(timeString(date: game.listDateRegularGame[3]))")
                        .foregroundColor(.secondaryColor)
                        .font(Font.event.robotoRegular16)
                }
            }
            
            if game.listGameRegularGame[4] {
                HStack(spacing: 10) {
                    Image("cellDate")
                    Text("Пятница в \(timeString(date: game.listDateRegularGame[4]))")
                        .foregroundColor(.secondaryColor)
                        .font(Font.event.robotoRegular16)
                }
            }
            
            if game.listGameRegularGame[5] {
                HStack(spacing: 10) {
                    Image("cellDate")
                    Text("Суббота в \(timeString(date: game.listDateRegularGame[5]))")
                        .foregroundColor(.secondaryColor)
                        .font(Font.event.robotoRegular16)
                }
            }
            
            if game.listGameRegularGame[6] {
                HStack(spacing: 10) {
                    Image("cellDate")
                    Text("Воскресенье в \(timeString(date: game.listDateRegularGame[6]))")
                        .foregroundColor(.secondaryColor)
                        .font(Font.event.robotoRegular16)
                }
            }
        }
        .onAppear {
            showDaysInRegularCalendar(state: appBinding, game: game)
        }
        .animation(.default)
    }
}


// MARK: Actions
private extension CalendarCurrentGame {
    private func timeString(date: Date) -> String {
        injected.interactors.currentGameInteractor
            .timeString(date: date)
    }
    
    private func fullDateString(date: Date) -> String {
        injected.interactors.currentGameInteractor
            .fullDateString(date: date)
    }
    
    private func showDaysInRegularCalendar(state: Binding<AppState.AppData>, game: Game) {
        injected.interactors.currentGameInteractor
            .showDaysInRegularCalendar(state: state, game: game)
    }
    
    private func showOneDayInRegularCalendar(state: Binding<AppState.AppData>, game: Game) {
        injected.interactors.currentGameInteractor
            .showOneDayInRegularCalendar(state: state, game: game)
    }
}

struct CalendarCurrentGame_Previews: PreviewProvider {
    static var previews: some View {
        CalendarCurrentGame(game: .plugGame)
    }
}

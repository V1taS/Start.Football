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
            let timeString = GetDateStringFromDate.shared.getTimeString(date: game.oneGameDate)
            let dateString = GetDateStringFromDate.shared.getDateStringFull(date: game.oneGameDate).firstUppercased
            
            HStack(spacing: 10) {
                Image("cellDate")
                
                Text("\(dateString) в \(timeString)")
                    .foregroundColor(.secondaryColor)
                    .font(Font.event.robotoRegular16)
            }
        } .onAppear {
            dayOfWeekOneGame()
        }
    }
}

private extension CalendarCurrentGame {
    private var regularGame: some View {
        VStack(alignment: .leading, spacing: 8) {
            if game.listGameRegularGame[0] {
                let timeString = GetDateStringFromDate.shared.getTimeString(date: game.listDateRegularGame[0])
                HStack(spacing: 10) {
                    Image("cellDate")
                    Text("Понедельник в \(timeString)")
                        .foregroundColor(.secondaryColor)
                        .font(Font.event.robotoRegular16)
                }
            }
            
            if game.listGameRegularGame[1] {
                let timeString = GetDateStringFromDate.shared.getTimeString(date: game.listDateRegularGame[1])
                HStack(spacing: 10) {
                    Image("cellDate")
                    Text("Вторник в \(timeString)")
                        .foregroundColor(.secondaryColor)
                        .font(Font.event.robotoRegular16)
                }
            }
            
            if game.listGameRegularGame[2] {
                let timeString = GetDateStringFromDate.shared.getTimeString(date: game.listDateRegularGame[2])
                HStack(spacing: 10) {
                    Image("cellDate")
                    Text("Среда в \(timeString)")
                        .foregroundColor(.secondaryColor)
                        .font(Font.event.robotoRegular16)
                }
            }
            
            if game.listGameRegularGame[3] {
                let timeString = GetDateStringFromDate.shared.getTimeString(date: game.listDateRegularGame[3])
                HStack(spacing: 10) {
                    Image("cellDate")
                    Text("Четверг в \(timeString)")
                        .foregroundColor(.secondaryColor)
                        .font(Font.event.robotoRegular16)
                }
            }
            
            if game.listGameRegularGame[4] {
                let timeString = GetDateStringFromDate.shared.getTimeString(date: game.listDateRegularGame[4])
                HStack(spacing: 10) {
                    Image("cellDate")
                    Text("Пятница в \(timeString)")
                        .foregroundColor(.secondaryColor)
                        .font(Font.event.robotoRegular16)
                }
            }
            
            if game.listGameRegularGame[5] {
                let timeString = GetDateStringFromDate.shared.getTimeString(date: game.listDateRegularGame[5])
                HStack(spacing: 10) {
                    Image("cellDate")
                    Text("Суббота в \(timeString)")
                        .foregroundColor(.secondaryColor)
                        .font(Font.event.robotoRegular16)
                }
            }
            
            if game.listGameRegularGame[6] {
                let timeString = GetDateStringFromDate.shared.getTimeString(date: game.listDateRegularGame[6])
                HStack(spacing: 10) {
                    Image("cellDate")
                    Text("Воскресенье в \(timeString)")
                        .foregroundColor(.secondaryColor)
                        .font(Font.event.robotoRegular16)
                }
            }
        }.onAppear {
            dayOfWeekRegular()
        }
        .animation(.default)
    }
}

// MARK: Actions
private extension CalendarCurrentGame {
    private func dayOfWeekRegular() {
        appBinding.currentGame.mo.wrappedValue = game.listGameRegularGame[0]
        appBinding.currentGame.tu.wrappedValue = game.listGameRegularGame[1]
        appBinding.currentGame.we.wrappedValue = game.listGameRegularGame[2]
        appBinding.currentGame.th.wrappedValue = game.listGameRegularGame[3]
        appBinding.currentGame.fr.wrappedValue = game.listGameRegularGame[4]
        appBinding.currentGame.sa.wrappedValue = game.listGameRegularGame[5]
        appBinding.currentGame.su.wrappedValue = game.listGameRegularGame[6]
    }
    
    private func dayOfWeekOneGame() {
        if GetDateStringFromDate.shared.getDateString(date: game.oneGameDate).firstUppercased == "Понедельник" {
            appBinding.currentGame.mo.wrappedValue = true
        }
        
        if GetDateStringFromDate.shared.getDateString(date: game.oneGameDate).firstUppercased == "Вторник" {
            appBinding.currentGame.tu.wrappedValue = true
        }
        
        if GetDateStringFromDate.shared.getDateString(date: game.oneGameDate).firstUppercased == "Среда" {
            appBinding.currentGame.we.wrappedValue = true
        }
        
        if GetDateStringFromDate.shared.getDateString(date: game.oneGameDate).firstUppercased == "Четверг" {
            appBinding.currentGame.th.wrappedValue = true
        }
        
        if GetDateStringFromDate.shared.getDateString(date: game.oneGameDate).firstUppercased == "Пятница" {
            appBinding.currentGame.fr.wrappedValue = true
        }
        
        if GetDateStringFromDate.shared.getDateString(date: game.oneGameDate).firstUppercased == "Суббота" {
            appBinding.currentGame.sa.wrappedValue = true
        }
        
        if GetDateStringFromDate.shared.getDateString(date: game.oneGameDate).firstUppercased == "Воскресенье" {
            appBinding.currentGame.su.wrappedValue = true
        }
    }
}

struct CalendarCurrentGame_Previews: PreviewProvider {
    static var previews: some View {
        CalendarCurrentGame(game: .plugGame)
    }
}

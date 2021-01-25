//
//  CalendarCurrentGame.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 07.01.2021.
//

import SwiftUI

struct CalendarCurrentGame: View {
    
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
                          mo: .constant(game.listGameRegularGame[0]),
                          tu: .constant(game.listGameRegularGame[1]),
                          we: .constant(game.listGameRegularGame[2]),
                          th: .constant(game.listGameRegularGame[3]),
                          fr: .constant(game.listGameRegularGame[4]),
                          sa: .constant(game.listGameRegularGame[5]),
                          su: .constant(game.listGameRegularGame[6]))
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
            
        }
    }
}

private extension CalendarCurrentGame {
    private var regularGame: some View {
        VStack(alignment: .leading, spacing: 8) {
            if game.listGameRegularGame[0] {
                let timeString = GetDateStringFromDate.shared.getTimeString(date: game.listDateRegularGame[0])
                HStack(spacing: 10) {
                    Text("Понедельник в \(timeString)")
                        .foregroundColor(.secondaryColor)
                        .font(Font.event.robotoRegular16)
                }
            }
            
            if game.listGameRegularGame[1] {
                let timeString = GetDateStringFromDate.shared.getTimeString(date: game.listDateRegularGame[1])
                HStack(spacing: 10) {
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
                    Text("Четверг в \(timeString)")
                        .foregroundColor(.secondaryColor)
                        .font(Font.event.robotoRegular16)
                }
            }
            
            if game.listGameRegularGame[4] {
                let timeString = GetDateStringFromDate.shared.getTimeString(date: game.listDateRegularGame[4])
                HStack(spacing: 10) {
                    Text("Пятница в \(timeString)")
                        .foregroundColor(.secondaryColor)
                        .font(Font.event.robotoRegular16)
                }
            }
            
            if game.listGameRegularGame[5] {
                let timeString = GetDateStringFromDate.shared.getTimeString(date: game.listDateRegularGame[5])
                HStack(spacing: 10) {
                    Text("Суббота в \(timeString)")
                        .foregroundColor(.secondaryColor)
                        .font(Font.event.robotoRegular16)
                }
            }
            
            if game.listGameRegularGame[6] {
                let timeString = GetDateStringFromDate.shared.getTimeString(date: game.listDateRegularGame[6])
                HStack(spacing: 10) {
                    Text("Воскресенье в \(timeString)")
                        .foregroundColor(.secondaryColor)
                        .font(Font.event.robotoRegular16)
                }
            }
            
        } .animation(.default)
    }
}

struct CalendarCurrentGame_Previews: PreviewProvider {
    static var previews: some View {
        CalendarCurrentGame(game: .plugGame)
    }
}

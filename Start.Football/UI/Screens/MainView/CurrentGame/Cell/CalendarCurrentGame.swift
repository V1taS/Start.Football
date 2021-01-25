//
//  CalendarCurrentGame.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 07.01.2021.
//

import SwiftUI

struct CalendarCurrentGame: View {
    
    @Environment(\.injected) private var injected: DIContainer
    private var appBinding: Binding<AppState.AppData>
    init(appBinding: Binding<AppState.AppData>) {
        self.appBinding = appBinding
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
            Text(appBinding.currentGame.game.regularGame.wrappedValue == "yes" ? "РЕГУЛЯРНЫЕ ТРЕНИРОВКИ" : "РАЗОВАЯ ТРЕНИРОВКА")
                .foregroundColor(.secondaryColor)
                .font(Font.event.robotoMedium18)
        )
    }
}

private extension CalendarCurrentGame {
    private var boxCalendarGame: AnyView {
        AnyView(
            BoxDateButton(disabledButton: true,
                          mo: appBinding.currentGame.game.mo,
                          tu: appBinding.currentGame.game.tu,
                          we: appBinding.currentGame.game.we,
                          th: appBinding.currentGame.game.th,
                          fr: appBinding.currentGame.game.fr,
                          sa: appBinding.currentGame.game.sa,
                          su: appBinding.currentGame.game.su)
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
        if appBinding.currentGame.game.regularGame.wrappedValue == "yes" {
            return AnyView(regularGame)
        } else {
            return AnyView(oneGame)
        }
    }
}

private extension CalendarCurrentGame {
    private var oneGame: some View {
        VStack(alignment: .leading, spacing: 0) {
            let timeString = GetDateStringFromDate.shared.getTimeString(date: appBinding.currentGame.game.oneGameDate.wrappedValue)
            let dateString = GetDateStringFromDate.shared.getDateStringFull(date: appBinding.currentGame.game.oneGameDate.wrappedValue).firstUppercased
            
            HStack(spacing: 10) {
                Image("cellDate")
                
                Text("\(dateString) в \(timeString)")
                    .foregroundColor(.secondaryColor)
                    .font(Font.event.robotoRegular16)
            }
                
        }
        .onAppear {
            showDateInCalendarOneGame()
        }
    }
}

private extension CalendarCurrentGame {
    private var regularGame: some View {
        VStack(alignment: .leading, spacing: 8) {
            if appBinding.currentGame.game.mo.wrappedValue {
                let timeString = GetDateStringFromDate.shared.getTimeString(date: appBinding.currentGame.game.listDateRegularGame[0].wrappedValue)
                HStack(spacing: 10) {
                Text("Понедельник в \(timeString)")
                    .foregroundColor(.secondaryColor)
                    .font(Font.event.robotoRegular16)
                }
            }
            
            if appBinding.currentGame.game.tu.wrappedValue {
                let timeString = GetDateStringFromDate.shared.getTimeString(date: appBinding.currentGame.game.listDateRegularGame[1].wrappedValue)
                HStack(spacing: 10) {
                Text("Вторник в \(timeString)")
                    .foregroundColor(.secondaryColor)
                    .font(Font.event.robotoRegular16)
                }
            }
            
            if appBinding.currentGame.game.we.wrappedValue {
                let timeString = GetDateStringFromDate.shared.getTimeString(date: appBinding.currentGame.game.listDateRegularGame[2].wrappedValue)
                HStack(spacing: 10) {
                    Image("cellDate")
                Text("Среда в \(timeString)")
                    .foregroundColor(.secondaryColor)
                    .font(Font.event.robotoRegular16)
                }
            }
            
            if appBinding.currentGame.game.th.wrappedValue {
                let timeString = GetDateStringFromDate.shared.getTimeString(date: appBinding.currentGame.game.listDateRegularGame[3].wrappedValue)
                HStack(spacing: 10) {
                Text("Четверг в \(timeString)")
                    .foregroundColor(.secondaryColor)
                    .font(Font.event.robotoRegular16)
                }
            }
            
            if appBinding.currentGame.game.fr.wrappedValue {
                let timeString = GetDateStringFromDate.shared.getTimeString(date: appBinding.currentGame.game.listDateRegularGame[4].wrappedValue)
                HStack(spacing: 10) {
                Text("Пятница в \(timeString)")
                    .foregroundColor(.secondaryColor)
                    .font(Font.event.robotoRegular16)
                }
            }
            
            if appBinding.currentGame.game.sa.wrappedValue {
                let timeString = GetDateStringFromDate.shared.getTimeString(date: appBinding.currentGame.game.listDateRegularGame[5].wrappedValue)
                HStack(spacing: 10) {
                Text("Суббота в \(timeString)")
                    .foregroundColor(.secondaryColor)
                    .font(Font.event.robotoRegular16)
                }
            }
            
            if appBinding.currentGame.game.su.wrappedValue {
                let timeString = GetDateStringFromDate.shared.getTimeString(date: appBinding.currentGame.game.listDateRegularGame[6].wrappedValue)
                HStack(spacing: 10) {
                Text("Воскресенье в \(timeString)")
                    .foregroundColor(.secondaryColor)
                    .font(Font.event.robotoRegular16)
                }
            }
            
        } .animation(.default)
    }
}



// MARK: Actions
private extension CalendarCurrentGame {
    private func showDateInCalendarOneGame() {
        switch GetDateStringFromDate.shared.getDateString(date: appBinding.currentGame.game.oneGameDate.wrappedValue).firstUppercased {
        case "Понедельник":
            appBinding.currentGame.game.mo.wrappedValue = true
            appBinding.currentGame.game.tu.wrappedValue = false
            appBinding.currentGame.game.we.wrappedValue = false
            appBinding.currentGame.game.th.wrappedValue = false
            appBinding.currentGame.game.fr.wrappedValue = false
            appBinding.currentGame.game.sa.wrappedValue = false
            appBinding.currentGame.game.su.wrappedValue = false
        case "Вторник":
            appBinding.currentGame.game.mo.wrappedValue = false
            appBinding.currentGame.game.tu.wrappedValue = true
            appBinding.currentGame.game.we.wrappedValue = false
            appBinding.currentGame.game.th.wrappedValue = false
            appBinding.currentGame.game.fr.wrappedValue = false
            appBinding.currentGame.game.sa.wrappedValue = false
            appBinding.currentGame.game.su.wrappedValue = false
        case "Среда":
            appBinding.currentGame.game.mo.wrappedValue = false
            appBinding.currentGame.game.tu.wrappedValue = false
            appBinding.currentGame.game.we.wrappedValue = true
            appBinding.currentGame.game.th.wrappedValue = false
            appBinding.currentGame.game.fr.wrappedValue = false
            appBinding.currentGame.game.sa.wrappedValue = false
            appBinding.currentGame.game.su.wrappedValue = false
        case "Четверг":
            appBinding.currentGame.game.mo.wrappedValue = false
            appBinding.currentGame.game.tu.wrappedValue = false
            appBinding.currentGame.game.we.wrappedValue = false
            appBinding.currentGame.game.th.wrappedValue = true
            appBinding.currentGame.game.fr.wrappedValue = false
            appBinding.currentGame.game.sa.wrappedValue = false
            appBinding.currentGame.game.su.wrappedValue = false
        case "Пятница":
            appBinding.currentGame.game.mo.wrappedValue = false
            appBinding.currentGame.game.tu.wrappedValue = false
            appBinding.currentGame.game.we.wrappedValue = false
            appBinding.currentGame.game.th.wrappedValue = false
            appBinding.currentGame.game.fr.wrappedValue = true
            appBinding.currentGame.game.sa.wrappedValue = false
            appBinding.currentGame.game.su.wrappedValue = false
        case "Суббота":
            appBinding.currentGame.game.mo.wrappedValue = false
            appBinding.currentGame.game.tu.wrappedValue = false
            appBinding.currentGame.game.we.wrappedValue = false
            appBinding.currentGame.game.th.wrappedValue = false
            appBinding.currentGame.game.fr.wrappedValue = false
            appBinding.currentGame.game.sa.wrappedValue = true
            appBinding.currentGame.game.su.wrappedValue = false
        case "Воскресенье":
            appBinding.currentGame.game.mo.wrappedValue = false
            appBinding.currentGame.game.tu.wrappedValue = false
            appBinding.currentGame.game.we.wrappedValue = false
            appBinding.currentGame.game.th.wrappedValue = false
            appBinding.currentGame.game.fr.wrappedValue = false
            appBinding.currentGame.game.sa.wrappedValue = false
            appBinding.currentGame.game.su.wrappedValue = true
        default:
            appBinding.currentGame.game.mo.wrappedValue = false
            appBinding.currentGame.game.tu.wrappedValue = false
            appBinding.currentGame.game.we.wrappedValue = false
            appBinding.currentGame.game.th.wrappedValue = false
            appBinding.currentGame.game.fr.wrappedValue = false
            appBinding.currentGame.game.sa.wrappedValue = false
            appBinding.currentGame.game.su.wrappedValue = false
        }
    }
}




struct CalendarCurrentGame_Previews: PreviewProvider {
    static var previews: some View {
        CalendarCurrentGame(appBinding: .constant(.init()))
    }
}

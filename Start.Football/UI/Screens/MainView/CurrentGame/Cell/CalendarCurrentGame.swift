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
            Text(appBinding.currentGame.selectionRegularGame.wrappedValue == .yes ? "РЕГУЛЯРНЫЕ ТРЕНИРОВКИ" : "РАЗОВАЯ ТРЕНИРОВКА")
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
        switch appBinding.currentGame.selectionRegularGame.wrappedValue {
        case .yes:
            return AnyView(regularGame)
        case .no:
            return AnyView(oneGame)
        }
    }
}

private extension CalendarCurrentGame {
    private var oneGame: some View {
        VStack(alignment: .leading, spacing: 0) {
            let timeString = GetDateStringFromDate.shared.getTimeString(date: appBinding.currentGame.oneGame.wrappedValue)
            let dateString = GetDateStringFromDate.shared.getDateStringFull(date: appBinding.currentGame.oneGame.wrappedValue).firstUppercased
            
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
            if appBinding.currentGame.mo.wrappedValue {
                let timeString = GetDateStringFromDate.shared.getTimeString(date: appBinding.currentGame.listDate[0].wrappedValue)
                Text("Понедельник: \(timeString)")
                    .foregroundColor(.secondaryColor)
                    .font(Font.event.robotoRegular16)
                
            }
            
            if appBinding.currentGame.tu.wrappedValue {
                let timeString = GetDateStringFromDate.shared.getTimeString(date: appBinding.currentGame.listDate[1].wrappedValue)
                Text("Вторник: \(timeString)")
                    .foregroundColor(.secondaryColor)
                    .font(Font.event.robotoRegular16)
                
            }
            
            if appBinding.currentGame.we.wrappedValue {
                let timeString = GetDateStringFromDate.shared.getTimeString(date: appBinding.currentGame.listDate[2].wrappedValue)
                Text("Среда: \(timeString)")
                    .foregroundColor(.secondaryColor)
                    .font(Font.event.robotoRegular16)
                
            }
            
            if appBinding.currentGame.th.wrappedValue {
                let timeString = GetDateStringFromDate.shared.getTimeString(date: appBinding.currentGame.listDate[3].wrappedValue)
                Text("Четверг: \(timeString)")
                    .foregroundColor(.secondaryColor)
                    .font(Font.event.robotoRegular16)
                
            }
            
            if appBinding.currentGame.fr.wrappedValue {
                let timeString = GetDateStringFromDate.shared.getTimeString(date: appBinding.currentGame.listDate[4].wrappedValue)
                Text("Пятница: \(timeString)")
                    .foregroundColor(.secondaryColor)
                    .font(Font.event.robotoRegular16)
                
            }
            
            if appBinding.currentGame.sa.wrappedValue {
                let timeString = GetDateStringFromDate.shared.getTimeString(date: appBinding.currentGame.listDate[5].wrappedValue)
                Text("Суббота: \(timeString)")
                    .foregroundColor(.secondaryColor)
                    .font(Font.event.robotoRegular16)
                
            }
            
            if appBinding.currentGame.su.wrappedValue {
                let timeString = GetDateStringFromDate.shared.getTimeString(date: appBinding.currentGame.listDate[6].wrappedValue)
                Text("Воскресенье: \(timeString)")
                    .foregroundColor(.secondaryColor)
                    .font(Font.event.robotoRegular16)
                
            }
            
        } .animation(.default)
    }
}



// MARK: Actions
private extension CalendarCurrentGame {
    private func showDateInCalendarOneGame() {
        switch GetDateStringFromDate.shared.getDateString(date: appBinding.currentGame.oneGame.wrappedValue).firstUppercased {
        case "Понедельник":
            appBinding.currentGame.mo.wrappedValue = true
            appBinding.currentGame.tu.wrappedValue = false
            appBinding.currentGame.we.wrappedValue = false
            appBinding.currentGame.th.wrappedValue = false
            appBinding.currentGame.fr.wrappedValue = false
            appBinding.currentGame.sa.wrappedValue = false
            appBinding.currentGame.su.wrappedValue = false
        case "Вторник":
            appBinding.currentGame.mo.wrappedValue = false
            appBinding.currentGame.tu.wrappedValue = true
            appBinding.currentGame.we.wrappedValue = false
            appBinding.currentGame.th.wrappedValue = false
            appBinding.currentGame.fr.wrappedValue = false
            appBinding.currentGame.sa.wrappedValue = false
            appBinding.currentGame.su.wrappedValue = false
        case "Среда":
            appBinding.currentGame.mo.wrappedValue = false
            appBinding.currentGame.tu.wrappedValue = false
            appBinding.currentGame.we.wrappedValue = true
            appBinding.currentGame.th.wrappedValue = false
            appBinding.currentGame.fr.wrappedValue = false
            appBinding.currentGame.sa.wrappedValue = false
            appBinding.currentGame.su.wrappedValue = false
        case "Четверг":
            appBinding.currentGame.mo.wrappedValue = false
            appBinding.currentGame.tu.wrappedValue = false
            appBinding.currentGame.we.wrappedValue = false
            appBinding.currentGame.th.wrappedValue = true
            appBinding.currentGame.fr.wrappedValue = false
            appBinding.currentGame.sa.wrappedValue = false
            appBinding.currentGame.su.wrappedValue = false
        case "Пятница":
            appBinding.currentGame.mo.wrappedValue = false
            appBinding.currentGame.tu.wrappedValue = false
            appBinding.currentGame.we.wrappedValue = false
            appBinding.currentGame.th.wrappedValue = false
            appBinding.currentGame.fr.wrappedValue = true
            appBinding.currentGame.sa.wrappedValue = false
            appBinding.currentGame.su.wrappedValue = false
        case "Суббота":
            appBinding.currentGame.mo.wrappedValue = false
            appBinding.currentGame.tu.wrappedValue = false
            appBinding.currentGame.we.wrappedValue = false
            appBinding.currentGame.th.wrappedValue = false
            appBinding.currentGame.fr.wrappedValue = false
            appBinding.currentGame.sa.wrappedValue = true
            appBinding.currentGame.su.wrappedValue = false
        case "Воскресенье":
            appBinding.currentGame.mo.wrappedValue = false
            appBinding.currentGame.tu.wrappedValue = false
            appBinding.currentGame.we.wrappedValue = false
            appBinding.currentGame.th.wrappedValue = false
            appBinding.currentGame.fr.wrappedValue = false
            appBinding.currentGame.sa.wrappedValue = false
            appBinding.currentGame.su.wrappedValue = true
        default:
            appBinding.currentGame.mo.wrappedValue = false
            appBinding.currentGame.tu.wrappedValue = false
            appBinding.currentGame.we.wrappedValue = false
            appBinding.currentGame.th.wrappedValue = false
            appBinding.currentGame.fr.wrappedValue = false
            appBinding.currentGame.sa.wrappedValue = false
            appBinding.currentGame.su.wrappedValue = false
        }
    }
}




struct CalendarCurrentGame_Previews: PreviewProvider {
    static var previews: some View {
        CalendarCurrentGame(appBinding: .constant(.init()))
    }
}

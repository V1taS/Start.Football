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
            Text("РЕГУЛЯРНЫЕ ТРЕНИРОВКИ")
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
            VStack(alignment: .leading, spacing: 16) {
                ForEach(appBinding.currentGame.listDate.wrappedValue, id: \.self) { date in
                    let dateString = GetDateStringFromDate.shared.getDateString(date: date)
                    let timeString = GetDateStringFromDate.shared.getTimeString(date: date)
                    Text("\(dateString): \(timeString)")
                        .foregroundColor(.secondaryColor)
                        .font(Font.event.robotoRegular16)
                }
            }
        )
    }
}

struct CalendarCurrentGame_Previews: PreviewProvider {
    static var previews: some View {
        CalendarCurrentGame(appBinding: .constant(.init()))
    }
}

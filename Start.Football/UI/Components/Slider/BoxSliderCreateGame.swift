//
//  BoxSliderCreateGame.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 18.01.2021.
//

import SwiftUI

struct BoxSliderCreateGame: View {

    @Binding var maxCountTeams: Double
    @Binding var maxCountPlayers: Double
    @Binding var maxReservePlayers: Double
    
    var body: some View {
        VStack(spacing: 16) {
            maxCountTeamsView
            Divider()
            maxCountPlayersView
            Divider()
            maxReservePlayersView
        }
    }
}


// MARK: UI
private extension BoxSliderCreateGame {
    private var maxCountTeamsView: AnyView {
        AnyView(
            VStack(alignment: .leading, spacing: 16) {
                Text("Количество команд")
                    .foregroundColor(.defaultColor)
                    .font(Font.event.robotoRegular14)
                
                HStack {
                    Slider(value: $maxCountTeams, in: 2...4, step: 1)
                    Spacer()
                    Text("\(String(format: "%.0f", maxCountTeams))")
                        .foregroundColor(.secondaryColor)
                        .font(Font.event.robotoRegular24)
                        .frame(width: UIScreen.screenWidth * Size.shared.getAdaptSizeWidth(px: 32))
                }
                .padding(3)
            }
        )
    }
}

private extension BoxSliderCreateGame {
    private var maxCountPlayersView: AnyView {
        AnyView(
            VStack(alignment: .leading, spacing: 16) {
                Text("Максимальное количество игроков в основе")
                    .foregroundColor(.defaultColor)
                    .font(Font.event.robotoRegular14)
                
                HStack {
                    Slider(value: $maxCountPlayers, in: 10...22, step: 1)
                    Spacer()
                    Text("\(String(format: "%.0f", maxCountPlayers))")
                        .foregroundColor(.secondaryColor)
                        .font(Font.event.robotoRegular24)
                        .frame(width: UIScreen.screenWidth * Size.shared.getAdaptSizeWidth(px: 32))
                }
                .padding(3)
            }
        )
    }
}

private extension BoxSliderCreateGame {
    private var maxReservePlayersView: AnyView {
        AnyView(
            VStack(alignment: .leading, spacing: 16) {
                Text("Максимальное количество игроков в резерве")
                    .foregroundColor(.defaultColor)
                    .font(Font.event.robotoRegular14)
                
                HStack {
                    Slider(value: $maxReservePlayers, in: 0...22, step: 1)
                    Spacer()
                    Text("\(String(format: "%.0f", maxReservePlayers))")
                        .foregroundColor(.secondaryColor)
                        .font(Font.event.robotoRegular24)
                        .frame(width: UIScreen.screenWidth * Size.shared.getAdaptSizeWidth(px: 32))
                }
                .padding(3)
            }
        )
    }
}

struct BoxSliderCreateGame_Previews: PreviewProvider {
    static var previews: some View {
        BoxSliderCreateGame(maxCountTeams: .constant(3),
        maxCountPlayers: .constant(15),
        maxReservePlayers: .constant(22))
    }
}

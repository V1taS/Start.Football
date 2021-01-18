//
//  BoxSliderCreateGame.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 18.01.2021.
//

import SwiftUI

struct BoxSliderCreateGame: View {
    
    let height = UIScreen.screenHeight
    let width = UIScreen.screenWidth

    @Binding var maxCountTeams: Double
    @Binding var maxCountPlayers: Double
    @Binding var maxReservePlayers: Double
    
    var body: some View {
        VStack(alignment: .leading, spacing: height * Size.shared.getAdaptSizeHeight(px: 16)) {
            Text("Количество команд")
                .foregroundColor(.defaultColor)
                .font(Font.event.robotoRegular14)
            
            HStack {
                Slider(value: $maxCountTeams, in: 2...4, step: 1)
                Spacer()
                Text("\(String(format: "%.0f", maxCountTeams))")
                    .foregroundColor(.secondaryColor)
                    .font(Font.event.robotoRegular24)
                    .frame(width: width * Size.shared.getAdaptSizeWidth(px: 32))
            }
            
            Divider()
            
            Text("Максимальное количество игроков в основе")
                .foregroundColor(.defaultColor)
                .font(Font.event.robotoRegular14)
            
            HStack {
                Slider(value: $maxCountPlayers, in: 10...22, step: 1)
                Spacer()
                Text("\(String(format: "%.0f", maxCountPlayers))")
                    .foregroundColor(.secondaryColor)
                    .font(Font.event.robotoRegular24)
                    .frame(width: width * Size.shared.getAdaptSizeWidth(px: 32))
            }
            
            Divider()
            
            Text("Максимальное количество игроков в резерве")
                .foregroundColor(.defaultColor)
                .font(Font.event.robotoRegular14)
            
            HStack {
                Slider(value: $maxReservePlayers, in: 0...22, step: 1)
                Spacer()
                Text("\(String(format: "%.0f", maxReservePlayers))")
                    .foregroundColor(.secondaryColor)
                    .font(Font.event.robotoRegular24)
                    .frame(width: width * Size.shared.getAdaptSizeWidth(px: 32))
            }
            
        }
    }
}

struct BoxSliderCreateGame_Previews: PreviewProvider {
    static var previews: some View {
        BoxSliderCreateGame(maxCountTeams: .constant(3),
        maxCountPlayers: .constant(15),
        maxReservePlayers: .constant(22))
    }
}

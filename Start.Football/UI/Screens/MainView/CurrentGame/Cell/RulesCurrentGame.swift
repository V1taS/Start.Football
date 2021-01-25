//
//  RulesCurrentGame.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 07.01.2021.
//

import SwiftUI

struct RulesCurrentGame: View {

    private var game: Game
    init(game: Game) {
        self.game = game
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 16) {
                Text("ПРАВИЛА")
                    .foregroundColor(.secondaryColor)
                    .font(Font.event.robotoMedium18)
                Text("\(game.ownRulesGame)")
                    .foregroundColor(.secondaryColor)
                    .font(Font.event.robotoRegular16)
                    .frame(width: UIScreen.screenWidth * Size.shared.getAdaptSizeWidth(px: 330))
            }
            Spacer()
        }
        .padding(.vertical, 24)
    }
}

struct RulesCurrentGame_Previews: PreviewProvider {
    static var previews: some View {
        RulesCurrentGame(game: .plugGame)
    }
}

//
//  AboutTheAreaCurrentGame.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 07.01.2021.
//

import SwiftUI

struct AboutTheAreaCurrentGame: View {
    
    private var game: Game
    init(game: Game) {
        self.game = game
    }
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 16) {
                header
                descriptionGame
            }
            Spacer()
        }
        .padding(.vertical, 24)
    }
}


// MARK: UI
private extension AboutTheAreaCurrentGame {
    private var header: AnyView {
        AnyView(
            Text("О ПЛОЩАДКЕ")
                .foregroundColor(.secondaryColor)
                .font(Font.event.robotoMedium18)
        )
    }
}

private extension AboutTheAreaCurrentGame {
    private var descriptionGame: AnyView {
        AnyView(
            Text("\(game.descriptionGame)")
                .foregroundColor(.secondaryColor)
                .font(Font.event.robotoRegular16)
                .frame(width: UIScreen.screenWidth * Size.shared.getAdaptSizeWidth(px: 330))
        )
    }
}

struct AboutTheAreaCurrentGame_Previews: PreviewProvider {
    static var previews: some View {
        AboutTheAreaCurrentGame(game: .plugGame)
    }
}

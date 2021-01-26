//
//  CommentCurrentGame.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 07.01.2021.
//

import SwiftUI

struct CommentCurrentGame: View {
    
    private var game: Game
    init(game: Game) {
        self.game = game
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 16) {
                header
                commentFromOrganizerGame
            }
            Spacer()
        }
        .padding(.top, 24)
        .padding(.bottom, 16)
    }
}


// MARK: UI
private extension CommentCurrentGame {
    private var header: AnyView {
        AnyView(
            Text("КОММЕНТАРИЙ")
                .foregroundColor(.secondaryColor)
                .font(Font.event.robotoMedium18)
        )
    }
}

private extension CommentCurrentGame {
    private var commentFromOrganizerGame: AnyView {
        AnyView(
            Text("\(game.commentFromOrganizerGame)")
                .foregroundColor(.secondaryColor)
                .font(Font.event.robotoRegular16)
                .frame(width: UIScreen.screenWidth * Size.shared.getAdaptSizeWidth(px: 330))
        )
    }
}

struct CommentCurrentGame_Previews: PreviewProvider {
    static var previews: some View {
        CommentCurrentGame(game: .plugGame)
    }
}

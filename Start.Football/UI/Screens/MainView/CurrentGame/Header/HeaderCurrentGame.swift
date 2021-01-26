//
//  HeaderCurrentGame.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 07.01.2021.
//

import SwiftUI

struct HeaderCurrentGame: View {
    
    private let game: Game
    init(game: Game) {
        self.game = game
    }
    
    let height = UIScreen.screenHeight
    let width = UIScreen.screenWidth
    
    var body: some View {
        ZStack {
            background
            
            HStack {
                nameGame
                Spacer()
                costGame
            }
            .padding(.horizontal, width * Size.shared.getAdaptSizeWidth(px: 16))
            .offset(x: width * Size.shared.getAdaptSizeWidth(px: 0),
                    y: height * Size.shared.getAdaptSizeHeight(px: 75))
        }
    }
}

// MARK: UI
private extension HeaderCurrentGame {
    private var background: AnyView {
        AnyView(
            Image("currentGamebg")
                .resizable()
                .frame(width: width * Size.shared.getAdaptSizeWidth(px: 375),
                       height: height * Size.shared.getAdaptSizeHeight(px: 230))
        )
    }
}

private extension HeaderCurrentGame {
    private var nameGame: AnyView {
        AnyView(
            Text("\(game.name)")
                .foregroundColor(.whiteColor)
                .font(Font.event.robotoBold20)
                .lineLimit(3)
                .frame(width: width * Size.shared.getAdaptSizeWidth(px: 200),
                       alignment: .leading)
        )
    }
}

private extension HeaderCurrentGame {
    private var costGame: AnyView {
        AnyView(
            ZStack {
                Color(.primaryColor)
                    .clipShape(RoundedRectangle(cornerRadius: 5))
                    .frame(width: width * Size.shared.getAdaptSizeWidth(px: 87),
                           height: height * Size.shared.getAdaptSizeHeight(px: 52))
                Text("\(game.costGame) ₽")
                    .foregroundColor(.whiteColor)
                    .font(Font.event.robotoRegular24)
            }
        )
    }
}

struct HeaderCurrentGame_Previews: PreviewProvider {
    static var previews: some View {
        HeaderCurrentGame(game: .plugGame)
    }
}

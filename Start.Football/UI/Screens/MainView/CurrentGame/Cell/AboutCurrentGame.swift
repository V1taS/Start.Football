//
//  AboutCurrentGame.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 07.01.2021.
//

import SwiftUI

struct AboutCurrentGame: View {
    
    
    private var game: Game
    init(game: Game) {
        self.game = game
    }
    @Environment(\.injected) private var injected: DIContainer
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 16) {
                header
                space
                field
                if game.dressingRooms {
                    shirt
                }
                if game.showers {
                    shower
                }
                
                parking
            }
            Spacer()
        }
        .padding(.vertical, 24)
    }
}


// MARK: UI
private extension AboutCurrentGame {
    private var header: AnyView {
        AnyView(
            Text("Что есть")
                .foregroundColor(.secondaryColor)
                .font(Font.event.robotoMedium18)
        )
    }
}

private extension AboutCurrentGame {
    private var space: AnyView {
        AnyView(
            HStack {
                Image("sun")
                    .frame(width: 18, height:18)
                Text(typeSpace(game: game))
                    .foregroundColor(.secondaryColor)
                    .font(Font.event.robotoRegular16)
            }
        )
    }
}

private extension AboutCurrentGame {
    private var field: AnyView {
        AnyView(
            HStack {
                Image("grass")
                    .frame(width: 18, height:18)
                
                Text(typeField(game: game))
                    .foregroundColor(.secondaryColor)
                    .font(Font.event.robotoRegular16)
            }
        )
    }
}

private extension AboutCurrentGame {
    private var shirt: AnyView {
        AnyView(
            VStack(spacing: 0) {
                HStack {
                    Image("shirt")
                        .frame(width: 18, height:18)
                    
                    Text("Раздевалки")
                        .foregroundColor(.secondaryColor)
                        .font(Font.event.robotoRegular16)
                }
            }
            
        )
    }
}

private extension AboutCurrentGame {
    private var shower: AnyView {
        AnyView(
            VStack(spacing: 0) {
                HStack {
                    Image("shower")
                        .frame(width: 18, height:18)
                    
                    Text("Душевые")
                        .foregroundColor(.secondaryColor)
                        .font(Font.event.robotoRegular16)
                }
            }
            
        )
    }
}

private extension AboutCurrentGame {
    private var parking: AnyView {
        AnyView(
            HStack {
                Image("parking")
                    .frame(width: 18, height:18)
                
                Text(typeParking(game: game))
                    .foregroundColor(.secondaryColor)
                    .font(Font.event.robotoRegular16)
            }
        )
    }
}


// MARK: Actions
private extension AboutCurrentGame {
    private func typeSpace(game: Game) -> String {
        injected.interactors.currentGameInteractor
            .typeSpace(game: game)
    }
    
    private func typeField(game: Game) -> String {
        injected.interactors.currentGameInteractor
            .typeField(game: game)
    }
    
    private func typeParking(game: Game) -> String {
        injected.interactors.currentGameInteractor
            .typeParking(game: game)
    }
}

struct AboutCurrentGame_Previews: PreviewProvider {
    static var previews: some View {
        AboutCurrentGame(game: .plugGame)
    }
}

//
//  WhoWillPlayCurrentGame.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 07.01.2021.
//

import SwiftUI

struct WhoWillPlayCurrentGame: View {
    
    @Environment(\.injected) private var injected: DIContainer
    @Environment(\.viewController) private var viewControllerHolder: UIViewController?
    private var viewController: UIViewController? {
        self.viewControllerHolder!
    }
    
    private var game: Game
    init(game: Game) {
        self.game = game
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            header
            
            HStack {
                photos
                Spacer()
                allPlayers
            }
        }
        .padding(.top, 24)
    }
}

// MARK: UI
private extension WhoWillPlayCurrentGame {
    private var header: AnyView {
        AnyView(
            Text("КТО БУДЕТ")
                .foregroundColor(.secondaryColor)
                .font(Font.event.robotoMedium18)
        )
    }
}

private extension WhoWillPlayCurrentGame {
    private var photos: AnyView {
        AnyView(
            HStack(alignment: .center, spacing: -15) {
                let plugPhotoPlayers = ["p1", "p2", "p3", "p4", "p5"]
                ForEach(plugPhotoPlayers, id: \.self) { photo in
                    Image(photo)
                        .resizable()
                        .frame(width: 32, height: 32)
                }
            }
        )
    }
}

private extension WhoWillPlayCurrentGame {
    private var allPlayers: AnyView {
        AnyView(
            HStack {
                Button(action: {
                    showAllPlayers()
                }) {
                    Text("Посмотреть всех")
                        .foregroundColor(.primaryColor)
                        .font(Font.event.robotoRegular16)
                    Image("right")
                }
            }
        )
    }
}

// MARK: Actions
private extension WhoWillPlayCurrentGame {
    private func showAllPlayers() {
        self.viewController?.present(style: .fullScreen) {
            
        }
    }
}

struct WhoWillPlayCurrentGame_Previews: PreviewProvider {
    static var previews: some View {
        WhoWillPlayCurrentGame(game: .plugGame)
    }
}

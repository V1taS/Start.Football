//
//  CellGameCurrentGame.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 07.01.2021.
//

import SwiftUI

struct CellGameCurrentGame: View {

    @Environment(\.injected) private var injected: DIContainer
    private var game: Game
    
    init(game: Game) {
        self.game = game
    }
    
    @Environment(\.viewController) private var viewControllerHolder: UIViewController?
    private var viewController: UIViewController? {
        self.viewControllerHolder!
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            header
            streetGame
        }
        .padding(.top, 16)
        .padding(.bottom, 24)
    }
}


// MARK: UI
private extension CellGameCurrentGame {
    private var header: AnyView {
        AnyView(
            HStack {
                TextButtonRound(name: typeGameString(game: game),
                                isOn: false,
                                backgroundColor: .primaryColor)
                
                TextButtonRound(name: formatGame(game: game),
                                isOn: false,
                                backgroundColor: .primaryColor)
                
                TextButtonRound(name: privacyGame(game: game),
                                isOn: false,
                                backgroundColor: .primaryColor)
            }
        )
    }
}

private extension CellGameCurrentGame {
    private var streetGame: AnyView {
        AnyView(
            HStack(spacing: 10) {
                Image("cellLocator")
                Text("\(game.address)")
                    .foregroundColor(.secondaryColor)
                    .font(Font.event.robotoRegular16)
                Spacer()
                distance
            }
        )
    }
}

private extension CellGameCurrentGame {
    private var distance: AnyView {
        AnyView(
            Button(action: {
                presentMap()
            }) {
                HStack(spacing: 10)  {
                    Text("5,2 км")
                        .foregroundColor(.primaryColor)
                        .font(Font.event.robotoRegular16)
                    Image("right")
                }
            }
        )
    }
}


// MARK: Actions
private extension CellGameCurrentGame {
    private func typeGameString(game: Game) -> String {
        injected.interactors.currentGameInteractor
            .typeGameString(game: game)
    }
    
    private func formatGame(game: Game) -> String {
        injected.interactors.currentGameInteractor
            .formatGame(game: game)
    }
    
    private func privacyGame(game: Game) -> String {
        injected.interactors.currentGameInteractor
            .privacyGame(game: game)
    }
    
    private func presentMap() {
        self.viewController?.present(style: .pageSheet) {
        }
    }
}

struct CellGameCurrentGame_Previews: PreviewProvider {
    static var previews: some View {
        CellGameCurrentGame(game: .plugGame)
    }
}

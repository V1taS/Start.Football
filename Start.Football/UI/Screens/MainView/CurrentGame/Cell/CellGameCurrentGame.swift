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
                TextButtonRound(name: typeGameString(),
                                isOn: false)
                
                TextButtonRound(name: formatGame(),
                                isOn: false)
                
                TextButtonRound(name: privacyGame(),
                                isOn: false)
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
    private func typeGameString() -> String {
        if game.miniFootball {
            return "Мини-футбол"
        }
        
        if game.usualFootball {
            return "Футбол"
        }
        
        if game.footsal {
            return "Футзал"
        }
        return ""
    }
}

private extension CellGameCurrentGame {
    private func formatGame() -> String {
        return "\(game.firstTeamCount) на \(game.secondTeamCount)"
    }
    
    private func privacyGame() -> String {
        if game.privacyGame == "open" {
            return "Для всех"
        }
        
        if game.privacyGame == "close" {
            return "По заявке"
        }
        return ""
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

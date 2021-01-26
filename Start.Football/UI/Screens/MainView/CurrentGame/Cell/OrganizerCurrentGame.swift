//
//  OrganizerCurrentGame.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 07.01.2021.
//

import SwiftUI

struct OrganizerCurrentGame: View {
    
    private var game: Game
    init(game: Game) {
        self.game = game
    }
    @Environment(\.injected) private var injected: DIContainer
    @Environment(\.viewController) private var viewControllerHolder: UIViewController?
    private var viewController: UIViewController? {
        self.viewControllerHolder!
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 16) {
                header
                organizatorButton
            }
            Spacer()
        }
        .padding(.vertical, 24)
    }
}


// MARK: UI
private extension OrganizerCurrentGame {
    private var header: AnyView {
        AnyView(
            Text("ОРГАНИЗАТОР")
                .foregroundColor(.secondaryColor)
                .font(Font.event.robotoMedium18)
        )
    }
}

private extension OrganizerCurrentGame {
    private var organizatorButton: AnyView {
        AnyView(
            Button(action: {
                showOrganizator()
            }) {
                HStack {
                    Image("testOrganizator")
                        .resizable()
                        .frame(width: 32, height: 32)
                    Text("Юрий Долговязов")
                        .foregroundColor(.secondaryColor)
                        .font(Font.event.robotoBold20)
                    Spacer()
                    Text(">")
                        .foregroundColor(.primaryColor)
                        .font(Font.event.robotoBold20)
                }
            }
        )
    }
}


// MARK: Actions
private extension OrganizerCurrentGame {
    private func showOrganizator() {
        self.viewController?.present(style: .pageSheet) {
            
        }
    }
}

struct OrganizerCurrentGame_Previews: PreviewProvider {
    static var previews: some View {
        OrganizerCurrentGame(game: .plugGame)
    }
}

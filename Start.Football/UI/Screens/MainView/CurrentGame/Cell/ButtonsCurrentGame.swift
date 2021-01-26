//
//  ButtonsCurrentGame.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 07.01.2021.
//

import SwiftUI

struct ButtonsCurrentGame: View {
    
    @Environment(\.viewController) private var viewControllerHolder: UIViewController?
    private var viewController: UIViewController? {
        self.viewControllerHolder!
    }

    var body: some View {
        VStack(spacing: 16) {
            Button(action: {
                signUpForGame()
            }) {
                ButtonView(background: .primaryColor,
                           textColor: .whiteColor,
                           borderColor: .primaryColor,
                           text: "Записаться на игру",
                           switchImage: false,
                           image: "")
            }
            
            Button(action: {
                signUpForReserve()
            }) {
                ButtonView(background: .whiteColor,
                           textColor: .primaryColor,
                           borderColor: .primaryColor,
                           text: "Записаться в резерв",
                           switchImage: false,
                           image: "")
            }
        }
        .padding(.bottom, 24)
    }
    
}

// MARK: Actions
private extension ButtonsCurrentGame {
    private func signUpForGame() {
        self.viewController?.present(style: .pageSheet) {
            
        }
    }
    
    private func signUpForReserve() {
        self.viewController?.present(style: .pageSheet) {
            
        }
    }
}

struct ButtonsCurrentGame_Previews: PreviewProvider {
    static var previews: some View {
        ButtonsCurrentGame()
    }
}

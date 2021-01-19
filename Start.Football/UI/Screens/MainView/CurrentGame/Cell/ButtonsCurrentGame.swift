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
    
    let height = UIScreen.screenHeight
    let width = UIScreen.screenWidth
    
    var body: some View {
        VStack(spacing: height * Size.shared.getAdaptSizeHeight(px: 16)) {
            Button(action: {}) {
                ButtonView(background: .primaryColor,
                           textColor: .whiteColor,
                           borderColor: .primaryColor,
                           text: "Записаться на игру",
                           switchImage: false,
                           image: "")
            }
            
            Button(action: {}) {
                ButtonView(background: .whiteColor,
                           textColor: .primaryColor,
                           borderColor: .primaryColor,
                           text: "Записаться в резерв",
                           switchImage: false,
                           image: "")
            }
        }
    }
}

struct ButtonsCurrentGame_Previews: PreviewProvider {
    static var previews: some View {
        ButtonsCurrentGame()
    }
}

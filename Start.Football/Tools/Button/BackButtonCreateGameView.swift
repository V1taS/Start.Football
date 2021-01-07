//
//  BackButtonCreateGameView.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 07.01.2021.
//

import SwiftUI

struct BackButtonCreateGameView: View {
    let height = UIScreen.screenHeight
    let width = UIScreen.screenWidth
    @Binding var selectionCreateGame: SelectionCreateGame
    
    var body: some View {
        Button(action: {
            switch selectionCreateGame {
            case .stepOne:
                return
            case .stepTwo:
                selectionCreateGame = .stepOne
            case .stepThree:
                selectionCreateGame = .stepTwo
            case .stepFour:
                selectionCreateGame = .stepThree
            case .stepFive:
                selectionCreateGame = .stepFour
            }
        }) {
            Image("backCreateGame").opacity(selectionCreateGame == .stepOne ? 0 : 1)
                .offset(y: height * Size.shared.getAdaptSizeHeight(px: 6))
        }
    }
}

struct BackButtonCreateGameView_Previews: PreviewProvider {
    static var previews: some View {
        BackButtonCreateGameView(selectionCreateGame: .constant(.stepOne))
    }
}

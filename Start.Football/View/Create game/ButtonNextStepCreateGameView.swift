//
//  ButtonNextStepCreateGameView.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 07.01.2021.
//

import SwiftUI

struct ButtonNextStepCreateGameView: View {
    @Binding var selectionCreateGame: SelectionCreateGame
    
    let height = UIScreen.screenHeight
    let width = UIScreen.screenWidth
    
    var body: some View {
        Button(action: {
            switch selectionCreateGame {
            case .stepOne:
                selectionCreateGame = .stepTwo
            case .stepTwo:
                selectionCreateGame = .stepThree
            case .stepThree:
                selectionCreateGame = .stepFour
            case .stepFour:
                selectionCreateGame = .stepFive
            case .stepFive:
                print("\(selectionCreateGame)")
            }
        }) {
            ButtonView(background: .primaryColor,
                       textColor: .whiteColor,
                       borderColor: .primaryColor,
                       text: selectionCreateGame == .stepFive ? "Создать игру" : "Следующий шаг")
        }.padding(.bottom, height * Size.shared.getAdaptSizeHeight(px: 17))
    }
}

struct ButtonNextStepCreateGameView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonNextStepCreateGameView(selectionCreateGame: .constant(.stepOne))
    }
}

//
//  HeaderCreateGameView.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 07.01.2021.
//

import SwiftUI

struct HeaderCreateGameView: View {
    let height = UIScreen.screenHeight
    let width = UIScreen.screenWidth
    @Binding var selectionCreateGame: SelectionCreateGame
    @Binding var progressValue: Float
    
    var body: some View {
        HStack(alignment: .firstTextBaseline, spacing: 0) {
            BackButtonCreateGameView(selectionCreateGame: $selectionCreateGame)
            Spacer()
            VStack(alignment: .center, spacing: 0) {
                Text("Создание игры")
                    .foregroundColor(.secondaryColor)
                    .font(Font.event.robotoMedium20)
                
                ProgressBarView(value: $progressValue)
            }
            Spacer()
        }
        .padding(.horizontal, width * Size.shared.getAdaptSizeWidth(px: 24))
        .padding(.top, height * Size.shared.getAdaptSizeHeight(px: 13))
    }
}

struct HeaderCreateGameView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderCreateGameView(selectionCreateGame: .constant(.stepOne),
                             progressValue: .constant(0.25))
    }
}

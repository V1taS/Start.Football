//
//  HeaderCreateGameView.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 07.01.2021.
//

import SwiftUI

struct HeaderCreateGameView: View {

    var appBinding: Binding<AppState.AppData>
    
    var body: some View {
        HStack(alignment: .firstTextBaseline, spacing: 0) {
            BackButtonCreateGameView(appBinding: appBinding)
            Spacer()
            VStack(alignment: .center, spacing: 0) {
                Text("Создание игры")
                    .foregroundColor(.secondaryColor)
                    .font(Font.event.robotoMedium20)
                
                ProgressBarView(value: appBinding.createGame.progressValue)
            }
            Spacer()
        }
        .padding(.horizontal, UIScreen.screenWidth * Size.shared.getAdaptSizeWidth(px: 24))
        .padding(.top, UIScreen.screenHeight * Size.shared.getAdaptSizeHeight(px: 13))
    }
}

struct HeaderCreateGameView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderCreateGameView(appBinding: .constant(.init()))
    }
}

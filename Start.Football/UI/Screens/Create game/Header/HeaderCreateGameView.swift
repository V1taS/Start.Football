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
    
    var appBinding: Binding<AppState.AppData.CreateGame>
    
    var body: some View {
        HStack(alignment: .firstTextBaseline, spacing: 0) {
            BackButtonCreateGameView(appBinding: appBinding)
            Spacer()
            VStack(alignment: .center, spacing: 0) {
                Text("Создание игры")
                    .foregroundColor(.secondaryColor)
                    .font(Font.event.robotoMedium20)
                
                ProgressBarView(value: appBinding.progressValue)
            }
            Spacer()
        }
        .padding(.horizontal, width * Size.shared.getAdaptSizeWidth(px: 24))
        .padding(.top, height * Size.shared.getAdaptSizeHeight(px: 13))
    }
}

struct HeaderCreateGameView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderCreateGameView(appBinding: .constant(.init(
                                                    selectionCreateGame: .stepTwo,
                                                    progressValue: 0.25,
                                                    nameGame: "Игра",
                                                    addressGame: "Khimki",
                                                    participationCost: "23",
                                                    currentDate: Date(),
                                                    showTimePicker: false,
                                                    showDatePicker: false,
                                                    oneTime: "",
                                                    oneTimeTextHasBeenChanged: false,
                                                    oneDay: "",
                                                    oneDayTextHasBeenChanged: false))
        )
    }
}

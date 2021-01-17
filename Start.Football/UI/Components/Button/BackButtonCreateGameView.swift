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
    @Binding var appBinding: AppState.AppData.CreateGame
    @Environment(\.injected) private var injected: DIContainer
    
    var body: some View {
        Button(action: {
            backStepProgressBar()
            refreshProgressBar()
        }) {
            Image("backCreateGame").opacity(appBinding.selectionCreateGame == .stepOne ? 0 : 1)
                .offset(y: height * Size.shared.getAdaptSizeHeight(px: 6))
        }
    }
}

private extension BackButtonCreateGameView {
    func backStepProgressBar() {
        injected.interactors.createGameInteractor
            .backStepProgressBar(state: $appBinding)
    }
}

private extension BackButtonCreateGameView {
    func refreshProgressBar() {
        injected.interactors.createGameInteractor
            .refreshProgressBar(state: $appBinding)
    }
}


struct BackButtonCreateGameView_Previews: PreviewProvider {
    static var previews: some View {
        BackButtonCreateGameView(appBinding: .constant(.init(
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
                                                        oneDayTextHasBeenChanged: false)))
    }
}

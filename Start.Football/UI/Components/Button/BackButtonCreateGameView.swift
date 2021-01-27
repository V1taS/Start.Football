//
//  BackButtonCreateGameView.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 07.01.2021.
//

import SwiftUI

struct BackButtonCreateGameView: View {
    
    @Binding var appBinding: AppState.AppData
    @Environment(\.injected) private var injected: DIContainer
    
    var body: some View {
        Button(action: {
            backStepProgressBar()
            refreshProgressBar()
        }) {
            Image("backCreateGame")
                .opacity(appBinding.createGame
                            .selectionCreateGame == .stepOne ? 0 : 1)
                .offset(y: UIScreen.screenHeight *
                            Size.shared.getAdaptSizeHeight(px: 6))
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
        BackButtonCreateGameView(appBinding: .constant(.init()))
    }
}

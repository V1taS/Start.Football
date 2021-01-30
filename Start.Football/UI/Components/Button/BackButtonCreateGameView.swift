//
//  BackButtonCreateGameView.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 07.01.2021.
//

import SwiftUI

struct BackButtonCreateGameView: View {
    
    private var appBinding: Binding<AppState.AppData>
    init(appBinding: Binding<AppState.AppData>) {
        self.appBinding = appBinding
    }
    @Environment(\.injected) private var injected: DIContainer
    
    @Environment(\.viewController) private var viewControllerHolder: UIViewController?
    private var viewController: UIViewController? {
        self.viewControllerHolder!
    }
    
    var body: some View {
        Button(action: {
            backStepProgressBar()
            refreshProgressBar()
            
        }) {
            Image("backCreateGame")
                .offset(y: UIScreen.screenHeight *
                            Size.shared.getAdaptSizeHeight(px: 6))
            
        }
    }
}

private extension BackButtonCreateGameView {
    func backStepProgressBar() {
        injected.interactors.createGameInteractor
            .backStepProgressBar(state: appBinding)
    }
}

private extension BackButtonCreateGameView {
    func refreshProgressBar() {
        injected.interactors.createGameInteractor
            .refreshProgressBar(state: appBinding)
    }
}


struct BackButtonCreateGameView_Previews: PreviewProvider {
    static var previews: some View {
        BackButtonCreateGameView(appBinding: .constant(.init()))
    }
}

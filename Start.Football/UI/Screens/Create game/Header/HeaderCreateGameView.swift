//
//  HeaderCreateGameView.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 07.01.2021.
//

import SwiftUI

struct HeaderCreateGameView: View {
    
    private var appBinding: Binding<AppState.AppData>
    init(appBinding: Binding<AppState.AppData>) {
        self.appBinding = appBinding
    }
    
    var body: some View {
        ZStack {
            HStack {
                if appBinding.createGame.selectionCreateGame.wrappedValue != .stepOne {
                    backButton
                }
                
                Spacer()
                dissMissButton
            }
            HStack(alignment: .firstTextBaseline, spacing: 0) {
                Spacer()
                main
                Spacer()
            }
            .padding(.horizontal, UIScreen.screenWidth * Size.shared.getAdaptSizeWidth(px: 24))
        }
    }
}


// MARK: UI
private extension HeaderCreateGameView {
    private var backButton: AnyView {
        AnyView(
            BackButtonCreateGameView(appBinding: appBinding)
        )
    }
}

private extension HeaderCreateGameView {
    private var dissMissButton: AnyView {
        AnyView(
            DissMissButtonCreateGameView(showSheet: appBinding.main.showCreateGameView)
        )
    }
}

private extension HeaderCreateGameView {
    private var main: AnyView {
        AnyView(
            VStack(alignment: .center, spacing: 0) {
                Text("Создание игры")
                    .foregroundColor(.secondaryColor)
                    .font(Font.event.robotoMedium20)
                
                ProgressBarView(value: appBinding.createGame.progressValue)
            }
        )
    }
}

struct HeaderCreateGameView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderCreateGameView(appBinding: .constant(.init()))
    }
}

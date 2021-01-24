//
//  CreateGameView.swift
//  Start.Football
//
//  Created by Виталий Сосин on 09.12.2020.
//

import SwiftUI
import Combine

struct CreateGameView: View {
    
    private var appBinding: Binding<AppState.AppData>
    init(appBinding: Binding<AppState.AppData>) {
        self.appBinding = appBinding
    }
    
    @Environment(\.injected) private var injected: DIContainer
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                header
                content
                Spacer()
                buttonNextStep
            }
            backgroundColor
            typeOfParking
        }
        .dismissingKeyboard()
    }
}


// MARK: Actions
private extension CreateGameView {
    private var header: AnyView {
        AnyView(HeaderCreateGameView(appBinding: appBinding))
    }
}

private extension CreateGameView {
    private var content: AnyView {
        switch appBinding.createGame.selectionCreateGame .wrappedValue{
        case .stepOne:
            return AnyView(CreateGameStepOne(appBinding: appBinding))
        case .stepTwo:
            return AnyView(CreateGameStepTwo(appBinding: appBinding))
        case .stepThree:
            return AnyView(CreateGameStepThree(appBinding: appBinding))
        case .stepFour:
            return AnyView(CreateGameStepFour(appBinding: appBinding))
        case .stepFive:
            return AnyView(CreateGameStepFive())
        }
    }
}

private extension CreateGameView {
    var buttonNextStep: some View {
        Button(action: {
            nextStepProgressBar()
            refreshProgressBar()
        }) {
            ButtonView(background: .primaryColor,
                       textColor: .whiteColor,
                       borderColor: .primaryColor,
                       text: appBinding.createGame.selectionCreateGame.wrappedValue ==
                        .stepFive ? "Создать игру" : "Следующий шаг",
                       switchImage: false,
                       image: "")
        }
        .padding(.bottom, UIScreen.screenHeight * Size.shared.getAdaptSizeHeight(px: 17))
        .padding(.horizontal, 24)
    }
}

private extension CreateGameView {
    var typeOfParking: some View {
        TypeOfParkingSheet(appBinding: appBinding)
            .animation(.easeInOut(duration: 0.5))
            .offset(y: UIScreen.screenHeight * Size.shared.getAdaptSizeHeight(px: 85))
    }
}

private extension CreateGameView {
    var backgroundColor: some View {
        ZStack {
            if appBinding.createGame.showParking.wrappedValue {
                Color.secondary
                    .edgesIgnoringSafeArea(.all)
                    .animation(.linear(duration: 10))
            }
        }
        .onTapGesture {
            dismissButton()
        }
    }
}


// MARK: Actions
private extension CreateGameView {
    private func nextStepProgressBar() {
        injected.interactors.createGameInteractor
            .nextStepProgressBar(state: appBinding)
    }
    
    private func refreshProgressBar() {
        injected.interactors.createGameInteractor
            .refreshProgressBar(state: appBinding)
    }
    
    private func dismissButton() {
        if appBinding.createGame.showParking.wrappedValue {
            appBinding.createGame.showParking.wrappedValue = false
        }
    }
}

struct CreateGameView_Previews: PreviewProvider {
    static var previews: some View {
        CreateGameView(appBinding: .constant(.init()))
    }
}

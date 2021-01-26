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
    @Environment(\.viewController) private var viewControllerHolder: UIViewController?
    private var viewController: UIViewController? {
        self.viewControllerHolder!
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
            return AnyView(CreateGameStepFive(appBinding: appBinding))
        }
    }
}

private extension CreateGameView {
    var buttonNextStep: some View {
        VStack(spacing: 0) {
            if appBinding.createGame.selectionCreateGame.wrappedValue ==
                .stepFive {
                Button(action: {
                    configureCreateGameButton(state: appBinding)
                }) {
                    ButtonView(background: .primaryColor,
                               textColor: .whiteColor,
                               borderColor: .primaryColor,
                               text: "Создать игру",
                               switchImage: false,
                               image: "")
                }
                .padding(.bottom, UIScreen.screenHeight * Size.shared.getAdaptSizeHeight(px: 17))
                .padding(.horizontal, 24)
            } else {
                Button(action: {
                    configureNextStepButton(state: appBinding)
                }) {
                    ButtonView(background: .primaryColor,
                               textColor: .whiteColor,
                               borderColor: .primaryColor,
                               text: "Следующий шаг",
                               switchImage: false,
                               image: "")
                }
                .padding(.bottom, UIScreen.screenHeight * Size.shared.getAdaptSizeHeight(px: 17))
                .padding(.horizontal, 24)
            }
        }
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
            dismissSheetParkingButton(state: appBinding)
        }
    }
}


// MARK: Actions
private extension CreateGameView {
    private func nextStepCreateGame(state: Binding<AppState.AppData>) {
        injected.interactors.createGameInteractor
            .nextStepProgressBar(state: state)
    }
    
    private func refreshProgressBar(state: Binding<AppState.AppData>) {
        injected.interactors.createGameInteractor
            .refreshProgressBar(state: state)
    }
    
    private func dismissSheetParkingButton(state: Binding<AppState.AppData>) {
        injected.interactors.createGameInteractor
            .dismissSheetParkingButton(state: state)
    }
    
    private func appendCurrentGameToMyGameAndAllGame(state: Binding<AppState.AppData>, game: Game) {
        injected.interactors.createGameInteractor
            .appendCurrentGameToMyGameAndAllGame(state: state, game: game)
    }
    
    
    private func clearCreateGame(state: Binding<AppState.AppData>) {
        injected.interactors.createGameInteractor
            .clearCreateGame(state: state)
    }
    
    private func currentGame(state: Binding<AppState.AppData>) -> Game {
        injected.interactors.createGameInteractor
            .currentGame(state: state)
    }
    
    private func validNameGame(state: Binding<AppState.AppData>) {
        injected.interactors.createGameInteractor.validNameGame(state: state)
    }
    
    private func validAddressGame(state: Binding<AppState.AppData>) {
        injected.interactors.createGameInteractor
            .validAddressGame(state: state)
    }
    
    private func validCostGame(state: Binding<AppState.AppData>) {
        injected.interactors.createGameInteractor
            .validCostGame(state: state)
    }
    
    private func configureCreateGameButton(state: Binding<AppState.AppData>) {
        self.viewController?.present(style: .fullScreen) {
            CurrentGameView(game: currentGame(state: state))
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            nextStepCreateGame(state: state)
            refreshProgressBar(state: state)
            appendCurrentGameToMyGameAndAllGame(state: state, game: currentGame(state: state))
            appBinding.main.tag.wrappedValue = 0
            clearCreateGame(state: state)
            state.main.selectionGame.wrappedValue = .myGames
        }
    }
    
    private func configureNextStepButton(state: Binding<AppState.AppData>) {
        validNameGame(state: state)
        validAddressGame(state: state)
        validCostGame(state: state)
        
        if injected.interactors.createGameInteractor
            .disableNextStepButton(state: state) {
            nextStepCreateGame(state: state)
            refreshProgressBar(state: state)
        }
    }
}

struct CreateGameView_Previews: PreviewProvider {
    static var previews: some View {
        CreateGameView(appBinding: .constant(.init()))
    }
}

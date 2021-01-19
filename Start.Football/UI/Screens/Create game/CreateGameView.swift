//
//  CreateGameView.swift
//  Start.Football
//
//  Created by Виталий Сосин on 09.12.2020.
//

import SwiftUI
import Combine

struct CreateGameView: View {
    @State private var appState: AppState.AppData.CreateGame = .init()
    private var appBinding: Binding<AppState.AppData.CreateGame> {
        $appState.dispatched(to: injected.appState, \.appData.createGame)
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
            
            if appBinding.showParking.wrappedValue || appBinding.showDatePicker.wrappedValue || appBinding.showTimePicker.wrappedValue {
                Color.secondary
                    .edgesIgnoringSafeArea(.all)
                    .animation(.linear(duration: 10))
            }
            
            timePicker
            datePicker
            typeOfParking
        }
        .dismissingKeyboard()
    }
}

// MARK: - Header
private extension CreateGameView {
    private var header: AnyView {
        AnyView(HeaderCreateGameView(appBinding: appBinding))
    }
}

// MARK: - Сontent
private extension CreateGameView {
    private var content: AnyView {
        switch appState.selectionCreateGame {
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

// MARK: - Button Next Step
private extension CreateGameView {
    var buttonNextStep: some View {
        Button(action: {
            nextStepProgressBar()
            refreshProgressBar()
        }) {
            ButtonView(background: .primaryColor,
                       textColor: .whiteColor,
                       borderColor: .primaryColor,
                       text: appState.selectionCreateGame ==
                        .stepFive ? "Создать игру" : "Следующий шаг",
                       switchImage: false,
                       image: "")
        }
        .padding(.bottom, UIScreen.screenHeight * Size.shared.getAdaptSizeHeight(px: 17))
        .padding(.horizontal, 24)
    }
}

// MARK: - Time picker
private extension CreateGameView {
    var timePicker: some View {
        TimePickerSheet(appBinding: appBinding)
            .offset(y: UIScreen.screenHeight * Size.shared.getAdaptSizeHeight(px: 230))
    }
}

// MARK: - Date picker
private extension CreateGameView {
    var datePicker: some View {
        DatePickerSheet(appBinding: appBinding)
            .offset(y: UIScreen.screenHeight * Size.shared.getAdaptSizeHeight(px: 230))
    }
}

// MARK: - Type of parking
private extension CreateGameView {
    var typeOfParking: some View {
        TypeOfParkingSheet(appBinding: appBinding)
            .offset(y: UIScreen.screenHeight * Size.shared.getAdaptSizeHeight(px: 85))
    }
}

// MARK: - Injected Interactors
private extension CreateGameView {
    func nextStepProgressBar() {
        injected.interactors.createGameInteractor
            .nextStepProgressBar(state: appBinding)
    }
}

private extension CreateGameView {
    func refreshProgressBar() {
        injected.interactors.createGameInteractor
            .refreshProgressBar(state: appBinding)
    }
}

struct CreateGameView_Previews: PreviewProvider {
    static var previews: some View {
        CreateGameView()
    }
}

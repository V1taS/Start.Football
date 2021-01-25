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
                    nextStepProgressBar()
                    refreshProgressBar()
                    createTeam()

                    self.viewController?.showAlert(with: "Внимание!",
                                                   and: "Вы успешно создали команду!") {
                        appBinding.main.tag.wrappedValue = 0
                        clearCreateGame()
                    }
                    
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
                    nextStepProgressBar()
                    refreshProgressBar()
                    
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
    
    private func createTeam() {
        appBinding.main.listAllGames.wrappedValue.append(Game(
            id: UUID().uuidString,
            name: appBinding.createGame.nameGame.wrappedValue,
            imageStringURL: "",
            gameNumber: "\(appBinding.main.listAllGames.wrappedValue.count + 1)",
            address: appBinding.createGame.addressGame.wrappedValue,
            costGame: appBinding.createGame.costGame.wrappedValue,
            oneGameDate: appBinding.createGame.currentDate.wrappedValue,
            regularGame: appBinding.createGame.selectionRegularGame.wrappedValue.rawValue,
            listGameRegularGame: appBinding.createGame.listGame.wrappedValue,
            listDateRegularGame: appBinding.createGame.listDate.wrappedValue,
            miniFootball: appBinding.createGame.miniFootball.wrappedValue,
            usualFootball: appBinding.createGame.usualFootball.wrappedValue,
            footsal: appBinding.createGame.footsal.wrappedValue,
            street: appBinding.createGame.street.wrappedValue,
            manege: appBinding.createGame.manege.wrappedValue,
            hall: appBinding.createGame.hall.wrappedValue,
            parquet: appBinding.createGame.parquet.wrappedValue,
            grass: appBinding.createGame.grass.wrappedValue,
            caoutchouc: appBinding.createGame.caoutchouc.wrappedValue,
            synthetics: appBinding.createGame.synthetics.wrappedValue,
            hair: appBinding.createGame.hair.wrappedValue,
            crumb: appBinding.createGame.crumb.wrappedValue,
            firstTeamCount: appBinding.createGame.firstValue.wrappedValue,
            secondTeamCount: appBinding.createGame.secondValue.wrappedValue,
            maxCountTeams: appBinding.createGame.maxCountTeams.wrappedValue,
            maxCountPlayers: appBinding.createGame.maxCountPlayers.wrappedValue,
            maxReservePlayers: appBinding.createGame.maxReservePlayers.wrappedValue,
            privacyGame: appBinding.createGame.privacyGame.wrappedValue.rawValue,
            dressingRooms: appBinding.createGame.dressingRooms.wrappedValue,
            showers: appBinding.createGame.showers.wrappedValue,
            typeOfParking: appBinding.createGame.typeOfParking.wrappedValue.rawValue,
            paymentForParking: appBinding.createGame.paymentForParking.wrappedValue.rawValue,
            parkingCost: appBinding.createGame.parkingCost.wrappedValue,
            descriptionGame: appBinding.createGame.descriptionGame.wrappedValue,
            ownRulesGame: appBinding.createGame.ownRules.wrappedValue,
            commentFromOrganizerGame: appBinding.createGame.commentFromOrganizer.wrappedValue
        ))
    }
    
    private func clearCreateGame() {
        appBinding.createGame.addressGame.wrappedValue = ""
        
        appBinding.createGame.selectionCreateGame.wrappedValue = .stepOne
        appBinding.createGame.progressValue.wrappedValue = 0.0
        
        // MARK: - Step 1
        appBinding.createGame.nameGame.wrappedValue = ""
        appBinding.createGame.addressGame.wrappedValue = ""
        appBinding.createGame.costGame.wrappedValue = ""
        
        
        appBinding.createGame.currentDate.wrappedValue = Date()
        appBinding.createGame.currentTimeHasBeenChanged.wrappedValue = false
        appBinding.createGame.currentDateHasBeenChanged.wrappedValue = false
        
        // MARK: - Step 2
        appBinding.createGame.selectionRegularGame.wrappedValue = .no
        
        // MARK: Day Of Week
        appBinding.createGame.listGame.wrappedValue = [false, false, false, false, false, false, false]
        appBinding.createGame.listDate.wrappedValue = [Date(), Date(), Date(), Date(), Date(), Date(), Date()]
        appBinding.createGame.anyTimeHasBeenChanged.wrappedValue = false
        
        // MARK: - Step 3
        // MARK: Type Game
        appBinding.createGame.miniFootball.wrappedValue = true
        appBinding.createGame.usualFootball.wrappedValue = false
        appBinding.createGame.footsal.wrappedValue = false
        
        // MARK: Place Play
        appBinding.createGame.street.wrappedValue = true
        appBinding.createGame.manege.wrappedValue = false
        appBinding.createGame.hall.wrappedValue = false
        
        // MARK: Type Field
        appBinding.createGame.parquet.wrappedValue = false
        appBinding.createGame.grass.wrappedValue = true
        appBinding.createGame.caoutchouc.wrappedValue = false
        
        // MARK: Coating Properties
        appBinding.createGame.synthetics.wrappedValue = false
        appBinding.createGame.hair.wrappedValue = false
        appBinding.createGame.crumb.wrappedValue = true
        
        // MARK: Формат игры
        appBinding.createGame.firstValue.wrappedValue = "5"
        appBinding.createGame.secondValue.wrappedValue = "5"
        
        // MARK: Кол-во команд, игроков
        appBinding.createGame.maxCountTeams.wrappedValue = 3
        appBinding.createGame.maxCountPlayers.wrappedValue = 15
        appBinding.createGame.maxReservePlayers.wrappedValue = 3
        
        // MARK: Приватность
        appBinding.createGame.privacyGame.wrappedValue = .open
        
        // MARK: Удобства
        appBinding.createGame.dressingRooms.wrappedValue = false
        appBinding.createGame.showers.wrappedValue = false
        
        // MARK: Парковка
        appBinding.createGame.showParking.wrappedValue = false
        appBinding.createGame.typeOfParking.wrappedValue = .freeCity
        appBinding.createGame.paymentForParking.wrappedValue = .non
        appBinding.createGame.parkingCost.wrappedValue = ""
    }
}

struct CreateGameView_Previews: PreviewProvider {
    static var previews: some View {
        CreateGameView(appBinding: .constant(.init()))
    }
}

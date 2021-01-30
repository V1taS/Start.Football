//
//  CreateGameStepThree.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 07.01.2021.
//

import SwiftUI

struct CreateGameStepThree: View {
    
    @Environment(\.injected) private var injected: DIContainer
    private var appBinding: Binding<AppState.AppData>
    init(appBinding: Binding<AppState.AppData>) {
        self.appBinding = appBinding
    }
    
    var body: some View {
        ZStack {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading, spacing: 16) {
                    Group {
                        gameType
                        formatGameTextField
                        boxSliderCreateGame
                            .accentColor(.primaryColor)
                        boxPrivacyCreateGame
                    }
                    Divider()
                    Group {
                        Text("Дополнительная информация")
                            .foregroundColor(.secondaryColor)
                            .font(Font.event.robotoMedium20)
                        
                        placeType
                        fieldType
                        coatingProperties
                        infrastructure
                        ButtonParking(appBinding: appBinding)
                    }
                }
                .padding(.horizontal, 24)
            }
            .padding(.top, 24)
        }
        .dismissingKeyboard()
    }
}

// MARK: UI
private extension CreateGameStepThree {
    private var gameType: AnyView {
        AnyView(
            Group {
                Text("Тип игры")
                    .foregroundColor(.defaultColor)
                    .font(Font.event.robotoRegular14)
                HStack {
                    Button(action: {
                        selectMiniFootball()
                    }) {
                        TextButtonRound(name: "Мини-футбол",
                                        isOn: appBinding.createGame
                                            .miniFootball.wrappedValue,
                                        backgroundColor: .primaryColor)
                    }
                    
                    Button(action: {
                        selectFootball()
                    }) {
                        TextButtonRound(name: "Футбол",
                                        isOn: appBinding.createGame
                                            .usualFootball.wrappedValue,
                                        backgroundColor: .primaryColor)
                    }
                    
                    Button(action: {
                        selectFootsal()
                    }) {
                        TextButtonRound(name: "Футзал",
                                        isOn: appBinding.createGame
                                            .footsal.wrappedValue,
                                        backgroundColor: .primaryColor)
                    }
                }
            }
        )
    }
}

private extension CreateGameStepThree {
    private var placeType: AnyView {
        AnyView(
            Group {
                Text("Где играть")
                    .foregroundColor(.defaultColor)
                    .font(Font.event.robotoRegular14)
                
                HStack {
                    Button(action: {
                        selectStreet()
                    }) {
                        TextButtonRound(name: "Улица",
                                        isOn: appBinding.createGame
                                            .street.wrappedValue,
                                        backgroundColor: .primaryColor)
                    }
                    
                    Button(action: {
                        selectManege()
                    }) {
                        TextButtonRound(name: "Манеж",
                                        isOn: appBinding.createGame
                                            .manege.wrappedValue,
                                        backgroundColor: .primaryColor)
                    }
                    
                    Button(action: {
                        selectHall()
                    }) {
                        TextButtonRound(name: "Зал",
                                        isOn: appBinding.createGame
                                            .hall.wrappedValue,
                                        backgroundColor: .primaryColor)
                    }
                }
            }
        )
    }
}

private extension CreateGameStepThree {
    private var fieldType: AnyView {
        AnyView(
            Group {
                Text("Тип покрытия")
                    .foregroundColor(.defaultColor)
                    .font(Font.event.robotoRegular14)
                
                HStack {
                    
                    Button(action: {
                        selectParquet()
                    }) {
                        TextButtonRound(name: "Паркет",
                                        isOn: appBinding.createGame
                                            .parquet.wrappedValue,
                                        backgroundColor: .primaryColor)
                    }
                    
                    Button(action: {
                        selectGrass()
                    }) {
                        TextButtonRound(name: "Газон",
                                        isOn: appBinding.createGame
                                            .grass.wrappedValue,
                                        backgroundColor: .primaryColor)
                    }
                    
                    Button(action: {
                        selectCaoutchouc()
                    }) {
                        TextButtonRound(name: "Резина",
                                        isOn: appBinding.createGame
                                            .caoutchouc.wrappedValue,
                                        backgroundColor: .primaryColor)
                    }
                }
            }
        )
    }
}

private extension CreateGameStepThree {
    private var coatingProperties: AnyView {
        AnyView(
            Group {
                HStack {
                    
                    Button(action: {
                        selectSynthetics()
                    }) {
                        TextButtonRound(name: "Синтетика",
                                        isOn: appBinding.createGame
                                            .synthetics.wrappedValue,
                                        backgroundColor: .primaryColor)
                    }
                    
                    Button(action: {
                        selectHair()
                    }) {
                        TextButtonRound(name: "Ворс",
                                        isOn: appBinding.createGame
                                            .hair.wrappedValue,
                                        backgroundColor: .primaryColor)
                    }
                    
                    Button(action: {
                        selectCrumb()
                    }) {
                        TextButtonRound(name: "Крошка",
                                        isOn: appBinding.createGame
                                            .crumb.wrappedValue,
                                        backgroundColor: .primaryColor)
                    }
                }
            }
        )
    }
}

private extension CreateGameStepThree {
    private var formatGameTextField: AnyView {
        AnyView(
            FormatGameTextField(firstValue: appBinding.createGame.firstValue,
                                secondValue: appBinding.createGame.secondValue)
        )
    }
}

private extension CreateGameStepThree {
    private var boxSliderCreateGame: AnyView {
        AnyView(
            BoxSliderCreateGame(maxCountTeams: appBinding.createGame.maxCountTeams,
                                maxCountPlayers: appBinding.createGame.maxCountPlayers,
                                maxReservePlayers: appBinding.createGame.maxReservePlayers)
        )
    }
}

private extension CreateGameStepThree {
    private var boxPrivacyCreateGame: AnyView {
        AnyView(
            BoxPrivacyCreateGame(privacyGame: appBinding.createGame.privacyGame)
        )
    }
}

private extension CreateGameStepThree {
    private var infrastructure: AnyView {
        AnyView(
            Group {
                Text("Инфраструктура")
                    .foregroundColor(.defaultColor)
                    .font(Font.event.robotoRegular14)
                
                HStack {
                    Button(action: {
                        dressingRooms(state: appBinding)
                    }) {
                        TextButtonRound(name: "Раздевалки",
                                        isOn: appBinding.createGame
                                            .dressingRooms.wrappedValue,
                                        backgroundColor: .primaryColor)
                    }
                    
                    Button(action: {
                        showers(state: appBinding)
                    }) {
                        TextButtonRound(name: "Душевые",
                                        isOn: appBinding.createGame
                                            .showers.wrappedValue,
                                        backgroundColor: .primaryColor)
                    }
                    
                }
            }
        )
    }
}


// MARK: Actions
private extension CreateGameStepThree {
    // Type Game
    private func selectMiniFootball() {
        injected.interactors.createGameInteractor
            .selectMiniFootball(state: appBinding)
    }
    
    private func selectFootball() {
        injected.interactors.createGameInteractor
            .selectFootball(state: appBinding)
    }
    
    private func selectFootsal() {
        injected.interactors.createGameInteractor
            .selectFootsal(state: appBinding)
    }
}

private extension CreateGameStepThree {
    // Place Play
    private func selectStreet() {
        injected.interactors.createGameInteractor
            .selectStreet(state: appBinding)
    }
    
    private func selectManege() {
        injected.interactors.createGameInteractor
            .selectManege(state: appBinding)
    }
    
    private func selectHall() {
        injected.interactors.createGameInteractor
            .selectHall(state: appBinding)
    }
}

private extension CreateGameStepThree {
    // Type Field
    private func selectParquet() {
        injected.interactors.createGameInteractor
            .selectParquet(state: appBinding)
    }
    
    private func selectGrass() {
        injected.interactors.createGameInteractor
            .selectGrass(state: appBinding)
    }
    
    private func selectCaoutchouc() {
        injected.interactors.createGameInteractor
            .selectCaoutchouc(state: appBinding)
    }
}

private extension CreateGameStepThree {
    // Coating Properties
    private func selectSynthetics() {
        injected.interactors.createGameInteractor
            .selectSynthetics(state: appBinding)
    }
    
    private func selectHair() {
        injected.interactors.createGameInteractor
            .selectHair(state: appBinding)
    }
    
    private func selectCrumb() {
        injected.interactors.createGameInteractor
            .selectCrumb(state: appBinding)
    }
}

private extension CreateGameStepThree {
    private func dressingRooms(state: Binding<AppState.AppData>) {
        injected.interactors.createGameInteractor
            .dressingRooms(state: state)
    }
    
    private func showers(state: Binding<AppState.AppData>) {
        injected.interactors.createGameInteractor.showers(state: state)
    }
}

struct CreateGameStepThree_Previews: PreviewProvider {
    static var previews: some View {
        CreateGameStepThree(appBinding: .constant(.init()))
    }
}

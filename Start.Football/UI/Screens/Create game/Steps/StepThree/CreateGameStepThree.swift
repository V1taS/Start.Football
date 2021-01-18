//
//  CreateGameStepThree.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 07.01.2021.
//

import SwiftUI

struct CreateGameStepThree: View {
    
    @Environment(\.injected) private var injected: DIContainer
    var appBinding: Binding<AppState.AppData.CreateGame>
    
    var body: some View {
        ZStack {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading, spacing: 16) {
                    
                    gameType
                    
                    Group {
                        FormatGameTextField(firstValue: appBinding.firstValue,
                                            secondValue: appBinding.secondValue)
                        
                        BoxSliderCreateGame(maxCountTeams: appBinding.maxCountTeams,
                                            maxCountPlayers: appBinding.maxCountPlayers,
                                            maxReservePlayers: appBinding.maxReservePlayers)
                        
                        BoxPrivacyCreateGame(privacyGame: appBinding.privacyGame)
                    }
                    
                    Divider()
                    
                    Text("Дополнительная информация")
                        .foregroundColor(.secondaryColor)
                        .font(Font.event.robotoMedium20)
                    
                    Group {
                        Text("Где играть")
                            .foregroundColor(.defaultColor)
                            .font(Font.event.robotoRegular14)
                        
                        placeType
                    }
                    
                    Group {
                        Text("Тип покрытия")
                            .foregroundColor(.defaultColor)
                            .font(Font.event.robotoRegular14)
                        
                        fieldType
                        coatingProperties
                    }
                    
                    Group {
                        Text("Инфраструктура")
                            .foregroundColor(.defaultColor)
                            .font(Font.event.robotoRegular14)
                        
                        HStack {
                            Button(action: {
                                appBinding.dressingRooms.wrappedValue.toggle()
                            }) {
                                TextButtonRound(name: "Раздевалки",
                                                isOn: appBinding.dressingRooms.wrappedValue)
                            }
                            
                            Button(action: {
                                appBinding.showers.wrappedValue.toggle()
                            }) {
                                TextButtonRound(name: "Душевые",
                                                isOn: appBinding.showers.wrappedValue)
                            }

                        }
                    }
                    ButtonParking(showParkingView: appBinding.showParkingView)
                }
            }
            .padding(.horizontal, 24)
            .padding(.top, 32)
            TypeOfParkingSheet(isSheetActive: appBinding.showParkingView)
        }
        .dismissingKeyboard()
    }
}

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
                                        isOn: appBinding.miniFootball.wrappedValue)
                    }
                    
                    Button(action: {
                        selectFootball()
                    }) {
                        TextButtonRound(name: "Футбол",
                                        isOn: appBinding.football.wrappedValue)
                    }
                    
                    Button(action: {
                        selectFootsal()
                    }) {
                        TextButtonRound(name: "Футзал",
                                        isOn: appBinding.footsal.wrappedValue)
                    }
                }
            }
        )
    }
}

private extension CreateGameStepThree {
    private var placeType: AnyView {
        AnyView(
            HStack {
                Button(action: {
                    selectStreet()
                }) {
                    TextButtonRound(name: "Улица",
                                    isOn: appBinding.street.wrappedValue)
                }
                
                Button(action: {
                    selectManege()
                }) {
                    TextButtonRound(name: "Манеж",
                                    isOn: appBinding.manege.wrappedValue)
                }
                
                Button(action: {
                    selectHall()
                }) {
                    TextButtonRound(name: "Зал",
                                    isOn: appBinding.hall.wrappedValue)
                }
            }
        )
    }
}

private extension CreateGameStepThree {
    private var fieldType: AnyView {
        AnyView(
            HStack {
                
                Button(action: {
                    selectParquet()
                }) {
                    TextButtonRound(name: "Паркет",
                                    isOn: appBinding.parquet.wrappedValue)
                }
                
                Button(action: {
                    selectGrass()
                }) {
                    TextButtonRound(name: "Газон",
                                    isOn: appBinding.grass.wrappedValue)
                }
                
                Button(action: {
                    selectCaoutchouc()
                }) {
                    TextButtonRound(name: "Резина",
                                    isOn: appBinding.caoutchouc.wrappedValue)
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
                                        isOn: appBinding.synthetics.wrappedValue)
                    }
                    
                    Button(action: {
                        selectHair()
                    }) {
                        TextButtonRound(name: "Ворс",
                                        isOn: appBinding.hair.wrappedValue)
                    }
                    
                    Button(action: {
                        selectCrumb()
                    }) {
                        TextButtonRound(name: "Крошка",
                                        isOn: appBinding.crumb.wrappedValue)
                    }
                }
            }
        )
    }
}

private extension CreateGameStepThree {
    // MARK: Type Game
    private func selectMiniFootball() {
        injected.interactors.createGameInteractor.selectMiniFootball(state: appBinding)
    }
    
    private func selectFootball() {
        injected.interactors.createGameInteractor.selectFootball(state: appBinding)
    }
    
    private func selectFootsal() {
        injected.interactors.createGameInteractor.selectFootsal(state: appBinding)
    }
}

private extension CreateGameStepThree {
    // MARK: Place Play
    private func selectStreet() {
        injected.interactors.createGameInteractor.selectStreet(state: appBinding)
    }
    
    private func selectManege() {
        injected.interactors.createGameInteractor.selectManege(state: appBinding)
    }
    
    private func selectHall() {
        injected.interactors.createGameInteractor.selectHall(state: appBinding)
    }
}

private extension CreateGameStepThree {
    // MARK: Type Field
    private func selectParquet() {
        injected.interactors.createGameInteractor.selectParquet(state: appBinding)
    }
    
    private func selectGrass() {
        injected.interactors.createGameInteractor.selectGrass(state: appBinding)
    }
    
    private func selectCaoutchouc() {
        injected.interactors.createGameInteractor.selectCaoutchouc(state: appBinding)
    }
}

private extension CreateGameStepThree {
    // MARK: Coating Properties
    private func selectSynthetics() {
        injected.interactors.createGameInteractor.selectSynthetics(state: appBinding)
    }
    
    private func selectHair() {
        injected.interactors.createGameInteractor.selectHair(state: appBinding)
    }
    
    private func selectCrumb() {
        injected.interactors.createGameInteractor.selectCrumb(state: appBinding)
    }
}

struct CreateGameStepThree_Previews: PreviewProvider {
    static var previews: some View {
        CreateGameStepThree(appBinding: .constant(.init(
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

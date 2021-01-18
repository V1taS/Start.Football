//
//  CreateGameStepThree.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 07.01.2021.
//

import SwiftUI

struct CreateGameStepThree: View {
    
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
                        
                        HStack {
                            
                            TextButtonRound(name: "Улица",
                                            isOn: appBinding.street,
                                            disabledButton: false)
                            
                            TextButtonRound(name: "Манеж",
                                            isOn: appBinding.manege,
                                            disabledButton: false)
                            
                            TextButtonRound(name: "Зал",
                                            isOn: appBinding.hall,
                                            disabledButton: false)
                            
                        }
                    }
                    
                    Group {
                        Text("Тип покрытия")
                            .foregroundColor(.defaultColor)
                            .font(Font.event.robotoRegular14)
                        
                        HStack {
                            
                            TextButtonRound(name: "Паркет",
                                            isOn: appBinding.parquet,
                                            disabledButton: false)
                            
                            TextButtonRound(name: "Газон",
                                            isOn: appBinding.grass,
                                            disabledButton: false)

                            TextButtonRound(name: "Резина",
                                            isOn: appBinding.caoutchouc,
                                            disabledButton: false)
                        }
                    }
                    
                    Group {
                        HStack {
                            TextButtonRound(name: "Синтетика",
                                            isOn: appBinding.synthetics,
                                            disabledButton: false)
                            
                            TextButtonRound(name: "Ворс",
                                            isOn: appBinding.hair,
                                            disabledButton: false)
                            
                            TextButtonRound(name: "Крошка",
                                            isOn: appBinding.crumb,
                                            disabledButton: false)
                        }
                    }
                    
                    Group {
                        Text("Инфраструктура")
                            .foregroundColor(.defaultColor)
                            .font(Font.event.robotoRegular14)
                        
                        HStack {
                            TextButtonRound(name: "Раздевалки",
                                            isOn: appBinding.dressingRooms,
                                            disabledButton: false)
                            
                            TextButtonRound(name: "Душевые",
                                            isOn: appBinding.showers,
                                            disabledButton: false)
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
                    TextButtonRound(name: "Мини-футбол",
                                    isOn: appBinding.miniFootball,
                                    disabledButton: false)
                    
                    TextButtonRound(name: "Футбол",
                                    isOn: appBinding.football,
                                    disabledButton: false)

                    TextButtonRound(name: "Футзал",
                                    isOn: appBinding.footsal,
                                    disabledButton: false)
                }
            }
        )
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

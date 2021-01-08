//
//  CreateGameStepThree.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 07.01.2021.
//

import SwiftUI

struct CreateGameStepThree: View {
    
    @ObservedObject var viewModel = CreateGameStepThreeViewModel()
    
    var body: some View {
        ZStack {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading, spacing: viewModel.height * Size.shared.getAdaptSizeHeight(px: 16)) {
                    
                    Group {
                        Text("Тип игры")
                            .foregroundColor(.defaultColor)
                            .font(Font.event.robotoRegular14)
                        HStack {
                            TextButtonRound(name: "Мини-футбол",
                                            isOn: $viewModel.miniFootball,
                                            disabledButton: false)
                            
                            TextButtonRound(name: "Футбол",
                                            isOn: $viewModel.football,
                                            disabledButton: false)

                            TextButtonRound(name: "Футзал",
                                            isOn: $viewModel.footsal,
                                            disabledButton: false)
                        }
                    }
                    
                    FormatGameTextField(firstValue: $viewModel.firstValue,
                                        secondValue: $viewModel.secondValue)
                    
                    
                    BoxPrivacyCreateGame(privacyGame: $viewModel.privacyGame,
                                         maxCountTeams: $viewModel.maxCountTeams,
                                         maxCountPlayers: $viewModel.maxCountPlayers,
                                         maxReservePlayers: $viewModel.maxReservePlayers)
                    
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
                                            isOn: $viewModel.street,
                                            disabledButton: false)
                            
                            TextButtonRound(name: "Манеж",
                                            isOn: $viewModel.manege,
                                            disabledButton: false)
                            
                            TextButtonRound(name: "Зал",
                                            isOn: $viewModel.hall,
                                            disabledButton: false)
                            
                        }
                    }
                    
                    Group {
                        Text("Тип покрытия")
                            .foregroundColor(.defaultColor)
                            .font(Font.event.robotoRegular14)
                        
                        HStack {
                            
                            TextButtonRound(name: "Паркет",
                                            isOn: $viewModel.parquet,
                                            disabledButton: false)
                            
                            TextButtonRound(name: "Газон",
                                            isOn: $viewModel.grass,
                                            disabledButton: false)

                            TextButtonRound(name: "Резина",
                                            isOn: $viewModel.caoutchouc,
                                            disabledButton: false)
                        }
                    }
                    
                    Group {
                        HStack {
                            TextButtonRound(name: "Синтетика",
                                            isOn: $viewModel.synthetics,
                                            disabledButton: false)
                            
                            TextButtonRound(name: "Ворс",
                                            isOn: $viewModel.hair,
                                            disabledButton: false)
                            
                            TextButtonRound(name: "Крошка",
                                            isOn: $viewModel.crumb,
                                            disabledButton: false)
                        }
                    }
                    
                    Group {
                        Text("Инфраструктура")
                            .foregroundColor(.defaultColor)
                            .font(Font.event.robotoRegular14)
                        
                        HStack {
                            TextButtonRound(name: "Раздевалки",
                                            isOn: $viewModel.dressingRooms,
                                            disabledButton: false)
                            
                            TextButtonRound(name: "Душевые",
                                            isOn: $viewModel.showers,
                                            disabledButton: false)
                        }
                    }
                    ButtonParking(showParkingView: $viewModel.showParkingView)
                }
            }
            .padding(.horizontal, 24)
            .padding(.top, viewModel.height * Size.shared.getAdaptSizeHeight(px: 32))
            TypeOfParkingSheet(isSheetActive: $viewModel.showParkingView)
        }
        .dismissingKeyboard()
    }
}

struct CreateGameStepThree_Previews: PreviewProvider {
    static var previews: some View {
        CreateGameStepThree()
    }
}

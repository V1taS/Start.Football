//
//  CreateGameStepThree.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 07.01.2021.
//

import SwiftUI

struct CreateGameStepThree: View {
    let height = UIScreen.screenHeight
    let width = UIScreen.screenWidth
    @Binding var maxCountPlayers: Double
    @Binding var maxReservePlayers: Double
    @Binding var privacyGame: PrivacyGame
    @Binding var showParkingView: Bool
    @State var text = ""
    @State var viewState = CGSize.zero
    
    var body: some View {
        ZStack {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 0) {
                    VStack(alignment: .leading, spacing: height * Size.shared.getAdaptSizeHeight(px: 32)) {
                        
                        VStack(alignment: .leading, spacing: height * Size.shared.getAdaptSizeHeight(px: 0)) {
                            
                            VStack(alignment: .leading, spacing: height * Size.shared.getAdaptSizeHeight(px: 16)) {
                                
                                Text("Тип игры")
                                    .foregroundColor(.defaultColor)
                                    .font(Font.event.robotoRegular14)
                                
                                HStack {
                                    TextButtonRound(name: "Мини-футбол",
                                                    foregroundColor: .secondaryColor,
                                                    backgroundColor: .whiteColor,
                                                    boarderColor: .secondaryColor,
                                                    disabledButton: false)
                                    
                                    TextButtonRound(name: "Футбол",
                                                    foregroundColor: .whiteColor,
                                                    backgroundColor: .primaryColor,
                                                    boarderColor: .primaryColor,
                                                    disabledButton: false)
                                    
                                    TextButtonRound(name: "Футзал",
                                                    foregroundColor: .secondaryColor,
                                                    backgroundColor: .whiteColor,
                                                    boarderColor: .secondaryColor,
                                                    disabledButton: false)
                                }

                                
                            }
                            .padding(.top, height * Size.shared.getAdaptSizeHeight(px: 32))
                            
                            
                            VStack(alignment: .leading, spacing: 0) {
                                Text("Формат игры")
                                    .foregroundColor(.defaultColor)
                                    .font(Font.event.robotoMedium14)
                                    .padding(.bottom, UIScreen.screenHeight * Size.shared.getAdaptSizeHeight(px: 18))
                                
                                HStack {
                                    Spacer()
                                    HStack(spacing: 0) {
                                        
                                        TextField("10", text: $text)
                                            .foregroundColor(.secondaryColor)
                                            .font(Font.event.robotoRegular24)
                                            .keyboardType(.numberPad)
                                            .frame(width: width * Size.shared.getAdaptSizeWidth(px: 30))
                                    }
                                    Spacer()
                                    Text("—")
                                        .foregroundColor(.secondaryColor)
                                        .font(Font.event.robotoRegular24)
                                    Spacer()
                                    HStack {
                                        TextField("10", text: $text)
                                            .foregroundColor(.secondaryColor)
                                            .font(Font.event.robotoRegular24)
                                            .keyboardType(.numberPad)
                                            .frame(width: width * Size.shared.getAdaptSizeWidth(px: 30))
                                        
                                    }
                                    Spacer()
                                    
                                } .padding(.bottom, UIScreen.screenHeight * Size.shared.getAdaptSizeHeight(px: 11))
                                
                                Color( #colorLiteral(red: 0.9137254902, green: 0.9137254902, blue: 0.9254901961, alpha: 1))
                                    .frame(width: width * Size.shared.getAdaptSizeWidth(px: 327),
                                           height: height * Size.shared.getAdaptSizeHeight(px: 2))
                            }
                            .padding(.top, height * Size.shared.getAdaptSizeHeight(px: 16))
                            
                            
                            BoxPrivacyCreateGame(privacyGame: $privacyGame,
                                                 maxCountPlayers: $maxCountPlayers,
                                                 maxReservePlayers: $maxReservePlayers)
                                .padding(.top, height * Size.shared.getAdaptSizeHeight(px: 16))
                        }
                        
                        Divider()
                        
                        Text("Дополнительная информация")
                            .foregroundColor(.secondaryColor)
                            .font(Font.event.robotoMedium20)
                        
                        VStack(alignment: .leading, spacing: height * Size.shared.getAdaptSizeHeight(px: 16)) {
                            
                            Text("Где играть")
                                .foregroundColor(.defaultColor)
                                .font(Font.event.robotoRegular14)
                            
                            HStack {
                                Text("Улица")
                                    .foregroundColor(.secondaryColor)
                                    .font(Font.event.robotoRegular16)
                                    .roundedEdge(backgroundColor: .whiteColor,
                                                 boarderColor: .secondaryColor)
                                
                                
                                Text("Манеж")
                                    .foregroundColor(.whiteColor)
                                    .font(Font.event.robotoRegular16)
                                    .roundedEdge(backgroundColor: .primaryColor,
                                                 boarderColor: .primaryColor)
                                
                                
                                Text("Зал")
                                    .foregroundColor(.secondaryColor)
                                    .font(Font.event.robotoRegular16)
                                    .roundedEdge(backgroundColor: .whiteColor,
                                                 boarderColor: .secondaryColor)
                                
                                Spacer()
                            }
                            
                        }
                        
                        VStack(alignment: .leading, spacing: height * Size.shared.getAdaptSizeHeight(px: 16)) {
                            
                            Text("Тип покрытия")
                                .foregroundColor(.defaultColor)
                                .font(Font.event.robotoRegular14)
                            
                            VStack(alignment: .leading, spacing: height * Size.shared.getAdaptSizeHeight(px: 12)) {
                                HStack {
                                    Text("Паркет")
                                        .foregroundColor(.secondaryColor)
                                        .font(Font.event.robotoRegular16)
                                        .roundedEdge(backgroundColor: .whiteColor,
                                                     boarderColor: .secondaryColor)
                                    
                                    Text("Газон")
                                        .foregroundColor(.whiteColor)
                                        .font(Font.event.robotoRegular16)
                                        .roundedEdge(backgroundColor: .primaryColor,
                                                     boarderColor: .primaryColor)
                                    
                                    
                                    Text("Резина")
                                        .foregroundColor(.secondaryColor)
                                        .font(Font.event.robotoRegular16)
                                        .roundedEdge(backgroundColor: .whiteColor,
                                                     boarderColor: .secondaryColor)
                                    Spacer()
                                }
                                
                                HStack {
                                    Text("Синтетика")
                                        .foregroundColor(.secondaryColor)
                                        .font(Font.event.robotoRegular16)
                                        .roundedEdge(backgroundColor: .whiteColor,
                                                     boarderColor: .secondaryColor)
                                    
                                    Text("Ворс")
                                        .foregroundColor(.secondaryColor)
                                        .font(Font.event.robotoRegular16)
                                        .roundedEdge(backgroundColor: .whiteColor,
                                                     boarderColor: .secondaryColor)
                                    
                                    
                                    Text("Крошка")
                                        .foregroundColor(.secondaryColor)
                                        .font(Font.event.robotoRegular16)
                                        .roundedEdge(backgroundColor: .whiteColor,
                                                     boarderColor: .secondaryColor)
                                    Spacer()
                                }
                            }
                        }
                        
                        
                        VStack(alignment: .leading, spacing: height * Size.shared.getAdaptSizeHeight(px: 16)) {
                            
                            Text("Инфраструктура")
                                .foregroundColor(.defaultColor)
                                .font(Font.event.robotoRegular14)
                            
                            HStack {
                                Text("Раздевалки")
                                    .foregroundColor(.whiteColor)
                                    .font(Font.event.robotoRegular16)
                                    .roundedEdge(backgroundColor: .primaryColor,
                                                 boarderColor: .primaryColor)
                                
                                
                                Text("Душевые")
                                    .foregroundColor(.whiteColor)
                                    .font(Font.event.robotoRegular16)
                                    .roundedEdge(backgroundColor: .primaryColor,
                                                 boarderColor: .primaryColor)
                                
                                Spacer()
                            }
                        }
                        
                        
                        Button(action: { showParkingView.toggle() } ) {
                            VStack(alignment: .leading, spacing: height * Size.shared.getAdaptSizeHeight(px: 0)) {
                                
                                Text("Парковка")
                                    .foregroundColor(.defaultColor)
                                    .font(Font.event.robotoRegular14)
                                
                                HStack {
                                    Text("Выберите тип")
                                        .foregroundColor(.defaultColor)
                                        .font(Font.event.robotoRegular18)
                                    
                                    Spacer()
                                    Image("right")
                                }
                                .padding(.top, height * Size.shared.getAdaptSizeHeight(px: 16))
                                
                                Divider()
                                    .padding(.top, height * Size.shared.getAdaptSizeHeight(px: 8))
                            }
                        }
                    }
                }
            }
            .padding(.horizontal, 24)
            TypeOfParkingSheet(isSheetActive: $showParkingView)
        }
        .dismissingKeyboard()
    }
}

struct CreateGameStepThree_Previews: PreviewProvider {
    static var previews: some View {
        CreateGameStepThree(maxCountPlayers: .constant(10),
                            maxReservePlayers: .constant(20),
                            privacyGame: .constant(.open),
                            showParkingView: .constant(false))
    }
}

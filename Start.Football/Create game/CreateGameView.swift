//
//  CreateGameView.swift
//  Start.Football
//
//  Created by Виталий Сосин on 09.12.2020.
//

import SwiftUI

struct CreateGameView: View {
    
    let height = UIScreen.screenHeight
    let width = UIScreen.screenWidth
    
    @ObservedObject var viewModel = CreateGameViewModel()
    
    var body: some View {
        VStack(spacing: 0) {
            HeaderCreateGameView(selectionCreateGame: $viewModel.selectionCreateGame)
            
            Group {
                if viewModel.selectionCreateGame == .stepOne {
                    BoxTextfieldCreateGameView()
                }
                
                else if viewModel.selectionCreateGame == .stepTwo {
                    BoxSelectionRegularGame(selectionRegularGame: $viewModel.selectionRegularGame)
                }
                
                else if viewModel.selectionCreateGame == .stepThree {
                    BoxSettingsCreateGame(
                        maxCountPlayers: $viewModel.maxCountPlayers,
                        maxReservePlayers: $viewModel.maxReservePlayers,
                        privacyGame: $viewModel.privacyGame)
                }
                else if viewModel.selectionCreateGame == .stepFour {
                    
                }
                
                else if viewModel.selectionCreateGame == .stepFive {
                    Plug(text: "Step - 5", createGame: false)
                }
                
                else if viewModel.selectionCreateGame == .stepSix {
                    Plug(text: "Step - 6", createGame: false)
                }
            }
            
            Spacer()
            ButtonNextStepGameView(selectionCreateGame: $viewModel.selectionCreateGame)
            
        }
    }
}

struct CreateGameView_Previews: PreviewProvider {
    static var previews: some View {
        CreateGameView()
    }
}

struct HeaderCreateGameView: View {
    let height = UIScreen.screenHeight
    let width = UIScreen.screenWidth
    @Binding var selectionCreateGame: SelectionCreateGame
    
    var body: some View {
        HStack(alignment: .firstTextBaseline, spacing: 0) {
            BackButtonCreateGameView(selectionCreateGame: $selectionCreateGame)
            Spacer()
            VStack(alignment: .center, spacing: 0) {
                Text("Создание игры")
                    .foregroundColor(.secondaryColor)
                    .font(Font.event.robotoMedium20)
                
                Color(.processCreateGameColor)
                    .frame(width: width * Size.shared.getAdaptSizeWidth(px: 160),
                           height: height * Size.shared.getAdaptSizeHeight(px: 5),
                           alignment: .center)
                    .cornerRadius(5)
                    .padding(.top, height * Size.shared.getAdaptSizeHeight(px: 16))
            }
            Spacer()
        }
        .padding(.horizontal, width * Size.shared.getAdaptSizeWidth(px: 24))
        .padding(.top, height * Size.shared.getAdaptSizeHeight(px: 13))
    }
}

struct TextfieldCreateGameView: View {
    
    let height = UIScreen.screenHeight
    let width = UIScreen.screenWidth
    
    @Binding var text: String
    let title: String
    let icon: String
    let iconShow: Bool
    let placeholder: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(title)
                .foregroundColor(.defaultColor)
                .font(Font.event.robotoRegular14)
                .padding(.bottom, height * Size.shared.getAdaptSizeHeight(px: 16))
            
            HStack {
                TextField(placeholder, text: $text)
                    .foregroundColor(.secondaryColor)
                    .font(Font.event.robotoRegular18)
                    .keyboardType(.default)
                if iconShow {
                    Image(icon)
                }
            } .padding(.bottom, height * Size.shared.getAdaptSizeHeight(px: 8))
            
            Color(.dividerColor)
                .frame(width: width * Size.shared.getAdaptSizeWidth(px: 327),
                       height: height * Size.shared.getAdaptSizeHeight(px: 2))
        }
        .padding(.horizontal, width * Size.shared.getAdaptSizeWidth(px: 24))
    }
}

struct BoxTextfieldCreateGameView: View {
    
    let height = UIScreen.screenHeight
    let width = UIScreen.screenWidth
    
    var body: some View {
        VStack(spacing: 0) {
            VStack(spacing: height * Size.shared.getAdaptSizeHeight(px: 32)) {
                
                TextfieldCreateGameView(text: .constant(""),
                                        title: "Название",
                                        icon: "",
                                        iconShow: false,
                                        placeholder: "Введите название")
                
                TextfieldCreateGameView(text: .constant(""),
                                        title: "Адрес",
                                        icon: "locationCreateGame",
                                        iconShow: true,
                                        placeholder: "Укажите адрес")
                
                TextfieldCreateGameView(text: .constant(""),
                                        title: "Время",
                                        icon: "timeGreateGame",
                                        iconShow: true,
                                        placeholder: "Укажите время")
                
                TextfieldCreateGameView(text: .constant(""),
                                        title: "Дата игры",
                                        icon: "dateCreateGame",
                                        iconShow: true,
                                        placeholder: "Укажите дату начала")
                
                TextfieldCreateGameView(text: .constant(""),
                                        title: "Стоимость участия одного игрока",
                                        icon: "rublsCreateGame",
                                        iconShow: true,
                                        placeholder: "Укажите стоимость")
            }
            
            HStack {
                Text("0 ₽ — игра бесплатная")
                    .foregroundColor(.defaultColor)
                    .font(Font.event.robotoRegular14)
                    .padding(.horizontal, width * Size.shared.getAdaptSizeWidth(px: 24))
                    .padding(.top, height * Size.shared.getAdaptSizeHeight(px: 8))
                Spacer()
            }
            
        }
        .padding(.top, height * Size.shared.getAdaptSizeHeight(px: 32))
    }
}

struct ButtonNextStepGameView: View {
    
    @Binding var selectionCreateGame: SelectionCreateGame
    
    let height = UIScreen.screenHeight
    let width = UIScreen.screenWidth
    
    var body: some View {
        Button(action: {
            switch selectionCreateGame {
            case .stepOne:
                selectionCreateGame = .stepTwo
            case .stepTwo:
                selectionCreateGame = .stepThree
            case .stepThree:
                selectionCreateGame = .stepFour
            case .stepFour:
                selectionCreateGame = .stepFive
            case .stepFive:
                selectionCreateGame = .stepSix
            case .stepSix:
                print("") // сохраняем
            }
            print("\(selectionCreateGame)")
        }) {
            ButtonView(background: .primaryColor,
                       textColor: .whiteColor,
                       borderColor: .primaryColor,
                       text: selectionCreateGame == .stepSix ? "Создать игру" : "Следующий шаг")
        }.padding(.bottom, height * Size.shared.getAdaptSizeHeight(px: 17))
    }
}

struct ButtonYesCreateGameView: View {
    
    let height = UIScreen.screenHeight
    let width = UIScreen.screenWidth
    
    var body: some View {
        Color(.primaryColor)
            .frame(width: width * Size.shared.getAdaptSizeWidth(px: 10),
                   height: height * Size.shared.getAdaptSizeHeight(px: 10))
            .cornerRadius(5)
            .padding(5)
            .overlay(RoundedRectangle(cornerRadius: 9)
                        .stroke(Color(.primaryColor), lineWidth: 3))
    }
}

struct ButtonNoCreateGameView: View {
    
    let height = UIScreen.screenHeight
    let width = UIScreen.screenWidth
    
    var body: some View {
        Circle()
            .stroke(Color.defaultColor, lineWidth: 3)
            .frame(width: width * Size.shared.getAdaptSizeWidth(px: 18),
                   height: height * Size.shared.getAdaptSizeHeight(px: 18))
    }
}

struct BoxButtonCreateGameView: View {
    
    @Binding var selectionRegularGame: SelectionRegularGame
    let height = UIScreen.screenHeight
    let width = UIScreen.screenWidth
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Это регулярная игра?")
                .foregroundColor(.defaultColor)
                .font(Font.event.robotoRegular18)
                .padding(.horizontal, width * Size.shared.getAdaptSizeWidth(px: 24))
                .padding(.bottom, height * Size.shared.getAdaptSizeHeight(px: 16))
            
            VStack(spacing: 24) {
                HStack(spacing: 8) {
                    if selectionRegularGame == .yes {
                        Button(action: { selectionRegularGame = .yes }) {
                            ButtonYesCreateGameView()
                        }
                    } else {
                        Button(action: { selectionRegularGame = .yes }) {
                            ButtonNoCreateGameView()
                        }
                    }
                    
                    Text("Разово. Для проведения одной игры.")
                        .foregroundColor(.defaultColor)
                        .font(Font.event.robotoRegular16)
                    Spacer()
                }
                
                HStack(spacing: 8) {
                    
                    if selectionRegularGame == .no {
                        Button(action: { selectionRegularGame = .no }) {
                            ButtonYesCreateGameView()
                        }
                    } else {
                        Button(action: { selectionRegularGame = .no }) {
                            ButtonNoCreateGameView()
                        }
                    }
                    
                    Text("Регулярно. Проводится постоянной основе")
                        .foregroundColor(.defaultColor)
                        .font(Font.event.robotoRegular16)
                    Spacer()
                }
            }
            .padding(.horizontal, width * Size.shared.getAdaptSizeWidth(px: 24))
            
            if selectionRegularGame == .no {
                VStack {
                    BoxDateCreateGameView()
                        .padding(.top, height * Size.shared.getAdaptSizeHeight(px: 24))
                        .padding(.horizontal, width * Size.shared.getAdaptSizeWidth(px: 24))
                    
                    Button(action: {}) {
                        ButtonView(background: .whiteColor,
                                   textColor: .primaryColor,
                                   borderColor: .primaryColor,
                                   text: "Добавить другой день или время")
                            .padding(.top, height * Size.shared.getAdaptSizeHeight(px: 32))
                    }
                }
            }
        }
    }
}

struct BoxDateCreateGameView: View {
    var body: some View {
        HStack {
            Group {
                DayOfWeeakCurrentGame(background: .primaryColor, textColor: .whiteColor, day: "Пн")
                Spacer()
                DayOfWeeakCurrentGame(background: .primaryColor, textColor: .whiteColor, day: "Вт")
                Spacer()
                DayOfWeeakCurrentGame(background: .whiteColor, textColor: .secondaryColor, day: "Ср")
                Spacer()
            }
            Group {
                DayOfWeeakCurrentGame(background: .primaryColor, textColor: .whiteColor, day: "Чт")
                Spacer()
                DayOfWeeakCurrentGame(background: .whiteColor, textColor: .secondaryColor, day: "Пт")
                Spacer()
                DayOfWeeakCurrentGame(background: .primaryColor, textColor: .whiteColor, day: "Сб")
                Spacer()
                DayOfWeeakCurrentGame(background: .primaryColor, textColor: .whiteColor, day: "Вс")
            }
        }
    }
}

struct BackButtonCreateGameView: View {
    
    let height = UIScreen.screenHeight
    let width = UIScreen.screenWidth
    @Binding var selectionCreateGame: SelectionCreateGame
    
    var body: some View {
        Button(action: {
            switch selectionCreateGame {
            case .stepOne:
                return
            case .stepTwo:
                selectionCreateGame = .stepOne
            case .stepThree:
                selectionCreateGame = .stepTwo
            case .stepFour:
                selectionCreateGame = .stepThree
            case .stepFive:
                selectionCreateGame = .stepFour
            case .stepSix:
                selectionCreateGame = .stepFive
            }
        }) {
            Image("backCreateGame").opacity(selectionCreateGame == .stepOne ? 0 : 1)
                .offset(y: height * Size.shared.getAdaptSizeHeight(px: 6))
        }
    }
}

struct BoxSelectionRegularGame: View {
    let height = UIScreen.screenHeight
    let width = UIScreen.screenWidth
    @Binding var selectionRegularGame: SelectionRegularGame
    
    var body: some View {
        VStack(spacing: 0) {
            VStack(alignment: .leading, spacing: height * Size.shared.getAdaptSizeHeight(px: 16)) {
                
                BoxButtonCreateGameView(selectionRegularGame: $selectionRegularGame)
            }
        }
        .padding(.top, height * Size.shared.getAdaptSizeHeight(px: 32))
    }
}

struct BoxSettingsCreateGame: View {
    let height = UIScreen.screenHeight
    let width = UIScreen.screenWidth
    @Binding var maxCountPlayers: Double
    @Binding var maxReservePlayers: Double
    @Binding var privacyGame: PrivacyGame
    
    var body: some View {
        VStack(spacing: 0) {
            VStack(alignment: .leading, spacing: height * Size.shared.getAdaptSizeHeight(px: 32)) {
                
                VStack(alignment: .leading, spacing: height * Size.shared.getAdaptSizeHeight(px: 16)) {
                    
                    Text("Тип игры")
                        .foregroundColor(.defaultColor)
                        .font(Font.event.robotoRegular14)
                    
                    BoxPrivacyCreateGame(privacyGame: $privacyGame,
                                         maxCountPlayers: $maxCountPlayers,
                                         maxReservePlayers: $maxReservePlayers)
                    
                    HStack {
                        Text("Мини-футбол")
                            .foregroundColor(.secondaryColor)
                            .font(Font.event.robotoRegular16)
                            .roundedEdge(backgroundColor: .whiteColor,
                                         boarderColor: .secondaryColor)
                        
                        
                        
                        Spacer()
                        
                        Text("Футбол")
                            .foregroundColor(.whiteColor)
                            .font(Font.event.robotoRegular16)
                            .roundedEdge(backgroundColor: .primaryColor,
                                         boarderColor: .primaryColor)
                        
                        Spacer()
                        
                        Text("Футзал")
                            .foregroundColor(.secondaryColor)
                            .font(Font.event.robotoRegular16)
                            .roundedEdge(backgroundColor: .whiteColor,
                                         boarderColor: .secondaryColor)
                    }
                }
                .padding(.horizontal, width * Size.shared.getAdaptSizeWidth(px: 24))
                
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
                .padding(.horizontal, width * Size.shared.getAdaptSizeWidth(px: 24))
                
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
                .padding(.horizontal, width * Size.shared.getAdaptSizeWidth(px: 24))
                
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
                .padding(.horizontal, width * Size.shared.getAdaptSizeWidth(px: 24))
                
                VStack(alignment: .leading, spacing: height * Size.shared.getAdaptSizeHeight(px: 16)) {
                    
                    TextfieldCreateGameView(text: .constant(""),
                                            title: "Парковка",
                                            icon: "right",
                                            iconShow: true,
                                            placeholder: "Выберите тип")
                }
            }
            
            
        }
        .padding(.top, height * Size.shared.getAdaptSizeHeight(px: 32))
    }
}

struct BoxPrivacyCreateGame: View {
    
    let height = UIScreen.screenHeight
    let width = UIScreen.screenWidth
    @Binding var privacyGame: PrivacyGame
    @Binding var maxCountPlayers: Double
    @Binding var maxReservePlayers: Double
    
    var body: some View {
        VStack(spacing: 0) {
            VStack(alignment: .leading, spacing: height * Size.shared.getAdaptSizeHeight(px: 16)) {
                Text("Приватность")
                    .foregroundColor(.defaultColor)
                    .font(Font.event.robotoRegular14)
                
                VStack(spacing: 16) {
                    HStack(spacing: 16) {
                        if privacyGame == .open {
                            Button(action: { privacyGame = .open }) {
                                ButtonYesCreateGameView()
                            }
                        } else {
                            Button(action: { privacyGame = .open }) {
                                ButtonNoCreateGameView()
                            }
                        }
                        
                        Text("Открытая игра. Записаться на эту игру сможет любой желающий.")
                            .foregroundColor(.secondaryColor)
                            .font(Font.event.robotoMedium16)
                        Spacer()
                    }
                    
                    HStack(spacing: 8) {
                        
                        if privacyGame == .close {
                            Button(action: { privacyGame = .close }) {
                                ButtonYesCreateGameView()
                            }
                        } else {
                            Button(action: { privacyGame = .close }) {
                                ButtonNoCreateGameView()
                            }
                        }
                        
                        Text("Закрытая игра. На эту игру можно попасть только по приглашению администратора.")
                            .foregroundColor(.secondaryColor)
                            .font(Font.event.robotoMedium16)
                        Spacer()
                    }
                }
                
                Divider()
                    .padding(.top, height * Size.shared.getAdaptSizeHeight(px: 32))
                
                VStack(alignment: .leading, spacing: height * Size.shared.getAdaptSizeHeight(px: 26)) {
                    Text("Максимальное количество игроков в основе")
                        .foregroundColor(.defaultColor)
                        .font(Font.event.robotoRegular14)
                    
                    HStack {
                        Slider(value: $maxCountPlayers, in: 0...30, step: 1)
                        Spacer()
                        Text("\(String(format: "%.0f", maxCountPlayers))")
                            .foregroundColor(.secondaryColor)
                            .font(Font.event.robotoRegular24)
                            .frame(width: width * Size.shared.getAdaptSizeWidth(px: 32))
                    }
                    
                    Divider()
                    
                    Text("Максимальное количество игроков в резерве")
                        .foregroundColor(.defaultColor)
                        .font(Font.event.robotoRegular14)
                    
                    HStack {
                        Slider(value: $maxReservePlayers, in: 0...30, step: 1)
                        Spacer()
                        Text("\(String(format: "%.0f", maxReservePlayers))")
                            .foregroundColor(.secondaryColor)
                            .font(Font.event.robotoRegular24)
                            .frame(width: width * Size.shared.getAdaptSizeWidth(px: 32))
                    }
                }
                
            }
            .padding(.horizontal, width * Size.shared.getAdaptSizeWidth(px: 24))
        }
        .padding(.top, height * Size.shared.getAdaptSizeHeight(px: 32))
    }
}

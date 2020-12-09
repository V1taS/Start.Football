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
            
            if viewModel.selectionCreateGame == .stepOne {
                BoxTextfieldCreateGameView()
            }
            
            else if viewModel.selectionCreateGame == .stepTwo {
                VStack(spacing: 0) {
                    VStack(alignment: .leading, spacing: height * Size.shared.getAdaptSizeHeight(px: 16)) {
                        
                        BoxButtonCreateGameView(selectionRegularGame: $viewModel.selectionRegularGame)
                        BoxDateCreateGameView()
                    }
                    .padding(.horizontal, width * Size.shared.getAdaptSizeWidth(px: 24))
                    
                    ButtonOtherDateCreateGameView()
                }
                .padding(.top, height * Size.shared.getAdaptSizeHeight(px: 32))
            }
            
            else if viewModel.selectionCreateGame == .stepThree {
                Plug(text: "Step - 3", createGame: false)
            }
            
            else if viewModel.selectionCreateGame == .stepFour {
                Plug(text: "Step - 4", createGame: false)
            }
            
            else if viewModel.selectionCreateGame == .stepFive {
                Plug(text: "Step - 5", createGame: false)
            }
            
            else if viewModel.selectionCreateGame == .stepSix {
                Plug(text: "Step - 6", createGame: false)
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
                .padding(.bottom, height * Size.shared.getAdaptSizeHeight(px: 16))
            
            HStack(spacing: 39) {
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
                    
                    Text("Да")
                        .foregroundColor(selectionRegularGame == .yes ? .primaryColor : .defaultColor)
                        .font(Font.event.robotoRegular16)
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
                    
                    Text("Нет")
                        .foregroundColor(selectionRegularGame == .yes ? .defaultColor : .primaryColor)
                        .font(Font.event.robotoRegular16)
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

struct ButtonOtherDateCreateGameView: View {
    let height = UIScreen.screenHeight
    let width = UIScreen.screenWidth
    
    var body: some View {
        Button(action: {}) {
            ButtonView(background: .whiteColor,
                       textColor: .primaryColor,
                       borderColor: .primaryColor,
                       text: "Добавить другой день или время")
                .padding(.top, height * Size.shared.getAdaptSizeHeight(px: 32))
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

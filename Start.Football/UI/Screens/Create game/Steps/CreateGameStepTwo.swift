//
//  CreateGameStepTwo.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 07.01.2021.
//

import SwiftUI

struct CreateGameStepTwo: View {
    
    private var appBinding: Binding<AppState.AppData.CreateGame>
    init(appBinding: Binding<AppState.AppData.CreateGame>) {
        self.appBinding = appBinding
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading, spacing: 16) {
                Text("Это регулярная игра?")
                    .foregroundColor(.defaultColor)
                    .font(Font.event.robotoRegular18)
                
                selectionRegularGame
                regularGame
                Spacer()
            }
            .padding(.horizontal, 24)
        }
        .padding(.top, 16)
    }
}

// MARK: UI
private extension CreateGameStepTwo {
    var selectionRegularGame: some View {
        VStack(spacing: 24) {
            HStack(spacing: 8) {
                Button(action: { appBinding.selectionRegularGame.wrappedValue = .no }) {
                    ButtonRoundGreen(status: appBinding.selectionRegularGame.wrappedValue == .no)
                        .frame(width: 20)
                }
                
                Text("Разово. Для проведения одной игры.")
                    .foregroundColor(.defaultColor)
                    .font(Font.event.robotoRegular16)
                Spacer()
            }
            HStack(spacing: 8) {
                
                Button(action: { appBinding.selectionRegularGame.wrappedValue = .yes }) {
                    ButtonRoundGreen(status: appBinding.selectionRegularGame.wrappedValue == .yes)
                        .frame(width: 20)
                }
                
                Text("Регулярно. Проводится постоянной основе")
                    .foregroundColor(.defaultColor)
                    .font(Font.event.robotoRegular16)
                Spacer()
            }
        }
    }
}

private extension CreateGameStepTwo {
    var regularGame: some View {
        VStack(alignment: .leading, spacing: 0) {
            if appBinding.selectionRegularGame.wrappedValue == .yes {
                
                Color(.dividerColor)
                    .frame(width: UIScreen.screenWidth * Size.shared.getAdaptSizeWidth(px: 327),
                           height: UIScreen.screenHeight * Size.shared.getAdaptSizeHeight(px: 2))
                
                
                ForEach(0..<appBinding.countOfGames.wrappedValue, id: \.self) { index in
                    
                    HStack {
                        Text("Игра номер - \(index + 1)")
                            .foregroundColor(Color.secondaryColor)
                            .font(Font.event.robotoRegular18)
                        
                        Spacer()
                    }
                    
                    BoxDateButton(disabledButton: false,
                                  mo: appBinding.listGame[index][0],
                                  tu: appBinding.listGame[index][1],
                                  we: appBinding.listGame[index][2],
                                  th: appBinding.listGame[index][3],
                                  fr: appBinding.listGame[index][4],
                                  sa: appBinding.listGame[index][5],
                                  su: appBinding.listGame[index][6])
                                                         
                    DatePickerLineView(date: appBinding.anyDate[index],
                                       text: "Укажите время:",
                                       header: "Время",
                                       iconShow: true,
                                       icon: "timeGreateGame",
                                       textHasBeenChanged: appBinding.anyTimeHasBeenChanged,
                                       hourAndMinute: .hourAndMinute)
                }
                .padding(.top)
                
                Button(action: {
                    if appBinding.countOfGames.wrappedValue <= 6 {
                        appBinding.countOfGames.wrappedValue += 1
                    }
                    
                }) {
                    ButtonView(background: .whiteColor,
                               textColor: .primaryColor,
                               borderColor: .primaryColor,
                               text: "Добавить другой день или время",
                               switchImage: false,
                               image: "")
                }
                
                Button(action: {
                    if appBinding.countOfGames.wrappedValue > 0 {
                        appBinding.countOfGames.wrappedValue -= 1
                    }
                    
                }) {
                    ButtonView(background: .whiteColor,
                               textColor: .error,
                               borderColor: .error,
                               text: "Удалить день",
                               switchImage: false,
                               image: "")
                }
            }
        }
    }
}

// MARK: Actions
private extension CreateGameStepTwo {
    private func presentTime() {
        //        appBinding.showTimePicker.wrappedValue.toggle()
    }
}

struct CreateGameStepTwo_Previews: PreviewProvider {
    static var previews: some View {
        CreateGameStepTwo(appBinding: .constant(.init()))
    }
}

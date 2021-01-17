//
//  CreateGameStepTwo.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 07.01.2021.
//

import SwiftUI

struct CreateGameStepTwo: View {
    let height = UIScreen.screenHeight
    let width = UIScreen.screenWidth
    
    var appBinding: Binding<AppState.AppData.CreateGame>
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading,
                   spacing: height * Size.shared.getAdaptSizeHeight(px: 16)) {
                Text("Это регулярная игра?")
                    .foregroundColor(.defaultColor)
                    .font(Font.event.robotoRegular18)
                
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

                if appBinding.selectionRegularGame.wrappedValue == .yes {
                    VStack(alignment: .leading,
                           spacing: height * Size.shared.getAdaptSizeHeight(px: 24)) {
                        BoxDateButton(disabledButton: false,
                                      mo: appBinding.mo,
                                      tu: appBinding.tu,
                                      we: appBinding.we,
                                      th: appBinding.th,
                                      fr: appBinding.fr,
                                      sa: appBinding.sa,
                                      su: appBinding.su)

                        Button(action: { appBinding.showTimePicker.wrappedValue.toggle() }) {
                            NoTextfieldOneLineView(text: appBinding.time.wrappedValue,
                                                   header: "Время",
                                                   iconShow: true,
                                                   icon: "timeGreateGame",
                                                   textHasBeenChanged: appBinding.timeTextHasBeenChanged.wrappedValue)
                        }

                        Button(action: {}) {
                            ButtonView(background: .whiteColor,
                                       textColor: .primaryColor,
                                       borderColor: .primaryColor,
                                       text: "Добавить другой день или время")
                        }
                    }
                }
                Spacer()
            }
            .padding(.horizontal, 24)
    
            TimePickerSheet(isSheetActive: appBinding.showTimePicker,
                            currentDate: appBinding.currentDate)
                .offset(y: height * Size.shared.getAdaptSizeHeight(px: 170))
            
        }
        .padding(.top, height * Size.shared.getAdaptSizeHeight(px: 32))
    }
}

struct CreateGameStepTwo_Previews: PreviewProvider {
    static var previews: some View {
        CreateGameStepTwo(appBinding: .constant(.init(
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

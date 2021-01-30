//
//  CreateGameStepOne.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 07.01.2021.
//

import SwiftUI
import Combine

struct CreateGameStepOne: View {
    
    private var appBinding: Binding<AppState.AppData>
    init(appBinding: Binding<AppState.AppData>) {
        self.appBinding = appBinding
    }
    
    var body: some View {
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    VStack(spacing: 24) {
                        nameGame
                        addressGame
                        TFdateAndTimeCGView(appBinding: appBinding)
                        TFhowMuchTimeDoWePlayCGView(appBinding: appBinding)
    //                    time
//                        HowMuchDoWePlay
//                        day
                        costGame
                    }
                    freeGameText
                    Spacer()
                }
                .padding(.horizontal, 24)
                .padding(.top, 24)
            }
        .dismissingKeyboard()
    }
}


// MARK: UI
private extension CreateGameStepOne {
    var nameGame: some View {
        TextfieldOneLineView(text: appBinding.createGame.nameGame,
                             title: "Название",
                             icon: "",
                             iconShow: false,
                             placeholder: "Введите название",
                             keyboardType: .default,
                             success: appBinding.createGame.nameGameSuccess.wrappedValue)
    }
}

private extension CreateGameStepOne {
    var addressGame: some View {
        TextfieldOneLineView(text: appBinding.createGame.addressGame,
                             title: "Адрес",
                             icon: "locationCreateGame",
                             iconShow: true,
                             placeholder: "Укажите адрес",
                             keyboardType: .default,
                             success: appBinding.createGame.addressGameSuccess.wrappedValue)
    }
}

private extension CreateGameStepOne {
    var time: some View {
        DatePickerLineView(date: appBinding.createGame.currentDate,
                           textHasBeenChanged: appBinding.createGame.currentTimeHasBeenChanged, text: "Укажите время:",
                           header: "Время",
                           iconShow: true,
                           icon: "timeGreateGame",
                           hourAndMinute: .hourAndMinute)
    }
}

private extension CreateGameStepOne {
    var HowMuchDoWePlay: some View {
        DatePickerLineView(date: appBinding.createGame
                            .currentDate,
                           textHasBeenChanged: appBinding.createGame
                            .currentTimeHasBeenChanged,
                           text: "Укажите время:",
                           header: "Сколько играем?",
                           iconShow: true,
                           icon: "timeGreateGame",
                           hourAndMinute: .hourAndMinute)
    }
}

private extension CreateGameStepOne {
    var day: some View {
        DatePickerLineView(date: appBinding.createGame.currentDate,
                           textHasBeenChanged: appBinding.createGame.currentDateHasBeenChanged, text: "Укажите дату:",
                           header: "Дата игры",
                           iconShow: true,
                           icon: "dateCreateGame",
                           hourAndMinute: .date)
    }
}

private extension CreateGameStepOne {
    var costGame: some View {
        TextfieldOneLineView(text: appBinding.createGame.costGame,
                             title: "Стоимость участия одного игрока",
                             icon: "rublsCreateGame",
                             iconShow: true,
                             placeholder: "Укажите стоимость",
                             keyboardType: .numberPad,
                             success: appBinding.createGame.costGameSuccess.wrappedValue)
    }
}

private extension CreateGameStepOne {
    var freeGameText: some View {
        HStack {
            Text("0 ₽ — игра бесплатная")
                .foregroundColor(.defaultColor)
                .font(Font.event.robotoRegular14)
                .padding(.top, 2)
            Spacer()
        }
    }
}

struct CreateGameStepOne_Previews: PreviewProvider {
    static var previews: some View {
        CreateGameStepOne(appBinding: .constant(.init()))
    }
}

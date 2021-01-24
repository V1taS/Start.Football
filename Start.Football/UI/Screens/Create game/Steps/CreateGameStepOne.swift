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
        ZStack {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 32) {
                    nameGame
                    addressGame
                    time
                    day
                    costGame
                }
                freeGameText
                Spacer()
            }
            .padding(.horizontal, 24)
            .padding(.top, 10)
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
                             keyboardType: .default)
    }
}

private extension CreateGameStepOne {
    var addressGame: some View {
        TextfieldOneLineView(text: appBinding.createGame.addressGame,
                             title: "Адрес",
                             icon: "locationCreateGame",
                             iconShow: true,
                             placeholder: "Укажите адрес",
                             keyboardType: .default)
    }
}

private extension CreateGameStepOne {
    var time: some View {
        DatePickerLineView(date: appBinding.createGame.currentDate,
                               text: "Укажите время:",
                               header: "Время",
                               iconShow: true,
                               icon: "timeGreateGame",
                               textHasBeenChanged: appBinding.createGame.currentTimeHasBeenChanged,
                               hourAndMinute: .hourAndMinute)
    }
}

private extension CreateGameStepOne {
    var day: some View {
        DatePickerLineView(date: appBinding.createGame.currentDate,
                               text: "Укажите дату:",
                               header: "Дата игры",
                               iconShow: true,
                               icon: "dateCreateGame",
                               textHasBeenChanged: appBinding.createGame.currentDateHasBeenChanged,
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
                             keyboardType: .numberPad)
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

//
//  CreateGameStepOne.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 07.01.2021.
//

import SwiftUI
import Combine

struct CreateGameStepOne: View {
    
    private var appBinding: Binding<AppState.AppData.CreateGame>
    init(appBinding: Binding<AppState.AppData.CreateGame>) {
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
                    participationCost
                }
                freeGameText
                Spacer()
            }
            .padding(.horizontal, 24)
            .padding(.top, 32)
        }
        .dismissingKeyboard()
    }
}

// MARK: - Name game
private extension CreateGameStepOne {
    var nameGame: some View {
        TextfieldOneLineView(text: appBinding.nameGame,
                             title: "Название",
                             icon: "",
                             iconShow: false,
                             placeholder: "Введите название",
                             keyboardType: .default)
    }
}

// MARK: - Address Game
private extension CreateGameStepOne {
    var addressGame: some View {
        TextfieldOneLineView(text: appBinding.addressGame,
                             title: "Адрес",
                             icon: "locationCreateGame",
                             iconShow: true,
                             placeholder: "Укажите адрес",
                             keyboardType: .default)
    }
}


// MARK: - Time
private extension CreateGameStepOne {
    var time: some View {
        Button(action: {
            appBinding.showTimePicker.wrappedValue.toggle()
            
        }) {
            NoTextfieldOneLineView(text: appBinding.oneTime.wrappedValue,
                                   header: "Время",
                                   iconShow: true,
                                   icon: "timeGreateGame",
                                   textHasBeenChanged: appBinding.oneTimeTextHasBeenChanged.wrappedValue)
        }
    }
}

// MARK: - Day
private extension CreateGameStepOne {
    var day: some View {
        Button(action: { appBinding.showDatePicker.wrappedValue.toggle() }) {
            NoTextfieldOneLineView(text: appBinding.oneDay.wrappedValue,
                                   header: "Дата игры",
                                   iconShow: true,
                                   icon: "dateCreateGame",
                                   textHasBeenChanged: appBinding.oneDayTextHasBeenChanged.wrappedValue)
        }
    }
}

// MARK: - Participation cost
private extension CreateGameStepOne {
    var participationCost: some View {
        TextfieldOneLineView(text: appBinding.participationCost,
                             title: "Стоимость участия одного игрока",
                             icon: "rublsCreateGame",
                             iconShow: true,
                             placeholder: "Укажите стоимость",
                             keyboardType: .numberPad)
    }
}

// MARK: - Free game text
private extension CreateGameStepOne {
    var freeGameText: some View {
        HStack {
            Text("0 ₽ — игра бесплатная")
                .foregroundColor(.defaultColor)
                .font(Font.event.robotoRegular14)
                .padding(.top, 8)
            Spacer()
        }
    }
}

struct CreateGameStepOne_Previews: PreviewProvider {
    static var previews: some View {
        CreateGameStepOne(appBinding: .constant(.init()))
    }
}

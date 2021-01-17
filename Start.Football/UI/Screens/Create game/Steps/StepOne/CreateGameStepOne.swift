//
//  CreateGameStepOne.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 07.01.2021.
//

import SwiftUI
import Combine

struct CreateGameStepOne: View {
    
    var appBinding: Binding<AppState.AppData.CreateGame>
    
    let height = UIScreen.screenHeight
    let width = UIScreen.screenWidth
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                VStack(spacing: height * Size.shared.getAdaptSizeHeight(px: 32)) {
                    
                    TextfieldOneLineView(text: appBinding.nameGame,
                                         title: "Название",
                                         icon: "",
                                         iconShow: false,
                                         placeholder: "Введите название",
                                         keyboardType: .default)
                    
                    
                    TextfieldOneLineView(text: appBinding.addressGame,
                                         title: "Адрес",
                                         icon: "locationCreateGame",
                                         iconShow: true,
                                         placeholder: "Укажите адрес",
                                         keyboardType: .default)
                    
                    Button(action: { appBinding.showTimePicker.wrappedValue.toggle() }) {
                        NoTextfieldOneLineView(text: appBinding.oneTime.wrappedValue,
                                               header: "Время",
                                               iconShow: true,
                                               icon: "timeGreateGame",
                                               textHasBeenChanged: appBinding.oneTimeTextHasBeenChanged.wrappedValue)
                    }
                    
                    Button(action: { appBinding.showDatePicker.wrappedValue.toggle() }) {
                        NoTextfieldOneLineView(text: appBinding.oneDay.wrappedValue,
                                               header: "Дата игры",
                                               iconShow: true,
                                               icon: "dateCreateGame",
                                               textHasBeenChanged: appBinding.oneDayTextHasBeenChanged.wrappedValue)
                    }
                    
                    TextfieldOneLineView(text: appBinding.participationCost,
                                         title: "Стоимость участия одного игрока",
                                         icon: "rublsCreateGame",
                                         iconShow: true,
                                         placeholder: "Укажите стоимость",
                                         keyboardType: .numberPad)
                    
                }
                
                HStack {
                    Text("0 ₽ — игра бесплатная")
                        .foregroundColor(.defaultColor)
                        .font(Font.event.robotoRegular14)
                        .padding(.top, height * Size.shared.getAdaptSizeHeight(px: 8))
                    Spacer()
                }
                Spacer()
            }
            .padding(.horizontal, 24)
            .padding(.top, height * Size.shared.getAdaptSizeHeight(px: 32))

            TimePickerSheet(isSheetActive: appBinding.showTimePicker,
                            currentDate: appBinding.currentDate)
                .offset(y: height * Size.shared.getAdaptSizeHeight(px: 170))
            
            DatePickerSheet(isSheetActive: appBinding.showDatePicker,
                            currentDate: appBinding.currentDate)
                .offset(y: height * Size.shared.getAdaptSizeHeight(px: 170))
            
        } .dismissingKeyboard()
    }
}


struct CreateGameStepOne_Previews: PreviewProvider {
    static var previews: some View {
        CreateGameStepOne(appBinding: .constant(.init(
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

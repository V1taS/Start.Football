//
//  CreateGameStepOne.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 07.01.2021.
//

import SwiftUI

struct CreateGameStepOne: View {
    let height = UIScreen.screenHeight
    let width = UIScreen.screenWidth
 
    @Binding var nameGame: String
    @Binding var addressGame: String
    @Binding var participationCost: String
    
    @Binding var currentDate: Date
    @Binding var showTimePicker: Bool
    @Binding var showDatePicker: Bool
    @Binding var oneTime: String
    @Binding var oneTimeTextHasBeenChanged: Bool
    @Binding var oneDay: String
    @Binding var oneDayTextHasBeenChanged: Bool
    
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                VStack(spacing: height * Size.shared.getAdaptSizeHeight(px: 32)) {
                    
                    TextfieldOneLineView(text: $nameGame,
                                         title: "Название",
                                         icon: "",
                                         iconShow: false,
                                         placeholder: "Введите название",
                                         keyboardType: .default)
                    
                    TextfieldOneLineView(text: $addressGame,
                                         title: "Адрес",
                                         icon: "locationCreateGame",
                                         iconShow: true,
                                         placeholder: "Укажите адрес",
                                         keyboardType: .default)
                    
                    Button(action: { showTimePicker.toggle() }) {
                        NoTextfieldOneLineView(text: oneTime,
                                               header: "Время",
                                               iconShow: true,
                                               icon: "timeGreateGame",
                                               textHasBeenChanged: oneTimeTextHasBeenChanged)
                    }
                    
                    Button(action: { showDatePicker.toggle() }) {
                        NoTextfieldOneLineView(text: oneDay,
                                               header: "Дата игры",
                                               iconShow: true,
                                               icon: "dateCreateGame",
                                               textHasBeenChanged: oneDayTextHasBeenChanged)
                    }
                    
                    TextfieldOneLineView(text: $participationCost,
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

            TimePickerSheet(isSheetActive: $showTimePicker,
                            currentDate: $currentDate)
                .offset(y: height * Size.shared.getAdaptSizeHeight(px: 170))
            
            DatePickerSheet(isSheetActive: $showDatePicker,
                            currentDate: $currentDate)
                .offset(y: height * Size.shared.getAdaptSizeHeight(px: 170))
            
        } .dismissingKeyboard()
        
    }
}


struct CreateGameStepOne_Previews: PreviewProvider {
    static var previews: some View {
        CreateGameStepOne(nameGame: .constant(""),
                          addressGame: .constant(""),
                          participationCost: .constant(""),
                          currentDate: .constant(Date(timeIntervalSince1970: TimeInterval(12))),
                          showTimePicker: .constant(false),
                          showDatePicker: .constant(false),
                          oneTime: .constant("12:30"),
                          oneTimeTextHasBeenChanged: .constant(false),
                          oneDay: .constant("12.01.2021"),
                          oneDayTextHasBeenChanged: .constant(false))
    }
}

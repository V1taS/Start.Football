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
    
    @ObservedObject var viewModel = CreateGameStepOneViewModel()
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                VStack(spacing: height * Size.shared.getAdaptSizeHeight(px: 32)) {
                    
                    TextfieldOneLineView(text: .constant(""),
                                         title: "Название",
                                         icon: "",
                                         iconShow: false,
                                         placeholder: "Введите название",
                                         keyboardType: .default)
                    
                    TextfieldOneLineView(text: .constant(""),
                                         title: "Адрес",
                                         icon: "locationCreateGame",
                                         iconShow: true,
                                         placeholder: "Укажите адрес",
                                         keyboardType: .default)
                    
                    Button(action: { viewModel.showTimePicker.toggle() }) {
                        NoTextfieldOneLineView(text: viewModel.time,
                                               header: "Время",
                                               iconShow: true,
                                               icon: "timeGreateGame",
                                               textHasBeenChanged: viewModel.timeTextHasBeenChanged)
                    }
                    
                    Button(action: { viewModel.showDatePicker.toggle() }) {
                        NoTextfieldOneLineView(text: viewModel.date,
                                               header: "Дата игры",
                                               iconShow: true,
                                               icon: "dateCreateGame",
                                               textHasBeenChanged: viewModel.dateTextHasBeenChanged)
                    }
                    
                    TextfieldOneLineView(text: .constant(""),
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

            TimePickerSheet(isSheetActive: $viewModel.showTimePicker,
                            currentDate: $viewModel.currentDate)
                .offset(y: height * Size.shared.getAdaptSizeHeight(px: 170))
            
            DatePickerSheet(isSheetActive: $viewModel.showDatePicker,
                            currentDate: $viewModel.currentDate)
                .offset(y: height * Size.shared.getAdaptSizeHeight(px: 170))
            
        } .dismissingKeyboard()
        
    }
}


struct CreateGameStepOne_Previews: PreviewProvider {
    static var previews: some View {
        CreateGameStepOne()
    }
}

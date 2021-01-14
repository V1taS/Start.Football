//
//  CreateGameStepOne.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 07.01.2021.
//

import SwiftUI
import Combine

struct CreateGameStepOne: View {
    
    @State private var routingState: AppState.AppData.CreateGame = .init()
    private var routingBinding: Binding<AppState.AppData.CreateGame> {
        $routingState.dispatched(to: injected.appState, \.appData.createGame)
    }
    @Environment(\.injected) private var injected: DIContainer
    
    let height = UIScreen.screenHeight
    let width = UIScreen.screenWidth
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                VStack(spacing: height * Size.shared.getAdaptSizeHeight(px: 32)) {
                    
                    TextfieldOneLineView(text: $routingState.nameGame,
                                         title: "Название",
                                         icon: "",
                                         iconShow: false,
                                         placeholder: "Введите название",
                                         keyboardType: .default)
                    
                    
                    TextfieldOneLineView(text: $routingState.addressGame,
                                         title: "Адрес",
                                         icon: "locationCreateGame",
                                         iconShow: true,
                                         placeholder: "Укажите адрес",
                                         keyboardType: .default)
                    
                    Button(action: { routingState.showTimePicker.toggle() }) {
                        NoTextfieldOneLineView(text: routingState.oneTime,
                                               header: "Время",
                                               iconShow: true,
                                               icon: "timeGreateGame",
                                               textHasBeenChanged: routingState.oneTimeTextHasBeenChanged)
                    }
                    
                    Button(action: { routingState.showDatePicker.toggle() }) {
                        NoTextfieldOneLineView(text: routingState.oneDay,
                                               header: "Дата игры",
                                               iconShow: true,
                                               icon: "dateCreateGame",
                                               textHasBeenChanged: routingState.oneDayTextHasBeenChanged)
                    }
                    
                    TextfieldOneLineView(text: $routingState.participationCost,
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

            TimePickerSheet(isSheetActive: $routingState.showTimePicker,
                            currentDate: $routingState.currentDate)
                .offset(y: height * Size.shared.getAdaptSizeHeight(px: 170))
            
            DatePickerSheet(isSheetActive: $routingState.showDatePicker,
                            currentDate: $routingState.currentDate)
                .offset(y: height * Size.shared.getAdaptSizeHeight(px: 170))
            
        } .dismissingKeyboard()
        
    }
}


struct CreateGameStepOne_Previews: PreviewProvider {
    static var previews: some View {
        CreateGameStepOne()
    }
}

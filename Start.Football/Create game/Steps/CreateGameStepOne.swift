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
    
    var body: some View {
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
                
                TextfieldOneLineView(text: .constant(""),
                                     title: "Время",
                                     icon: "timeGreateGame",
                                     iconShow: true,
                                     placeholder: "Укажите время",
                                     keyboardType: .default)
                
                TextfieldOneLineView(text: .constant(""),
                                     title: "Дата игры",
                                     icon: "dateCreateGame",
                                     iconShow: true,
                                     placeholder: "Укажите дату начала",
                                     keyboardType: .default)
                
                TextfieldOneLineView(text: .constant(""),
                                     title: "Стоимость участия одного игрока",
                                     icon: "rublsCreateGame",
                                     iconShow: true,
                                     placeholder: "Укажите стоимость",
                                     keyboardType: .default)
                
            }
            
            HStack {
                Text("0 ₽ — игра бесплатная")
                    .foregroundColor(.defaultColor)
                    .font(Font.event.robotoRegular14)
                    .padding(.horizontal, width * Size.shared.getAdaptSizeWidth(px: 24))
                    .padding(.top, height * Size.shared.getAdaptSizeHeight(px: 8))
                Spacer()
            }
            
        }  .dismissingKeyboard()
        .padding(.top, height * Size.shared.getAdaptSizeHeight(px: 32))
    }
}


struct CreateGameStepOne_Previews: PreviewProvider {
    static var previews: some View {
        CreateGameStepOne()
    }
}

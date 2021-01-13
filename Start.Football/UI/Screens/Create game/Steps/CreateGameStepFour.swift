//
//  CreateGameStepFour.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 07.01.2021.
//

import SwiftUI

struct CreateGameStepFour: View {
    let height = UIScreen.screenHeight
    let width = UIScreen.screenWidth
    
    var body: some View {
        VStack(spacing: 0) {
            VStack(spacing: height * Size.shared.getAdaptSizeHeight(px: 32)) {
                
                TextfieldOneLineView(text: .constant(""),
                                     title: "Описание площадки",
                                     icon: "",
                                     iconShow: false,
                                     placeholder: "Расскажите о площадке",
                                     keyboardType: .default)
                
                TextfieldOneLineView(text: .constant(""),
                                     title: "Свои правила",
                                     icon: "",
                                     iconShow: false,
                                     placeholder: "К примеру: играем без подкатов",
                                     keyboardType: .default)
                
                TextfieldOneLineView(text: .constant(""),
                                     title: "Комментарий от организатора",
                                     icon: "",
                                     iconShow: false,
                                     placeholder: "Напишите комментарий",
                                     keyboardType: .default)
                
                ButtonView(background: .tertiary,
                           textColor: .whiteColor,
                           borderColor: .tertiary,
                           text: "Добавить фото площадки")
            }
        }
        .padding(.horizontal, 24)
        .padding(.top, height * Size.shared.getAdaptSizeHeight(px: 32))
    }
}

struct CreateGameStepFour_Previews: PreviewProvider {
    static var previews: some View {
        CreateGameStepFour()
    }
}

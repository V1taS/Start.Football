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
        ScrollView {
            VStack {
                VStack(spacing: 24) {
                    nameGame
                    addressGame
                    TFdateAndTimeCGView(appBinding: appBinding)
                    TFhowMuchTimeDoWePlayCGView(appBinding: appBinding)
                    costGame
                }
                freeGameText
                Spacer()
            }
            
            .padding(.horizontal, 24)
            .padding(.top, 24)
        }
        .dismissingKeyboard()
        .keyboardAware()
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
                             success: appBinding.createGame.nameGameSuccess.wrappedValue,
                             textAlignment: .left,
                             limitLength: 20)
        
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
                             success: appBinding.createGame.addressGameSuccess.wrappedValue,
                             textAlignment: .left,
                             limitLength: 30)
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
                             success: appBinding.createGame.costGameSuccess.wrappedValue,
                             textAlignment: .left,
                             limitLength: 4)
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

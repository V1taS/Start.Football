//
//  isEmtyMyGame.swift
//  Start.Football
//
//  Created by Виталий Сосин on 30.11.2020.
//

import SwiftUI

struct isEmtyMyGame: View {
    
    init(appBinding: Binding<AppState.AppData>,
         text: String,
         createGame: Bool) {
        self.appBinding = appBinding
        self.text = text
        self.buttonIsEnable = createGame
    }
    
    private var appBinding: Binding<AppState.AppData>
    private let text: String
    private let buttonIsEnable: Bool
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                rectangle
                
                VStack(spacing: 16) {
                    textView
                    textButton
                    Spacer()
                }
                .padding(.top, 24)
            }
            .padding(16)
        }
    }
}


// MARK: UI
private extension isEmtyMyGame {
    private var rectangle: AnyView {
        AnyView(
            Color(.secondaryColor)
                .clipShape(RoundedRectangle(cornerRadius: 5))
                .frame(width: UIScreen.screenWidth * Size.shared.getAdaptSizeWidth(px: 343),
                       height: UIScreen.screenHeight * Size.shared.getAdaptSizeHeight(px: 214))
        )
    }
}

private extension isEmtyMyGame {
    private var textView: AnyView {
        AnyView(
            Text(text)
                .foregroundColor(.secondaryColor)
                .font(Font.event.robotoBold20)
        )
    }
}

private extension isEmtyMyGame {
    private var textButton: AnyView {
        AnyView(
            VStack(spacing: 0) {
                if buttonIsEnable {
                    Button(action: {
                        appBinding.main.selectedItem.wrappedValue = 1
                    }) {
                        Text("Создай игру!")
                            .foregroundColor(.primaryColor)
                            .font(Font.event.robotoMedium16)
                    }
                }
            }
        )
    }
}

struct Plug_Previews: PreviewProvider {
    static var previews: some View {
        isEmtyMyGame(appBinding: .constant(.init()), text: "", createGame: false)
    }
}

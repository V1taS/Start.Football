//
//  Plug.swift
//  Start.Football
//
//  Created by Виталий Сосин on 30.11.2020.
//

import SwiftUI

struct Plug: View {
    let height = UIScreen.screenHeight
    let width = UIScreen.screenWidth
    
    private var appBinding: Binding<AppState.AppData>
    init(appBinding: Binding<AppState.AppData>,
         text: String,
         createGame: Bool) {
        self.appBinding = appBinding
        self.text = text
        self.createGame = createGame
    }
    
    private let text: String
    private let createGame: Bool
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                Color(.secondaryColor)
                    .clipShape(RoundedRectangle(cornerRadius: 5))
                    .frame(width: width * Size.shared.getAdaptSizeWidth(px: 343),
                           height: height * Size.shared.getAdaptSizeHeight(px: 214))
                
                VStack(spacing: height * Size.shared.getAdaptSizeHeight(px: 16)) {
                    Text(text)
                        .foregroundColor(.secondaryColor)
                        .font(Font.event.robotoBold20)
                    
                    if createGame {
                        Button(action: {
                            appBinding.main.tag.wrappedValue = 1
                        }) {
                            Text("Создай игру!")
                                .foregroundColor(.primaryColor)
                                .font(Font.event.robotoMedium16)
                        }
                    }
                    Spacer()
                }
                .padding(.top, UIScreen.screenHeight * Size.shared.getAdaptSizeHeight(px: 24))
            }
            .padding(.horizontal, width * Size.shared.getAdaptSizeWidth(px: 16))
            .padding(.vertical, height * Size.shared.getAdaptSizeHeight(px: 16))
        }
    }
}

struct Plug_Previews: PreviewProvider {
    static var previews: some View {
        Plug(appBinding: .constant(.init()), text: "", createGame: true)
    }
}

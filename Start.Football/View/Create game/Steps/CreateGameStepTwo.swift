//
//  CreateGameStepTwo.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 07.01.2021.
//

import SwiftUI

struct CreateGameStepTwo: View {
    @Binding var selectionRegularGame: SelectionRegularGame
    let height = UIScreen.screenHeight
    let width = UIScreen.screenWidth
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Это регулярная игра?")
                .foregroundColor(.defaultColor)
                .font(Font.event.robotoRegular18)
                .padding(.bottom, height * Size.shared.getAdaptSizeHeight(px: 16))
            
            VStack(spacing: 24) {
                HStack(spacing: 8) {
                    if selectionRegularGame == .yes {
                        Button(action: { selectionRegularGame = .yes }) {
                            ButtonRoundGreen(status: selectionRegularGame == .yes)
                                .frame(width: 20)
                        }
                    } else {
                        Button(action: { selectionRegularGame = .yes }) {
                            ButtonRoundGreen(status: selectionRegularGame == .yes)
                                .frame(width: 20)
                        }
                    }
                    
                    Text("Разово. Для проведения одной игры.")
                        .foregroundColor(.defaultColor)
                        .font(Font.event.robotoRegular16)
                    Spacer()
                }
                
                HStack(spacing: 8) {
                    
                    if selectionRegularGame == .no {
                        Button(action: { selectionRegularGame = .no }) {
                            ButtonRoundGreen(status: selectionRegularGame == .no)
                                .frame(width: 20)
                        }
                    } else {
                        Button(action: { selectionRegularGame = .no }) {
                            ButtonRoundGreen(status: selectionRegularGame == .no)
                                .frame(width: 20)
                        }
                    }
                    
                    Text("Регулярно. Проводится постоянной основе")
                        .foregroundColor(.defaultColor)
                        .font(Font.event.robotoRegular16)
                    Spacer()
                }
            }
            
            if selectionRegularGame == .no {
                VStack {
                    BoxDateButton(disabledButton: false)
                        .padding(.top, height * Size.shared.getAdaptSizeHeight(px: 24))
                    
                    Button(action: {}) {
                        ButtonView(background: .whiteColor,
                                   textColor: .primaryColor,
                                   borderColor: .primaryColor,
                                   text: "Добавить другой день или время")
                            .padding(.top, height * Size.shared.getAdaptSizeHeight(px: 32))
                    }
                }
            }
        }
        .padding(.horizontal, 24)
        .padding(.top, height * Size.shared.getAdaptSizeHeight(px: 32))
    }
}

struct CreateGameStepTwo_Previews: PreviewProvider {
    static var previews: some View {
        CreateGameStepTwo(selectionRegularGame: .constant(.no))
    }
}

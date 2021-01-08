//
//  CreateGameStepTwo.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 07.01.2021.
//

import SwiftUI

struct CreateGameStepTwo: View {
    let height = UIScreen.screenHeight
    let width = UIScreen.screenWidth
    
    @ObservedObject var viewModel = CreateGameStepTwoViewModel()
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading,
                   spacing: height * Size.shared.getAdaptSizeHeight(px: 16)) {
                Text("Это регулярная игра?")
                    .foregroundColor(.defaultColor)
                    .font(Font.event.robotoRegular18)
                
                VStack(spacing: 24) {
                    HStack(spacing: 8) {
                        
                        Button(action: { viewModel.selectionRegularGame = .no }) {
                            ButtonRoundGreen(status: viewModel.selectionRegularGame == .no)
                                .frame(width: 20)
                        }
                        
                        Text("Разово. Для проведения одной игры.")
                            .foregroundColor(.defaultColor)
                            .font(Font.event.robotoRegular16)
                        Spacer()
                    }
                    
                    HStack(spacing: 8) {
                        
                        Button(action: { viewModel.selectionRegularGame = .yes }) {
                            ButtonRoundGreen(status: viewModel.selectionRegularGame == .yes)
                                .frame(width: 20)
                        }
                        
                        
                        Text("Регулярно. Проводится постоянной основе")
                            .foregroundColor(.defaultColor)
                            .font(Font.event.robotoRegular16)
                        Spacer()
                    }
                }
                
                if viewModel.selectionRegularGame == .yes {
                    VStack(alignment: .leading,
                           spacing: height * Size.shared.getAdaptSizeHeight(px: 24)) {
                        BoxDateButton(disabledButton: false,
                                      mo: $viewModel.mo,
                                      tu: $viewModel.tu,
                                      we: $viewModel.we,
                                      th: $viewModel.th,
                                      fr: $viewModel.fr,
                                      sa: $viewModel.sa,
                                      su: $viewModel.su)

                        Button(action: { viewModel.showTimePicker.toggle() }) {
                            NoTextfieldOneLineView(text: "Укажите время",
                                                   header: "Время",
                                                   iconShow: true,
                                                   icon: "timeGreateGame")
                        }
                        
                        Button(action: {}) {
                            ButtonView(background: .whiteColor,
                                       textColor: .primaryColor,
                                       borderColor: .primaryColor,
                                       text: "Добавить другой день или время")
                        }
                    }
                }
                Spacer()
            }
            .padding(.horizontal, 24)
    
            TimePickerSheet(isSheetActive: $viewModel.showTimePicker)
                .offset(y: height * Size.shared.getAdaptSizeHeight(px: 170))
            
        }
        .padding(.top, height * Size.shared.getAdaptSizeHeight(px: 32))
    }
}

struct CreateGameStepTwo_Previews: PreviewProvider {
    static var previews: some View {
        CreateGameStepTwo()
    }
}

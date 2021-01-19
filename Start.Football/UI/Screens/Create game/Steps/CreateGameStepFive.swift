//
//  CreateGameStepFive.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 07.01.2021.
//

import SwiftUI

struct CreateGameStepFive: View {
    let height = UIScreen.screenHeight
    let width = UIScreen.screenWidth
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                VStack(alignment: .leading, spacing: height * Size.shared.getAdaptSizeHeight(px: 2)) {
                    
                    Text("Все готово!")
                        .foregroundColor(.secondaryColor)
                        .font(Font.event.robotoMedium32)
                    
                    Text("Осталось пригласить друзей!")
                        .foregroundColor(.defaultColor)
                        .font(Font.event.robotoRegular18)
                }
                Spacer()
            }
            
            Button(action: {}) {
                ButtonView(background: .tertiary,
                           textColor: .whiteColor,
                           borderColor: .tertiary,
                           text: "Пригласить друзей",
                           switchImage: true,
                           image: "CGperson")
            }
            .padding(.top, height * Size.shared.getAdaptSizeHeight(px: 24))
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading, spacing: 16) {
                    Button(action: {}) {
                        CellWithPlayerButton(image: "player1CG",
                                             name: "Виталий Сосин",
                                             typePlayers: "Защитник, полузащитник, нападающий")
                    }
                    
                    Divider()
                    
                    Button(action: {}) {
                        CellWithPlayerButton(image: "player2CG",
                                             name: "Роман Соколов",
                                             typePlayers: "Вратарь, полузащитник, нападающий")
                    }
                    
                    Divider()
                    
                    Button(action: {}) {
                        CellWithPlayerButton(image: "player3CG",
                                             name: "Владимир Трифонов",
                                             typePlayers: "Защитник, полузащитник, нападающий")
                    }
                    
                    Divider()
                    
                    Button(action: {}) {
                        CellWithPlayerButton(image: "player4CG",
                                             name: "Дмитрий Трифонов",
                                             typePlayers: "Нападающий, полузащитник")
                    }
                    
                    Divider()
                    
                    Button(action: {}) {
                        CellWithPlayerButton(image: "player5CG",
                                             name: "Илья Гордеев",
                                             typePlayers: "Защитник, полузащитник")
                    }
                }
                .padding(.top, height * Size.shared.getAdaptSizeHeight(px: 32))
            }
            Spacer()
        }
        .padding(.horizontal, 24)
        .padding(.top, height * Size.shared.getAdaptSizeHeight(px: 32))
    }
}

struct CreateGameStepFive_Previews: PreviewProvider {
    static var previews: some View {
        CreateGameStepFive()
    }
}

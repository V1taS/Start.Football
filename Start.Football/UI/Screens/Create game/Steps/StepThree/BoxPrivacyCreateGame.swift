//
//  BoxPrivacyCreateGame.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 07.01.2021.
//

import SwiftUI

struct BoxPrivacyCreateGame: View {
    let height = UIScreen.screenHeight
    let width = UIScreen.screenWidth
    @Binding var privacyGame: AppActions.CreateGame.PrivacyGame
    
    var body: some View {
        VStack(spacing: 0) {
            VStack(alignment: .leading, spacing: height * Size.shared.getAdaptSizeHeight(px: 0)) {
                Text("Приватность")
                    .foregroundColor(.defaultColor)
                    .font(Font.event.robotoRegular14)
                    .padding(.top, height * Size.shared.getAdaptSizeHeight(px: 16))
                
                VStack(spacing: 16) {
                    HStack(spacing: 16) {
                        if privacyGame == .open {
                            Button(action: { privacyGame = .open }) {
                                ButtonRoundGreen(status: privacyGame == .open)
                                    .frame(width: 30)
                            }
                        } else {
                            Button(action: { privacyGame = .open }) {
                                ButtonRoundGreen(status: privacyGame == .open)
                                    .frame(width: 30)
                            }
                        }
                        
                        Text("Открытая игра. Записаться на эту игру сможет любой желающий.")
                            .foregroundColor(.secondaryColor)
                            .font(Font.event.robotoMedium16)
                            .offset(x: -10)
                        Spacer()
                    }
                    
                    HStack(spacing: 8) {
                        
                        if privacyGame == .close {
                            Button(action: { privacyGame = .close }) {
                                ButtonRoundGreen(status: privacyGame == .close)
                                    .frame(width: 30)
                            }
                        } else {
                            Button(action: { privacyGame = .close }) {
                                ButtonRoundGreen(status: privacyGame == .close)
                                    .frame(width: 30)
                            }
                        }
                        
                        Text("Закрытая игра. На эту игру можно попасть только по приглашению администратора.")
                            .foregroundColor(.secondaryColor)
                            .font(Font.event.robotoMedium16)
                        Spacer()
                    }
                }
                .padding(.top, height * Size.shared.getAdaptSizeHeight(px: 16))
                
            }
        }
    }
}

struct BoxPrivacyCreateGame_Previews: PreviewProvider {
    static var previews: some View {
        BoxPrivacyCreateGame(privacyGame: .constant(.open))
    }
}

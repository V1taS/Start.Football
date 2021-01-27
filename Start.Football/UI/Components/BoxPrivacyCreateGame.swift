//
//  BoxPrivacyCreateGame.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 07.01.2021.
//

import SwiftUI

struct BoxPrivacyCreateGame: View {
    
    @Binding var privacyGame: AppActions.CreatGameActions.PrivacyGame
    
    var body: some View {
        VStack(spacing: 0) {
            VStack(alignment: .leading, spacing: 0) {
                header
                
                VStack(spacing: 16) {
                    firstValue
                    secondValue
                }
                .padding(.top, 16)
            }
        }
    }
}

// MARK: UI
private extension BoxPrivacyCreateGame {
    private var header: AnyView {
        AnyView(
            Text("Приватность")
                .foregroundColor(.defaultColor)
                .font(Font.event.robotoRegular14)
                .padding(.top, 16)
        )
    }
}

private extension BoxPrivacyCreateGame {
    private var firstValue: AnyView {
        AnyView(
            VStack(spacing: 0) {
                if privacyGame == .open {
                    Button(action: { privacyGame = .open }) {
                        HStack(spacing: 16) {
                            ButtonRoundGreen(status: privacyGame == .open)
                                .frame(width: 30)
                            Text("Открытая игра. Записаться на эту игру сможет любой желающий.")
                                .foregroundColor(.secondaryColor)
                                .font(Font.event.robotoMedium16)
                                .offset(x: -10)
                            Spacer()
                        }
                    }
                } else {
                    Button(action: { privacyGame = .open }) {
                        HStack(spacing: 16) {
                            ButtonRoundGreen(status: privacyGame == .open)
                                .frame(width: 30)
                            Text("Открытая игра. Записаться на эту игру сможет любой желающий.")
                                .foregroundColor(.secondaryColor)
                                .font(Font.event.robotoMedium16)
                                .offset(x: -10)
                            Spacer()
                        }
                        
                    }
                }
            } .animation(.default)
        )
    }
}

private extension BoxPrivacyCreateGame {
    private var secondValue: AnyView {
        AnyView(
            VStack(spacing: 0) {
                if privacyGame == .close {
                    Button(action: { privacyGame = .close }) {
                        HStack(spacing: 8) {
                            ButtonRoundGreen(status: privacyGame == .close)
                                .frame(width: 30)
                            Text("Закрытая игра. На эту игру можно попасть только по приглашению администратора.")
                                .foregroundColor(.secondaryColor)
                                .font(Font.event.robotoMedium16)
                            Spacer()
                        }
                    }
                } else {
                    Button(action: { privacyGame = .close }) {
                        HStack(spacing: 8) {
                            ButtonRoundGreen(status: privacyGame == .close)
                                .frame(width: 30)
                            Text("Закрытая игра. На эту игру можно попасть только по приглашению администратора.")
                                .foregroundColor(.secondaryColor)
                                .font(Font.event.robotoMedium16)
                            Spacer()
                        }
                    }
                }
            } .animation(.default)
        )
    }
}

struct BoxPrivacyCreateGame_Previews: PreviewProvider {
    static var previews: some View {
        BoxPrivacyCreateGame(privacyGame: .constant(.open))
    }
}

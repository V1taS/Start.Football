//
//  CreateGameStepFive.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 07.01.2021.
//

import SwiftUI

struct CreateGameStepFive: View {
    
    private var appBinding: Binding<AppState.AppData>
    init(appBinding: Binding<AppState.AppData>) {
        self.appBinding = appBinding
    }
    
    var body: some View {
        VStack {
            VStack(spacing: 0) {
                header
                inviteFriendsButton
                listFriends
                Spacer()
            }
            .padding(.horizontal, 24)
            .padding(.top, 16)
            .dismissingKeyboard()
            
        }
    }
}


// MARK: UI
private extension CreateGameStepFive {
    private var header: AnyView {
        AnyView(
            HStack {
                VStack(alignment: .leading, spacing: 2) {
                    
                    Text("Все готово!")
                        .foregroundColor(.secondaryColor)
                        .font(Font.event.robotoMedium32)
                    
                    Text("Осталось пригласить друзей!")
                        .foregroundColor(.defaultColor)
                        .font(Font.event.robotoRegular18)
                }
                Spacer()
            }
        )
    }
}

private extension CreateGameStepFive {
    private var inviteFriendsButton: AnyView {
        AnyView(
            Button(action: {
                inviteFriends()
            }) {
                ButtonView(background: .tertiary,
                           textColor: .whiteColor,
                           borderColor: .tertiary,
                           text: "Пригласить друзей",
                           switchImage: true,
                           image: "CGperson")
            }
            .padding(.top, 24)
        )
    }
}

private extension CreateGameStepFive {
    private var listFriends: AnyView {
        AnyView(
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading, spacing: 16) {
                    
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
                .padding(.top, 32)
            }
        )
    }
}


// MARK: Actions
private extension CreateGameStepFive {
    private func inviteFriends() {
        
    }
}

struct CreateGameStepFive_Previews: PreviewProvider {
    static var previews: some View {
        CreateGameStepFive(appBinding: .constant(.init()))
    }
}

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
        VStack(spacing: 0) {
            header
            Spacer()
            Image("doneCG")
                .resizable()
                .frame(width: 182, height: 256)
            Spacer()
            inviteFriendsButton
                .padding(.bottom, 16)
        }
        .padding(.horizontal, 24)
        .padding(.top, 24)
        .dismissingKeyboard()
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
                           text: "Поделится событием",
                           switchImage: false,
                           image: "")
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

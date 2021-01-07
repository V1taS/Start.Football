//
//  RulesCurrentGame.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 07.01.2021.
//

import SwiftUI

struct RulesCurrentGame: View {
    let height = UIScreen.screenHeight
    let width = UIScreen.screenWidth
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: height * Size.shared.getAdaptSizeHeight(px: 16)) {
                Text("ПРАВИЛА")
                    .foregroundColor(.secondaryColor)
                    .font(Font.event.robotoMedium18)
                Text("Играем без подкатов. Любое попадание в руку считается нарушением. Вратарь не берет в руки от своих игроков.")
                    .foregroundColor(.secondaryColor)
                    .font(Font.event.robotoRegular16)
                    .frame(width: width * Size.shared.getAdaptSizeWidth(px: 330))
            }
            Spacer()
        }
        .padding(.vertical, height * Size.shared.getAdaptSizeHeight(px: 24))
    }
}

struct RulesCurrentGame_Previews: PreviewProvider {
    static var previews: some View {
        RulesCurrentGame()
    }
}

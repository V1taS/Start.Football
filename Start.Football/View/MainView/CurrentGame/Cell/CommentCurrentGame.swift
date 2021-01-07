//
//  CommentCurrentGame.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 07.01.2021.
//

import SwiftUI

struct CommentCurrentGame: View {
    let height = UIScreen.screenHeight
    let width = UIScreen.screenWidth
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: height * Size.shared.getAdaptSizeHeight(px: 16)) {
                Text("КОММЕНТАРИЙ")
                    .foregroundColor(.secondaryColor)
                    .font(Font.event.robotoMedium18)
                Text("Приходим за 10-15 минут. Игра начинается ровно в 21:30. Не задерживайте себя и других игроков!")
                    .foregroundColor(.secondaryColor)
                    .font(Font.event.robotoRegular16)
                    .frame(width: width * Size.shared.getAdaptSizeWidth(px: 330))
            }
            Spacer()
        }
        .padding(.top, height * Size.shared.getAdaptSizeHeight(px: 24))
    }
}

struct CommentCurrentGame_Previews: PreviewProvider {
    static var previews: some View {
        CommentCurrentGame()
    }
}

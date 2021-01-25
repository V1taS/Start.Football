//
//  CommentCurrentGame.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 07.01.2021.
//

import SwiftUI

struct CommentCurrentGame: View {
    
    private var appBinding: Binding<AppState.AppData>
    init(appBinding: Binding<AppState.AppData>) {
        self.appBinding = appBinding
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 16) {
                Text("КОММЕНТАРИЙ")
                    .foregroundColor(.secondaryColor)
                    .font(Font.event.robotoMedium18)
                Text("\(appBinding.currentGame.game.commentFromOrganizerGame.wrappedValue)")
                    .foregroundColor(.secondaryColor)
                    .font(Font.event.robotoRegular16)
                    .frame(width: UIScreen.screenWidth * Size.shared.getAdaptSizeWidth(px: 330))
            }
            Spacer()
        }
        .padding(.top, 24)
    }
}

struct CommentCurrentGame_Previews: PreviewProvider {
    static var previews: some View {
        CommentCurrentGame(appBinding: .constant(.init()))
    }
}

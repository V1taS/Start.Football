//
//  AboutMyselfProfileView.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 07.01.2021.
//

import SwiftUI

struct AboutMySelfProfileView: View {
    let height = UIScreen.screenHeight
    let width = UIScreen.screenWidth
    
    private let player: Player
    init(player: Player) {
        self.player = player
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading,
                   spacing: height * Size.shared.getAdaptSizeHeight(px: 16)) {
                Text("О СЕБЕ")
                    .foregroundColor(.secondaryColor)
                    .font(Font.event.robotoBold13)
                Text("\(player.aboutMe)")
                    .foregroundColor(.secondaryColor)
                    .font(Font.event.robotoRegular16)
                    .frame(width: width * Size.shared.getAdaptSizeWidth(px: 330))
            }
            Spacer()
        }
        .padding(.top, height * Size.shared.getAdaptSizeHeight(px: 42))
    }
}

struct AboutMyselfProfileView_Previews: PreviewProvider {
    static var previews: some View {
        AboutMySelfProfileView(player: .plugPlayer)
    }
}

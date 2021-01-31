//
//  ContactsProfileView.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 07.01.2021.
//

import SwiftUI

struct ContactsProfileView: View {
    let height = UIScreen.screenHeight
    let width = UIScreen.screenWidth
    
    private let player: Player
    init(player: Player) {
        self.player = player
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: height * Size.shared.getAdaptSizeHeight(px: 16)) {
                Text("КОНТАКТЫ")
                    .foregroundColor(.secondaryColor)
                    .font(Font.event.robotoBold13)
                HStack {
                    Circle()
                        .foregroundColor(.secondaryColor)
                        .frame(width: width * Size.shared.getAdaptSizeWidth(px: 16),
                               height: height * Size.shared.getAdaptSizeHeight(px: 16))
                    Text("\(player.phoneNumber)")
                        .foregroundColor(.secondaryColor)
                        .font(Font.event.robotoRegular16)
                }
                HStack {
                    Circle()
                        .foregroundColor(.secondaryColor)
                        .frame(width: width * Size.shared.getAdaptSizeWidth(px: 16),
                               height: height * Size.shared.getAdaptSizeHeight(px: 16))
                    Text("\(player.mail)")
                        .foregroundColor(.secondaryColor)
                        .font(Font.event.robotoRegular16)
                }
            }
            Spacer()
        }
        .padding(.vertical, height * Size.shared.getAdaptSizeHeight(px: 32))
    }
}

struct ContactsProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ContactsProfileView(player: .plugPlayer)
    }
}

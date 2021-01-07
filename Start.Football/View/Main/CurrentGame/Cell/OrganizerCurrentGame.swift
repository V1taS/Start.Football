//
//  OrganizerCurrentGame.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 07.01.2021.
//

import SwiftUI

struct OrganizerCurrentGame: View {
    let height = UIScreen.screenHeight
    let width = UIScreen.screenWidth
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: height * Size.shared.getAdaptSizeHeight(px: 16)) {
                Text("ОРГАНИЗАТОР")
                    .foregroundColor(.secondaryColor)
                    .font(Font.event.robotoMedium18)
                HStack {
                    Image("testOrganizator")
                        .resizable()
                        .frame(width: width * Size.shared.getAdaptSizeWidth(px: 32),
                               height: height * Size.shared.getAdaptSizeHeight(px: 32))
                    Text("Юрий Долговязов")
                        .foregroundColor(.secondaryColor)
                        .font(Font.event.robotoBold20)
                    Spacer()
                    Text(">")
                        .foregroundColor(.primaryColor)
                        .font(Font.event.robotoBold20)
                }
            }
            Spacer()
        }
        .padding(.horizontal, width * Size.shared.getAdaptSizeWidth(px: 16))
        .padding(.vertical, height * Size.shared.getAdaptSizeHeight(px: 24))
    }
}

struct OrganizerCurrentGame_Previews: PreviewProvider {
    static var previews: some View {
        OrganizerCurrentGame()
    }
}

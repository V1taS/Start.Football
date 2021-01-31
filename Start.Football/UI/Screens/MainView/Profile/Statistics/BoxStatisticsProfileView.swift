//
//  BoxStatisticsProfileView.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 07.01.2021.
//

import SwiftUI

struct BoxStatisticsProfileView: View {
    
    let height = UIScreen.screenHeight
    let width = UIScreen.screenWidth
    
    private let player: Player
    init(player: Player) {
        self.player = player
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: height * Size.shared.getAdaptSizeHeight(px: 16)) {
                Text("СТАТИСТИКА ИГР")
                    .foregroundColor(Color(#colorLiteral(red: 0.262745098, green: 0.2901960784, blue: 0.3960784314, alpha: 1)))
                    .font(Font.event.robotoBold13)
                
                HStack {
                    CellStatisticsProfileView(background: .primaryColor,
                                              textColor: .whiteColor,
                                              text: "Участвовал",
                                              count: "\(player.takePart)")
                    Spacer()
                    CellStatisticsProfileView(background: .secondaryColor,
                                              textColor: .whiteColor,
                                              text: "Организовал",
                                              count: "\(player.organized)")
                    
                }
            }
        }
        .padding(.top, height * Size.shared.getAdaptSizeHeight(px: 16))
    }
}

struct BoxStatisticsProfileView_Previews: PreviewProvider {
    static var previews: some View {
        BoxStatisticsProfileView(player: .plugPlayer)
    }
}

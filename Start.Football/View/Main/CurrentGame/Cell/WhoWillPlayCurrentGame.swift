//
//  WhoWillPlayCurrentGame.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 07.01.2021.
//

import SwiftUI

struct WhoWillPlayCurrentGame: View {
    let height = UIScreen.screenHeight
    let width = UIScreen.screenWidth
    
    var body: some View {
        VStack(alignment: .leading, spacing: height * Size.shared.getAdaptSizeHeight(px: 16)) {
            Text("КТО БУДЕТ")
                .foregroundColor(.secondaryColor)
                .font(Font.event.robotoMedium18)
            
            HStack {
                HStack(alignment: .center, spacing: -20) {
                    Image("p5")
                        .resizable()
                        .frame(width: width * Size.shared.getAdaptSizeWidth(px: 32),
                               height: height * Size.shared.getAdaptSizeHeight(px: 32))
                        .offset(x: width * Size.shared.getAdaptSizeWidth(px: 0))
                    Image("p4")
                        .resizable()
                        .frame(width: width * Size.shared.getAdaptSizeWidth(px: 32),
                               height: height * Size.shared.getAdaptSizeHeight(px: 32))
                        .offset(x: width * Size.shared.getAdaptSizeWidth(px: 0))
                    Image("p3")
                        .resizable()
                        .frame(width: width * Size.shared.getAdaptSizeWidth(px: 32),
                               height: height * Size.shared.getAdaptSizeHeight(px: 32))
                        .offset(x: width * Size.shared.getAdaptSizeWidth(px: 0))
                    Image("p2")
                        .resizable()
                        .frame(width: width * Size.shared.getAdaptSizeWidth(px: 32),
                               height: height * Size.shared.getAdaptSizeHeight(px: 32))
                        .offset(x: width * Size.shared.getAdaptSizeWidth(px: 0))
                    Image("p1")
                        .resizable()
                        .frame(width: width * Size.shared.getAdaptSizeWidth(px: 32),
                               height: height * Size.shared.getAdaptSizeHeight(px: 32))
                        .offset(x: width * Size.shared.getAdaptSizeWidth(px: 0))
                }
                Spacer()
                Text("Посмотреть всех")
                    .foregroundColor(.primaryColor)
                    .font(Font.event.robotoRegular16)
                Image("right")
            }
        }
        .padding(.horizontal, width * Size.shared.getAdaptSizeWidth(px: 16))
        .padding(.top, height * Size.shared.getAdaptSizeHeight(px: 24))
    }
}

struct WhoWillPlayCurrentGame_Previews: PreviewProvider {
    static var previews: some View {
        WhoWillPlayCurrentGame()
    }
}

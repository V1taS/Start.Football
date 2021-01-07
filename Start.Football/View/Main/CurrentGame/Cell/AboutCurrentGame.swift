//
//  AboutCurrentGame.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 07.01.2021.
//

import SwiftUI

struct AboutCurrentGame: View {
    let height = UIScreen.screenHeight
    let width = UIScreen.screenWidth
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: height * Size.shared.getAdaptSizeHeight(px: 16)) {
                Text("Что есть")
                    .foregroundColor(.secondaryColor)
                    .font(Font.event.robotoMedium18)
                HStack {
                    Image("sun")
                        .frame(width: width * Size.shared.getAdaptSizeWidth(px: 18),
                               height: height * Size.shared.getAdaptSizeHeight(px: 18))
                    Text("Открытое поле")
                        .foregroundColor(.secondaryColor)
                        .font(Font.event.robotoRegular16)
                }
                HStack {
                    Image("grass")
                        .frame(width: width * Size.shared.getAdaptSizeWidth(px: 18),
                               height: height * Size.shared.getAdaptSizeHeight(px: 18))
                    Text("Искуственный газон")
                        .foregroundColor(.secondaryColor)
                        .font(Font.event.robotoRegular16)
                }
                HStack {
                    Image("shirt")
                        .frame(width: width * Size.shared.getAdaptSizeWidth(px: 18),
                               height: height * Size.shared.getAdaptSizeHeight(px: 18))
                    Text("Раздевалки")
                        .foregroundColor(.secondaryColor)
                        .font(Font.event.robotoRegular16)
                }
                HStack {
                    Image("shower")
                        .frame(width: width * Size.shared.getAdaptSizeWidth(px: 18),
                               height: height * Size.shared.getAdaptSizeHeight(px: 18))
                    Text("Душевые")
                        .foregroundColor(.secondaryColor)
                        .font(Font.event.robotoRegular16)
                }
                HStack {
                    Image("parking")
                        .frame(width: width * Size.shared.getAdaptSizeWidth(px: 18),
                               height: height * Size.shared.getAdaptSizeHeight(px: 18))
                    Text("На территории, 150 ₽ в час")
                        .foregroundColor(.secondaryColor)
                        .font(Font.event.robotoRegular16)
                }
            }
            Spacer()
        }
        .padding(.horizontal, width * Size.shared.getAdaptSizeWidth(px: 16))
        .padding(.vertical, height * Size.shared.getAdaptSizeHeight(px: 24))
    }
}

struct AboutCurrentGame_Previews: PreviewProvider {
    static var previews: some View {
        AboutCurrentGame()
    }
}

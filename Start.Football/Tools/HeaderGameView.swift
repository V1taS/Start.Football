//
//  HeaderGameView.swift
//  Start.Football
//
//  Created by Виталий Сосин on 25.11.2020.
//

import SwiftUI

struct HeaderGameView: View {
    let height: CGFloat
    let width: CGFloat
    var body: some View {
        HStack {
            Button(action: {}) {
                HStack(spacing: 10) {
                    Image("test")
                        .resizable()
                        .renderingMode(.original)
                        .scaledToFill()
                        .frame(width: width * Size.shared.getAdaptSizeWidth(px: 48),
                               height: height * Size.shared.getAdaptSizeHeight(px: 48))
                    VStack(alignment: .leading,
                           spacing: height * Size.shared.getAdaptSizeHeight(px: 2)){
                        Text("Апполинарий")
                            .foregroundColor(Color(#colorLiteral(red: 0.262745098, green: 0.2901960784, blue: 0.3960784314, alpha: 1)))
                            .font(Font.event.robotoBold20)
                        Text("Санкт-Петербург")
                            .foregroundColor(Color(#colorLiteral(red: 0.262745098, green: 0.2901960784, blue: 0.3960784314, alpha: 1)))
                            .font(Font.event.robotoRegular13)
                    } .frame(width: width * Size.shared.getAdaptSizeWidth(px: 150),
                             height: height * Size.shared.getAdaptSizeHeight(px: 50),
                             alignment: .leading)
                }
            }
            Spacer()
            HStack(spacing: width * Size.shared.getAdaptSizeWidth(px: 24)) {
                Button(action: {}) {
                    Image("map")
                        .resizable()
                        .renderingMode(.original)
                        .scaledToFill()
                        .frame(width: 24, height: 25)
                }
                Button(action: {}) {
                    Image("filter")
                        .resizable()
                        .renderingMode(.original)
                        .scaledToFill()
                        .frame(width: 24, height: 22)
                }
            }
        }
        .padding(.top, height * Size.shared.getAdaptSizeHeight(px: 16))
        .padding(.horizontal, width * Size.shared.getAdaptSizeWidth(px: 16))
    }
}

struct HeaderGameView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderGameView(height: 734, width: 375)
    }
}

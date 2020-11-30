//
//  HeaderGameView.swift
//  Start.Football
//
//  Created by Виталий Сосин on 25.11.2020.
//

import SwiftUI

struct HeaderGameView: View {
    
    let height = UIScreen.screenHeight
    let width = UIScreen.screenWidth
    @Binding var selectionGame: SelectionGame
    
    var body: some View {
        HStack {
            Button(action: {}) {
                HStack(spacing: 13) {
                    Image("test")
                        .resizable()
                        .renderingMode(.original)
                        .scaledToFill()
                        .frame(width: width * Size.shared.getAdaptSizeWidth(px: 48),
                               height: height * Size.shared.getAdaptSizeHeight(px: 48))
                    
                    VStack(alignment: .leading,
                           spacing: height * Size.shared.getAdaptSizeHeight(px: 2)){
                        Text("Владислав")
                            .foregroundColor(Color(#colorLiteral(red: 0.262745098, green: 0.2901960784, blue: 0.3960784314, alpha: 1)))
                            .font(Font.event.robotoBold20)
                            .lineLimit(1)
                    } .frame(width: width * Size.shared.getAdaptSizeWidth(px: 180),
                             height: height * Size.shared.getAdaptSizeHeight(px: 50),
                             alignment: .leading)
                }
            }
            Spacer()
            HStack(spacing: width * Size.shared.getAdaptSizeWidth(px: 16)) {
                Button(action: { selectionGame = .map }) {
                    Image(selectionGame == .map ?
                            "map_active" :
                            "map_turnedOff")
                        .resizable()
                        .renderingMode(.original)
                        .scaledToFill()
                        .frame(width: 24, height: 24)
                }
                Button(action: {}) {
                    Image("filter")
                        .resizable()
                        .renderingMode(.original)
                        .scaledToFill()
                        .frame(width: 24, height: 24)
                }
            }
        }
        .padding(.horizontal, width * Size.shared.getAdaptSizeWidth(px: 16))
    }
}

struct HeaderGameView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderGameView(selectionGame: .constant(.map))
    }
}

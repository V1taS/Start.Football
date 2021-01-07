//
//  HeaderCurrentGame.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 07.01.2021.
//

import SwiftUI

struct HeaderCurrentGame: View {
    let height = UIScreen.screenHeight
    let width = UIScreen.screenWidth
    
    var body: some View {
        ZStack {
            Image("currentGamebg")
                .resizable()
                .frame(width: width * Size.shared.getAdaptSizeWidth(px: 375),
                       height: height * Size.shared.getAdaptSizeHeight(px: 230))
            
            HStack {
                Text("Тренировка в ФОК")
                    .foregroundColor(.whiteColor)
                    .font(Font.event.robotoBold20)
                    .lineLimit(3)
                    .frame(width: width * Size.shared.getAdaptSizeWidth(px: 200),
                           alignment: .leading)
                Spacer()
                ZStack {
                    Color(.primaryColor)
                        .clipShape(RoundedRectangle(cornerRadius: 5))
                        .frame(width: width * Size.shared.getAdaptSizeWidth(px: 87),
                               height: height * Size.shared.getAdaptSizeHeight(px: 52))
                    Text("500 ₽")
                        .foregroundColor(.whiteColor)
                        .font(Font.event.robotoRegular24)
                }
            }
            .padding(.horizontal, width * Size.shared.getAdaptSizeWidth(px: 16))
            .offset(x: width * Size.shared.getAdaptSizeWidth(px: 0),
                    y: height * Size.shared.getAdaptSizeHeight(px: 75))
        }
        .navigationBarTitle("Игра №4867", displayMode: .inline)
    }
}

struct HeaderCurrentGame_Previews: PreviewProvider {
    static var previews: some View {
        HeaderCurrentGame()
    }
}

//
//  HeaderCurrentGame.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 07.01.2021.
//

import SwiftUI

struct HeaderCurrentGame: View {
    
    private var appBinding: Binding<AppState.AppData>
    init(appBinding: Binding<AppState.AppData>) {
        self.appBinding = appBinding
    }
    
    let height = UIScreen.screenHeight
    let width = UIScreen.screenWidth
    
    var body: some View {
        ZStack {
            Image("currentGamebg")
                .resizable()
                .frame(width: width * Size.shared.getAdaptSizeWidth(px: 375),
                       height: height * Size.shared.getAdaptSizeHeight(px: 230))
            
            HStack {
                Text("\(appBinding.currentGame.nameGame.wrappedValue)")
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
                    Text("\(appBinding.currentGame.costGame.wrappedValue) ₽")
                        .foregroundColor(.whiteColor)
                        .font(Font.event.robotoRegular24)
                }
            }
            .padding(.horizontal, width * Size.shared.getAdaptSizeWidth(px: 16))
            .offset(x: width * Size.shared.getAdaptSizeWidth(px: 0),
                    y: height * Size.shared.getAdaptSizeHeight(px: 75))
        }
    }
}

struct HeaderCurrentGame_Previews: PreviewProvider {
    static var previews: some View {
        HeaderCurrentGame(appBinding: .constant(.init()))
    }
}

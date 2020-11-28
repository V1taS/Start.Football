//
//  MenuGameView.swift
//  Start.Football
//
//  Created by Виталий Сосин on 25.11.2020.
//

import SwiftUI

struct MenuGameView: View {
    
    @Binding var selectionGame: SelectionGame
    let height = UIScreen.screenHeight
    let width = UIScreen.screenWidth
    
    var body: some View {
        VStack {
            Divider()
                .offset(y: 39)
            HStack {
                VStack(spacing: 9) {
                    Button(action: {selectionGame = .allGame}) {
                        Text("Все игры")
                            .font(selectionGame == .allGame ?
                                    Font.event.robotoMedium16 :
                                    Font.event.robotoRegular16)
                            .foregroundColor(selectionGame == .allGame ?
                                                Color(#colorLiteral(red: 0.1294117647, green: 0.6117647059, blue: 0.4196078431, alpha: 1)) :
                                                Color(#colorLiteral(red: 0.262745098, green: 0.2901960784, blue: 0.3960784314, alpha: 1)))
                            .fontWeight(selectionGame == .allGame ?
                                            .bold :
                                            .regular)
                    }
                    Color(selectionGame == .allGame ? (#colorLiteral(red: 0.1294117647, green: 0.6117647059, blue: 0.4196078431, alpha: 1)) : #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0))
                        .frame(width: width * Size.shared.getAdaptSizeWidth(px: 80),
                               height: height * Size.shared.getAdaptSizeHeight(px: 2),
                               alignment: .center)
                }
                Spacer()
                VStack(spacing: 9) {
                    Button(action: {selectionGame = .myGames}) {
                        Text("Мои игры")
                            .font(selectionGame == .myGames ?
                                    Font.event.robotoMedium16 :
                                    Font.event.robotoRegular16)
                            .foregroundColor(selectionGame == .myGames ? Color(#colorLiteral(red: 0.1294117647, green: 0.6117647059, blue: 0.4196078431, alpha: 1)) : Color(#colorLiteral(red: 0.262745098, green: 0.2901960784, blue: 0.3960784314, alpha: 1)))
                            .fontWeight(selectionGame == .myGames ? .bold : .regular)
                    }
                    Color(selectionGame == .myGames ? (#colorLiteral(red: 0.1294117647, green: 0.6117647059, blue: 0.4196078431, alpha: 1)) : #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0))
                        .frame(width: width * Size.shared.getAdaptSizeWidth(px: 80),
                               height: height * Size.shared.getAdaptSizeHeight(px: 2),
                               alignment: .center)
                }
            }
            .padding(.horizontal, width * Size.shared.getAdaptSizeWidth(px: 64))
        }
    }
}

struct MenuGameView_Previews: PreviewProvider {
    static var previews: some View {
        MenuGameView(selectionGame: .constant(.allGame))
    }
}

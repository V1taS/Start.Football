//
//  MenuMainView.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 07.01.2021.
//

import SwiftUI

struct MenuMainView: View {
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
                                                .primaryColor :
                                                .secondaryColor)
                            .fontWeight(selectionGame == .allGame ?
                                            .bold :
                                            .regular)
                    }
                    Color(selectionGame == .allGame ? .primaryColor : #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0))
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
                            .foregroundColor(selectionGame == .myGames ? .primaryColor : .secondaryColor)
                            .fontWeight(selectionGame == .myGames ? .bold : .regular)
                    }
                    Color(selectionGame == .myGames ? .primaryColor : #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0))
                        .frame(width: width * Size.shared.getAdaptSizeWidth(px: 80),
                               height: height * Size.shared.getAdaptSizeHeight(px: 2),
                               alignment: .center)
                }
            }
            .padding(.horizontal, width * Size.shared.getAdaptSizeWidth(px: 64))
        }
    }
}

struct MenuMainView_Previews: PreviewProvider {
    static var previews: some View {
        MenuMainView(selectionGame: .constant(.allGame))
    }
}

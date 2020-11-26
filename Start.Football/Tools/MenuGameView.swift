//
//  MenuGameView.swift
//  Start.Football
//
//  Created by Виталий Сосин on 25.11.2020.
//

import SwiftUI

struct MenuGameView: View {
    
    @Binding var selectionGame: SelectionGame
    let height: CGFloat
    let width: CGFloat
    
    var body: some View {
        VStack {
            Divider().offset(y: height * 0.05)
            HStack {
                VStack {
                    Button(action: {selectionGame = .allGame}) {
                        Text("Все игры")
                            .font(selectionGame == .allGame ?
                                    Font.event.robotoMedium16 :
                                    Font.event.robotoRegular16)
                            .foregroundColor(selectionGame == .allGame ? Color(#colorLiteral(red: 0.1294117647, green: 0.6117647059, blue: 0.4196078431, alpha: 1)) : .black)
                            .fontWeight(selectionGame == .allGame ? .bold : .regular)
                    }
                    Color(selectionGame == .allGame ? (#colorLiteral(red: 0.1294117647, green: 0.6117647059, blue: 0.4196078431, alpha: 1)) : #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0))
                        .frame(width: width * 0.1932, height: height * 0.0025, alignment: .center)
                }
                Spacer()
                VStack {
                    Button(action: {selectionGame = .myGames}) {
                        Text("Мои игры")
                            .font(selectionGame == .myGames ?
                                    Font.event.robotoMedium16 :
                                    Font.event.robotoRegular16)
                            .foregroundColor(selectionGame == .myGames ? Color(#colorLiteral(red: 0.1294117647, green: 0.6117647059, blue: 0.4196078431, alpha: 1)) : .black)
                            .fontWeight(selectionGame == .myGames ? .bold : .regular)
                    }
                    Color(selectionGame == .myGames ? (#colorLiteral(red: 0.1294117647, green: 0.6117647059, blue: 0.4196078431, alpha: 1)) : #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0))
                        .frame(width: width * 0.1932, height: height * 0.0025, alignment: .center)
                }
            } .padding(.horizontal, width * 0.1546)
        }
    }
}

struct MenuGameView_Previews: PreviewProvider {
    static var previews: some View {
        MenuGameView(selectionGame: .constant(.allGame),
                     height: 2,
                     width: 2)
    }
}

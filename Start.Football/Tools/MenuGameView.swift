//
//  MenuGameView.swift
//  Start.Football
//
//  Created by Виталий Сосин on 25.11.2020.
//

import SwiftUI

struct MenuGameView: View {
    
    @Binding var selectionGame: SelectionGame
    
    var body: some View {
        VStack {
            Divider().offset(y: 40.7)
            HStack {
                VStack {
                    Button(action: {selectionGame = .allGame}) {
                        Text("Все игры")
                            .font(Font.custom("Roboto", size: 16))
                            .foregroundColor(selectionGame == .allGame ? Color(#colorLiteral(red: 0.1294117647, green: 0.6117647059, blue: 0.4196078431, alpha: 1)) : .black)
                            .fontWeight(selectionGame == .allGame ? .bold : .regular)
                    }
                    Color(selectionGame == .allGame ? (#colorLiteral(red: 0.1294117647, green: 0.6117647059, blue: 0.4196078431, alpha: 1)) : #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0))
                        .frame(width: 80, height: 2, alignment: .center)
                }
                Spacer()
                VStack {
                    Button(action: {selectionGame = .myGames}) {
                        Text("Мои игры")
                            .font(Font.custom("Roboto", size: 16))
                            .foregroundColor(selectionGame == .myGames ? Color(#colorLiteral(red: 0.1294117647, green: 0.6117647059, blue: 0.4196078431, alpha: 1)) : .black)
                            .fontWeight(selectionGame == .myGames ? .bold : .regular)
                    }
                    Color(selectionGame == .myGames ? (#colorLiteral(red: 0.1294117647, green: 0.6117647059, blue: 0.4196078431, alpha: 1)) : #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0))
                        .frame(width: 80, height: 2, alignment: .center)
                }
            } .padding(.horizontal, 64)
        }
    }
}

struct MenuGameView_Previews: PreviewProvider {
    static var previews: some View {
        MenuGameView(selectionGame: .constant(.allGame))
    }
}

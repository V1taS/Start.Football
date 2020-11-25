//
//  GameView.swift
//  Start.Football
//
//  Created by Виталий Сосин on 25.11.2020.
//

import SwiftUI

struct GameView: View {
    
    @ObservedObject var viewModel = GameViewModel()
    
    var body: some View {
        VStack {
            HeaderGameView()
            MenuGameView(selectionGame: $viewModel.selectionGame)
            Spacer()
            
            if viewModel.selectionGame == .allGame {
                VStack {
                    ScrollView(.vertical, showsIndicators: false) {
                        Text("Все Игры")
                    }
                }
            } else if viewModel.selectionGame == .myGames {
                VStack {
                    ScrollView(.vertical, showsIndicators: false) {
                        Text("Мои игры")
                    }
                }
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}

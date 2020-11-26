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
            GeometryReader { geometry in
                VStack {
                    HeaderGameView(height: geometry.size.height,
                                   width: geometry.size.width)
                    MenuGameView(selectionGame: $viewModel.selectionGame,
                                 height: geometry.size.height,
                                 width: geometry.size.width)
                    Spacer()
                    
                    if viewModel.selectionGame == .allGame {
                        VStack(spacing: 16) {
                            ScrollView(.vertical, showsIndicators: false) {
                                CellGameView()
                                CellGameView()
                                CellGameView()
                                CellGameView()
                                CellGameView()
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
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}

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
        ZStack {
            Color(#colorLiteral(red: 0.9647058824, green: 0.9647058824, blue: 0.9725490196, alpha: 1))
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                HeaderGameView()
                MenuGameView(selectionGame: $viewModel.selectionGame)
                
                if viewModel.selectionGame == .allGame {
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack(spacing: UIScreen.screenHeight * Size.shared.getAdaptSizeHeight(px: 16)) {
                            
                            Button(action: {}) { CellGameView() }
                            Button(action: {}) { CellGameView() }
                            Button(action: {}) { CellGameView() }
                            Button(action: {}) { CellGameView() }
                            Button(action: {}) { CellGameView() }
                        } .padding(.top, UIScreen.screenHeight * Size.shared.getAdaptSizeHeight(px: 24))
                    }
                } else if viewModel.selectionGame == .myGames {
                    VStack {
                        ScrollView(.vertical, showsIndicators: false) {
                            Text("Мои игры")
                                .foregroundColor(Color(#colorLiteral(red: 0.262745098, green: 0.2901960784, blue: 0.3960784314, alpha: 1)))
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

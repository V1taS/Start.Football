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
            
            VStack(spacing: 0) {
                HeaderGameView(selectionGame: $viewModel.selectionGame)
                MenuGameView(selectionGame: $viewModel.selectionGame)
                    .padding(.top, UIScreen.screenHeight * Size.shared.getAdaptSizeHeight(px: 8))
                
                if viewModel.selectionGame == .allGame {
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack(spacing: UIScreen.screenHeight * Size.shared.getAdaptSizeHeight(px: 16)) {
                            
                            Button(action: {}) { CellGameView() }
                            Button(action: {}) { CellGameView() }
                            Button(action: {}) { CellGameView() }
                            Button(action: {}) { ADV()}
                            Button(action: {}) { CellGameView() }
                            Button(action: {}) { CellGameView() }
                        } .padding(.vertical, UIScreen.screenHeight * Size.shared.getAdaptSizeHeight(px: 16))
                    }
                } else if viewModel.selectionGame == .myGames {
                    VStack {
                        ScrollView(.vertical, showsIndicators: false) {
                            Plug()
                        }
                    }
                } else if viewModel.selectionGame == .map {
                    VStack {
                        MapGameView()
                    } .padding(.vertical, UIScreen.screenHeight * Size.shared.getAdaptSizeHeight(px: 4))
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

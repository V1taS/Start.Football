//
//  GameView.swift
//  Start.Football
//
//  Created by Виталий Сосин on 25.11.2020.
//

import SwiftUI

struct MainView: View {
    
    @Environment(\.viewController) private var viewControllerHolder: UIViewController?
    private var viewController: UIViewController? {
        self.viewControllerHolder!
    }
    
    let height = UIScreen.screenHeight
    let width = UIScreen.screenWidth
    
    @State var viewState = CGSize.zero
    
    @ObservedObject var viewModel = MainViewModel()
    
    var body: some View {
        ZStack {
            Color(.paleWhite)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 0) {
                
                HeaderMainView(selectionGame: $viewModel.selectionGame,
                               showFiltrsView: $viewModel.showFiltrsView)
                    .padding(.top, height * Size.shared.getAdaptSizeHeight(px: 8))
                
                MenuMainView(selectionGame: $viewModel.selectionGame)
                    .padding(.top, height * Size.shared.getAdaptSizeHeight(px: 8))
                
                if viewModel.selectionGame == .allGame {
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack(spacing: height * Size.shared.getAdaptSizeHeight(px: 16)) {
                            
                            Button(action: {
                                    self.viewController?.present(style: .fullScreen) {
                                        CurrentGameView()
                                    } }) { CellMainView() }
                            
                            Button(action: {
                                    self.viewController?.present(style: .fullScreen) {
                                        CurrentGameView()
                                    } }) { CellMainView() }
                            
                            Button(action: {}) { ADV()}
                            
                            Button(action: {
                                    self.viewController?.present(style: .fullScreen) {
                                        CurrentGameView()
                                    } }) { CellMainView() }
                            
                        } .padding(.vertical, height * Size.shared.getAdaptSizeHeight(px: 16))
                    }
                }
                
                else if viewModel.selectionGame == .myGames {
                    VStack {
                        ScrollView(.vertical, showsIndicators: false) {
                            Plug(text: "Пока у тебя нет игр", createGame: true)
                        }
                    }
                }
            }
            
            FiltrsView()
                .offset(y: height * Size.shared.getAdaptSizeHeight(px: 50))
                .animation(.spring())
                .offset(y: viewModel.showFiltrsView ? viewState.height : 1000)
                .gesture(
                    DragGesture().onChanged { value in
                        self.viewState = value.translation
                        if value.translation.height < -40 {
                            self.viewState.height = .zero
                        }
                        
                        if value.translation.height > 100 {
                            self.viewModel.showFiltrsView.toggle()
                        }
                    }
                    .onEnded { value in
                        self.viewState.height = .zero
                    }
                )
        } .dismissingKeyboard()
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

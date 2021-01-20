//
//  MainView.swift
//  Start.Football
//
//  Created by Виталий Сосин on 25.11.2020.
//

import SwiftUI

struct MainView: View {
    
    private var appBinding: Binding<AppState.AppData>
    init(appBinding: Binding<AppState.AppData>) {
        self.appBinding = appBinding
    }
    
    
    @Environment(\.viewController) private var viewControllerHolder: UIViewController?
    private var viewController: UIViewController? {
        self.viewControllerHolder!
    }
    
    @Environment(\.injected) private var injected: DIContainer
    
    var body: some View {
        ZStack {
            Color(.paleWhite)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 0) {
                header
                menu
                allGame
                myGame
            }
        }
        .dismissingKeyboard()
    }
}

// MARK: Header
private extension MainView {
    private var header: AnyView {
        AnyView(
            HeaderMainView(selectionGame: appBinding.main.selectionGame,
                           showFiltrsView: appBinding.main.showFiltrsView)
                .padding(.top, 8)
        )
    }
}

// MARK: Main menu
private extension MainView {
    private var menu: AnyView {
        AnyView(
            MenuMainView(selectionGame: appBinding.main.selectionGame)
                .padding(.top, 8)
                .padding(.bottom, 3)
        )
    }
}

// MARK: All game
private extension MainView {
    private var allGame: AnyView {
        AnyView(
            VStack(spacing: 0) {
                if appBinding.main.selectionGame.wrappedValue == .allGame {
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack(spacing: 16) {
                            
                            if appBinding.main.loadMoreGames.wrappedValue {
                                Button(action: {
                                    appBinding.main.loadMoreGames.wrappedValue = false
                                }) {
                                    Text("Появились новые игры")
                                        .font(Font.event.robotoMedium16)
                                        .foregroundColor(.error)
                                        .fontWeight(.bold)
                                }
                            }
                            
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
                        }
                        .padding(16)
                    }
                }
            }
        )
    }
}

// MARK: My game
private extension MainView {
    private var myGame: AnyView {
        AnyView(
            VStack(spacing: 0) {
                if appBinding.main.selectionGame.wrappedValue == .myGames {
                    VStack {
                        ScrollView(.vertical, showsIndicators: false) {
                            Plug(text: "Пока у тебя нет игр", createGame: true)
                        }
                    }
                }
            }
        )
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(appBinding: .constant(.init()))
    }
}

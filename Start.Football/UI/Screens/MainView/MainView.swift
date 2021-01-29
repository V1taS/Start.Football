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

// MARK: UI
private extension MainView {
    private var header: AnyView {
        AnyView(
            HeaderMainView(appBinding: appBinding)
                .padding(.top, 8)
        )
    }
}

private extension MainView {
    private var menu: AnyView {
        AnyView(
            MenuMainView(appBinding: appBinding)
                .padding(.top, 8)
                .padding(.bottom, 3)
        )
    }
}

private extension MainView {
    private var allGame: AnyView {
        AnyView(
            VStack(spacing: 0) {
                if appBinding.main.selectionGame.wrappedValue == .allGame {
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack(spacing: 0) {
                            allGamesFull
                            allGamesIsEmty
                        }
                        .padding(.horizontal, 16)
                    }
                }
            }
        )
    }
}

private extension MainView {
    private var moreGames: AnyView {
        AnyView(
            VStack(spacing: 0) {
                if appBinding.main.loadMoreGames.wrappedValue {
                    Button(action: {
                        loadMoreGames()
                    }) {
                        Text("Появились новые игры")
                            .font(Font.event.robotoMedium16)
                            .foregroundColor(.error)
                            .fontWeight(.bold)
                    }
                }
            }
        )
    }
}

private extension MainView {
    private var allGamesFull: AnyView {
        AnyView(
            VStack {
                if !appBinding.main.listAllGames.wrappedValue.isEmpty {
                    moreGames
                    VStack(spacing: 16) {
                        ForEach(appBinding.main.listAllGames
                                    .wrappedValue.sorted(
                                        by: { $0.dataCreateGame > $1.dataCreateGame }),
                                id: \.self) { game in
                            
                            Button(action: {
                                currentGameShow(game: game)
                            }) {
                                CellMainView(game: game)
                            }
                                    
                                    Button(action: {}) { ADVone()}
                        }
                        Button(action: {}) { ADVtwo()}
                    }
                    .padding(.top, 16)
                    
                }
            }
        )
    }
}

private extension MainView {
    private var allGamesIsEmty: AnyView {
        AnyView(
            VStack {
                if appBinding.main.listAllGames.wrappedValue.isEmpty {
                    VStack(spacing: 32) {
                        Spacer()
                        Image("emptyMyGame")
                        
                        Text("Сейчас никто не играет")
                            .font(Font.event.robotoBold20)
                            .foregroundColor(.secondaryColor)
                        Spacer()
                    }
                }
            }
        )
    }
}

private extension MainView {
    private var myGame: AnyView {
        AnyView(
            VStack(spacing: 0) {
                if appBinding.main.selectionGame.wrappedValue == .myGames {
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack {
                            myGamesIsEmpty
                            myGameFull
                        }
                        .padding(.horizontal, 16)
                    }
                }
            }
        )
    }
}

private extension MainView {
    private var myGamesIsEmpty: AnyView {
        AnyView(
            VStack(spacing: 0) {
                if appBinding.main.listMyGames.wrappedValue.isEmpty {
                    VStack(spacing: 32) {
                        Spacer()
                        Image("emptyMyGame")
                        
                        Text("Сейчас никто не играет")
                            .font(Font.event.robotoBold20)
                            .foregroundColor(.secondaryColor)
                        Spacer()
                    }
                }
            }
        )
    }
}

private extension MainView {
    private var myGameFull: AnyView {
        AnyView(
            VStack(spacing: 0) {
                if !appBinding.main.listMyGames.wrappedValue.isEmpty {
                    VStack(spacing: 16) {
                        ForEach(appBinding.main.listMyGames.wrappedValue.sorted(
                                    by: { $0.dataCreateGame > $1.dataCreateGame }), id: \.self) { game in
                            Button(action: {
                                currentGameShow(game: game)
                                
                            }) {
                                CellMainView(game: game)
                            }
                                    }
                    }
                }
            }
        )
    }
}


// MARK: Actions
private extension MainView {
    private func loadMoreGames() {
        appBinding.main.loadMoreGames.wrappedValue = false
    }
    
    private func currentGameShow(game: Game) {
        self.viewController?.present(style: .pageSheet) {
            CurrentGameView(game: game)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(appBinding: .constant(.init()))
    }
}

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
                        VStack(spacing: 16) {
                            moreGames
                            allGames
                        }
                        .padding(16)
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
    private var allGames: AnyView {
        AnyView(
            VStack(spacing: 16) {
                ForEach(appBinding.main.listAllGames.wrappedValue.sorted(
                            by: { $0.dataCreateGame > $1.dataCreateGame }), id: \.self) { game in
                    Button(action: {
                        currentGameShow(game: game)
                    }) {
                        CellMainView(game: game)
                    }
                                
                                Button(action: {}) { ADVone()}
                }
                .animation(.default)
                Button(action: {}) { ADVtwo()}
            }
        )
    }
}

private extension MainView {
    private var myGame: AnyView {
        AnyView(
            VStack(spacing: 0) {
                if appBinding.main.selectionGame.wrappedValue == .myGames {
                    VStack {
                        ScrollView(.vertical, showsIndicators: false) {
                            myGamesIsEmpty
                            myGameFull
                        }
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
                    isEmtyMyGame(appBinding: appBinding,
                         text: "Пока у тебя нет игр",
                         createGame: true)
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
                        .animation(.default)
                    }
                    .padding(.top)
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

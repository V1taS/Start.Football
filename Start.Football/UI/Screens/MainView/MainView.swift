//
//  MainView.swift
//  Start.Football
//
//  Created by Виталий Сосин on 25.11.2020.
//

import SwiftUI

struct MainView: View {
    
    @State private var appState: AppState.AppData = .init()
    private var appBinding: Binding<AppState.AppData> {
        $appState.dispatched(to: injected.appState, \.appData)
    }
    @Environment(\.injected) private var injected: DIContainer
    @Environment(\.viewController) private var viewControllerHolder: UIViewController?
    private var viewController: UIViewController? {
        self.viewControllerHolder!
    }
    
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
            backgroundColor
            filterGame
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
                        .padding(.vertical, 16)
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

// MARK: Filter game
private extension MainView {
    private var filterGame: AnyView {
        AnyView(
            VStack {
                Spacer()
                FilterGameSheet(appBinding: appBinding)
            }
            .padding(.bottom, 70)
        )
    }
}

// MARK: - Background color
private extension MainView {
    var backgroundColor: some View {
        ZStack {
            if appBinding.main.showFiltrsView.wrappedValue {
                Color.secondary
                    .edgesIgnoringSafeArea(.all)
                    .animation(.linear(duration: 10))
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

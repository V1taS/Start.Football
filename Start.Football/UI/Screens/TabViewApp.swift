//
//  TabViewAppTwo.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 29.01.2021.
//

import SwiftUI

struct TabViewApp: View {
    
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
                
                ZStack {
                    VStack(spacing: 0) {
                        content
                        CustomTabViewApp(appBinding: appBinding)
                            .background(Color.paleWhite)
                    }
                    
                    backgroundColor
                    filterGame
                }
            
            if appState.main.showCreateGameView {
                VStack {
                    CreateGameView(appBinding: appBinding)
                }
                .edgesIgnoringSafeArea(.top)
                .background(Color.backgroundColor)
                .offset(x: 0, y: appBinding.main.showCreateGameView.wrappedValue ? 0 : UIScreen.screenHeight)
                .transition(.move(edge: .bottom))
                .animation(.easeOut)
            }
                
        }
        .edgesIgnoringSafeArea(.bottom)
        .dismissingKeyboard()
    }
}

// MARK: Sheet View
private extension TabViewApp {
    private var filterGame: AnyView {
        AnyView(
            VStack {
                Spacer()
                FilterGameSheet(appBinding: appBinding)
            }
            .transition(.move(edge: .bottom))
            .animation(.easeOut(duration: 0.7))
            .padding(.bottom, 0)
        )
    }
    
    private var backgroundColor: some View {
        ZStack {
            if appBinding.main.filter.showFiltrsView.wrappedValue {
                Color.secondary
                    .edgesIgnoringSafeArea(.all)
            }
        }
        .onTapGesture {
            appBinding.main.filter.showFiltrsView.wrappedValue = false
        }
        .transition(.move(edge: .bottom))
        .animation(.easeOut(duration: 0.7))
    }
}

private extension TabViewApp {
    private var content: AnyView {
        switch appBinding.main.tabBarMenu.wrappedValue {
        case .search:
            return AnyView(MainView(appBinding: appBinding))
        case .notifications:
            return AnyView(NotificationsView())
        }
    }
}

struct TabViewAppTwo_Previews: PreviewProvider {
    static var previews: some View {
        TabViewApp()
    }
}

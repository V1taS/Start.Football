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
    
    var body: some View {
        ZStack {
            if !appBinding.main.showCreateGameView.wrappedValue {
                
                ZStack {
                    VStack(spacing: 0) {
                        content
                        CustomTabViewApp(appBinding: appBinding)
                    }
                    backgroundColor
                    filterGame
                }
            }
            
            if appBinding.main.showCreateGameView.wrappedValue {
                VStack {
                    CreateGameView(appBinding: appBinding)
                }
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
            return AnyView(MainView(appBinding: appBinding))
        }
    }
}

struct TabViewAppTwo_Previews: PreviewProvider {
    static var previews: some View {
        TabViewApp()
    }
}

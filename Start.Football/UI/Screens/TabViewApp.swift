//
//  TabViewApp.swift
//  Start.Football
//
//  Created by Виталий Сосин on 25.11.2020.
//

import SwiftUI

struct TabViewApp: View {
    
    @State private var appState: AppState.AppData = .init()
    private var appBinding: Binding<AppState.AppData> {
        $appState.dispatched(to: injected.appState, \.appData)
    }
    @Environment(\.injected) private var injected: DIContainer
    @State private var selection = 0
    
    var body: some View {
        ZStack {
            TabView(selection: $selection) {
                MainView(appBinding: appBinding)
                    .tabItem {
                        searchView
                        Text("Поиск")
                            .foregroundColor(.defaultColor)
                            .font(Font.event.robotoMedium10)
                    }
                
                CreateGameView()
                    .tabItem {
                        createView
                        Text("Создать")
                            .foregroundColor(.defaultColor)
                            .font(Font.event.robotoMedium10)
                    }
                
                Plug(text: "Меню (В разработке...)", createGame: false)
                    .tabItem {
                        menuView
                        Text("Меню")
                            .foregroundColor(.defaultColor)
                            .font(Font.event.robotoMedium10)
                    }
            }
            .accentColor(Color.secondaryColor)
            backgroundColor
            filterGame 
        }
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
            .padding(.bottom, -150)
        )
    }
    
    private var backgroundColor: some View {
        ZStack {
            if appBinding.main.showFiltrsView.wrappedValue {
                Color.secondary
                    .edgesIgnoringSafeArea(.all)
                    .animation(.linear(duration: 10))
            }
        }
        .onTapGesture {
            appBinding.main.showFiltrsView.wrappedValue = false
        }
    }
}


// MARK: UI
private extension TabViewApp {
    private var searchView: AnyView {
        AnyView(
            VStack {
                if selection == 0 {
                    Image("tab_search")
                        .renderingMode(.template)
                        .foregroundColor(.secondaryColor)
                } else {
                    Image("tab_search")
                        .renderingMode(.template)
                        .foregroundColor(.defaultColor)
                }
            }
        )
    }
}

private extension TabViewApp {
    private var createView: AnyView {
        AnyView(
            VStack {
                if selection == 1 {
                    Image("tab_create")
                        .renderingMode(.template)
                        .foregroundColor(.secondaryColor)
                } else {
                    Image("tab_create")
                        .renderingMode(.template)
                        .foregroundColor(.defaultColor)
                }
            }
        )
    }
}

private extension TabViewApp {
    private var menuView: AnyView {
        AnyView(
            VStack {
                if selection == 2 {
                    Image("tab_menu")
                        .renderingMode(.template)
                        .foregroundColor(.secondaryColor)
                } else {
                    Image("tab_menu")
                        .renderingMode(.template)
                        .foregroundColor(.defaultColor)
                }
            }
        )
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        TabViewApp()
    }
}

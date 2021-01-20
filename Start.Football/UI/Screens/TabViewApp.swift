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
                        if selection == 0 {
                            Image("tab_search")
                                .renderingMode(.template)
                                .foregroundColor(.secondaryColor)
                        } else {
                            Image("tab_search")
                                .renderingMode(.template)
                                .foregroundColor(.defaultColor)
                        }
                        Image("tab_search")
                        Text("Поиск")
                            .foregroundColor(.defaultColor)
                            .font(Font.event.robotoMedium10)
                    }
                
                CreateGameView()
                    .tabItem {
                        if selection == 1 {
                            Image("tab_create")
                                .renderingMode(.template)
                                .foregroundColor(.secondaryColor)
                        } else {
                            Image("tab_create")
                                .renderingMode(.template)
                                .foregroundColor(.defaultColor)
                        }
                        Text("Создать")
                            .foregroundColor(.defaultColor)
                            .font(Font.event.robotoMedium10)
                    }
                
                Plug(text: "Меню (В разработке...)", createGame: false)
                    .tabItem {
                        if selection == 2 {
                            Image("tab_menu")
                                .renderingMode(.template)
                                .foregroundColor(.secondaryColor)
                        } else {
                            Image("tab_menu")
                                .renderingMode(.template)
                                .foregroundColor(.defaultColor)
                        }
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

// MARK: Filter game
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
}

// MARK: - Background color
private extension TabViewApp {
    var backgroundColor: some View {
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


struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        TabViewApp()
    }
}

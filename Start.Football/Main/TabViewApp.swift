//
//  TabViewApp.swift
//  Start.Football
//
//  Created by Виталий Сосин on 25.11.2020.
//

import SwiftUI

struct TabViewApp: View {
    
    @State private var selection = 0
    
    var body: some View {
        TabView(selection: $selection) {
            MainView()
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
            
            Plug(text: "Создать игру (В разработке...)", createGame: false)
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
    }
}


struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        TabViewApp()
    }
}

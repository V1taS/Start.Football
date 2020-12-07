//
//  TabViewApp.swift
//  Start.Football
//
//  Created by Виталий Сосин on 25.11.2020.
//

import SwiftUI

struct TabViewApp: View {
    
    var body: some View {
        TabView {
            MainView()
                .tabItem {
                    Image("tab_search")
                    Text("Поиск")
                        .foregroundColor(.defaultColor)
                        .font(Font.event.robotoMedium10)
                }
            
            Plug()
                .tabItem {
                    Image("tab_create")
                    Text("Создать")
                        .foregroundColor(.defaultColor)
                        .font(Font.event.robotoMedium10)
                }
            
            Plug()
                .tabItem {
                    Image("tab_menu")
                    Text("Меню")
                        .foregroundColor(.defaultColor)
                        .font(Font.event.robotoMedium10)
                }
        }
    }
}


struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        TabViewApp()
    }
}

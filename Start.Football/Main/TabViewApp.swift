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
                        .foregroundColor(Color(#colorLiteral(red: 0.5529411765, green: 0.568627451, blue: 0.6666666667, alpha: 1)))
                        .font(Font.event.robotoMedium10)
                }
            
            Plug()
                .tabItem {
                    Image("tab_create")
                    Text("Создать")
                        .foregroundColor(Color(#colorLiteral(red: 0.5529411765, green: 0.568627451, blue: 0.6666666667, alpha: 1)))
                        .font(Font.event.robotoMedium10)
                }
            
            Plug()
                .tabItem {
                    Image("tab_menu")
                    Text("Меню")
                        .foregroundColor(Color(#colorLiteral(red: 0.5529411765, green: 0.568627451, blue: 0.6666666667, alpha: 1)))
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

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
            GameView()
                .tabItem {
                    Image(systemName: "rectangle.3.offgrid.bubble.left")
                    Text("Игры")
                }
            
            GameView()
                .tabItem {
                    Image(systemName: "rectangle.3.offgrid.bubble.left")
                    Text("Уведомления")
                }
            
            GameView()
                .tabItem {
                    Image(systemName: "rectangle.3.offgrid.bubble.left")
                    Text("Создать")
                }
            
            GameView()
                .tabItem {
                    Image(systemName: "rectangle.3.offgrid.bubble.left")
                    Text("Чат")
                }
            
            GameView()
                .tabItem {
                    Image(systemName: "rectangle.3.offgrid.bubble.left")
                    Text("Профиль")
                }
        }
    }
}


struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        TabViewApp()
    }
}

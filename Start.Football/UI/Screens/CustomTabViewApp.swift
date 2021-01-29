//
//  CustomTabViewApp.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 29.01.2021.
//

import SwiftUI

struct CustomTabViewApp: View {
    
    private var appBinding: Binding<AppState.AppData>
    init(appBinding: Binding<AppState.AppData>) {
        self.appBinding = appBinding
    }
    @Environment(\.viewController) private var viewControllerHolder: UIViewController?
    private var viewController: UIViewController? {
        self.viewControllerHolder!
    }
    
    var body: some View {
        ZStack {
            Color(.clear)
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .overlay(RoundedRectangle(cornerRadius: 16)
                            .stroke(Color.secondaryColor, lineWidth: 0.2))
                .frame(height: 90)
                .shadow(color: Color(UIColor(red: 0.271, green: 0.357, blue: 0.388, alpha: 0.16)), radius: 16, x: 0, y: 0)
            
            HStack(alignment: .center, spacing: 89) {
                
                Button(action: {
                    appBinding.main.tabBarMenu.wrappedValue = .search
                }) {
                    VStack {
                        searchView
                        Text("Поиск")
                            .foregroundColor(.defaultColor)
                            .font(Font.event.robotoMedium10)
                    }
                }
                
                Button(action: {
                        appBinding.main.showCreateGameView.wrappedValue.toggle()
                    
                }) {
                    VStack {
                        createView
                        Text("Создать")
                            .foregroundColor(.defaultColor)
                            .font(Font.event.robotoMedium10)
                        
                        
                    }
                }
                
                Button(action: {
                    appBinding.main.tabBarMenu.wrappedValue = .notifications
                }) {
                    VStack {
                        menuView
                        Text("Меню")
                            .foregroundColor(.defaultColor)
                            .font(Font.event.robotoMedium10)
                    }
                }
                
            }
            .padding(.bottom, 34)
        }
        
    }
}

// MARK: UI
private extension CustomTabViewApp {
    private var searchView: AnyView {
        AnyView(
            VStack {
                if appBinding.main.tabBarMenu.wrappedValue == .search {
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

private extension CustomTabViewApp {
    private var createView: AnyView {
        AnyView(
            VStack {
                if appBinding.main.showCreateGameView.wrappedValue == true {
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

private extension CustomTabViewApp {
    private var menuView: AnyView {
        AnyView(
            VStack {
                if appBinding.main.tabBarMenu.wrappedValue == .notifications {
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

struct CustomTabViewApp_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabViewApp(appBinding: .constant(.init()))
    }
}

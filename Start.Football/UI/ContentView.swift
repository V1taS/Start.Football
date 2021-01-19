//
//  ContentView.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 13.01.2021.
//

import SwiftUI

struct ContentView: View {
    private let container: DIContainer
    init(container: DIContainer) {
        self.container = container
    }
    
    @State private var appState: AppState.AppData = .init()
    private var appBinding: Binding<AppState.AppData> {
        $appState.dispatched(to: injected.appState, \.appData)
    }
    @Environment(\.injected) private var injected: DIContainer
    
    var body: some View {
        if UserDefaults.standard.bool(forKey: "tabViewApp") {
            AuthView(appBinding: appBinding)
        } else {
            PageView(appBinding: appBinding)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(container: DIContainer(appState: .init(), interactors: .stub))
    }
}

//
//  ContentView.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 13.01.2021.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        if UserDefaults.standard.bool(forKey: "pageView") {
            AuthView()
        } else {
            PageView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

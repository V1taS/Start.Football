//
//  DissMissButtonCreateGameView.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 29.01.2021.
//

import SwiftUI

struct DissMissButtonCreateGameView: View {
    
    private var showSheet: Binding<Bool>
    init(showSheet: Binding<Bool>) {
        self.showSheet = showSheet
    }
    
    var body: some View {
        Button(action: {
                showSheet.wrappedValue = false
        }) {
            ZStack {
                Image(systemName: "xmark.circle.fill")
                    .imageScale(.large)
                    .foregroundColor(Color(.secondaryLabel))
            }
            
        }
    }
}

struct DissMissButtonCreateGameView_Previews: PreviewProvider {
    static var previews: some View {
        DissMissButtonCreateGameView(showSheet: .constant(true))
    }
}

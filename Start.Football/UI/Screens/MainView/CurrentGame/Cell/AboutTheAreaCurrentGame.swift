//
//  AboutTheAreaCurrentGame.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 07.01.2021.
//

import SwiftUI

struct AboutTheAreaCurrentGame: View {
    
    private var appBinding: Binding<AppState.AppData>
    init(appBinding: Binding<AppState.AppData>) {
        self.appBinding = appBinding
    }
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 16) {
                Text("О ПЛОЩАДКЕ")
                    .foregroundColor(.secondaryColor)
                    .font(Font.event.robotoMedium18)
                Text("\(appBinding.currentGame.descriptionPlaying.wrappedValue)")
                    .foregroundColor(.secondaryColor)
                    .font(Font.event.robotoRegular16)
                    .frame(width: UIScreen.screenWidth * Size.shared.getAdaptSizeWidth(px: 330))
            }
            Spacer()
        }
        .padding(.vertical, 24)
    }
}

struct AboutTheAreaCurrentGame_Previews: PreviewProvider {
    static var previews: some View {
        AboutTheAreaCurrentGame(appBinding: .constant(.init()))
    }
}

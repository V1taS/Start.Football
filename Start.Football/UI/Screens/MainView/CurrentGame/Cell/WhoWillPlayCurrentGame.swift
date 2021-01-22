//
//  WhoWillPlayCurrentGame.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 07.01.2021.
//

import SwiftUI

struct WhoWillPlayCurrentGame: View {
    
    @Environment(\.injected) private var injected: DIContainer
    private var appBinding: Binding<AppState.AppData>
    init(appBinding: Binding<AppState.AppData>) {
        self.appBinding = appBinding
    }
    let height = UIScreen.screenHeight
    let width = UIScreen.screenWidth
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("КТО БУДЕТ")
                .foregroundColor(.secondaryColor)
                .font(Font.event.robotoMedium18)
            
            HStack {
                photos
                Spacer()
                showAllPlayers
            }
        }
        .padding(.top, height * Size.shared.getAdaptSizeHeight(px: 24))
    }
}

// MARK: UI
private extension WhoWillPlayCurrentGame {
    private var photos: AnyView {
        AnyView(
            HStack(alignment: .center, spacing: -15) {
                ForEach(appBinding.currentGame.plugPhotoPlayers.wrappedValue, id: \.self) { photo in
                    Image(photo)
                        .resizable()
                        .frame(width: 32, height: 32)
                }
            }
        )
    }
}

private extension WhoWillPlayCurrentGame {
    private var showAllPlayers: AnyView {
        AnyView(
            HStack {
                Button(action: {}) {
                    Text("Посмотреть всех")
                        .foregroundColor(.primaryColor)
                        .font(Font.event.robotoRegular16)
                    Image("right")
                }
            }
        )
    }
}

struct WhoWillPlayCurrentGame_Previews: PreviewProvider {
    static var previews: some View {
        WhoWillPlayCurrentGame(appBinding: .constant(.init()))
    }
}

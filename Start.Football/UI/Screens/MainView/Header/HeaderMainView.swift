//
//  HeaderMainView.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 07.01.2021.
//

import SwiftUI

struct HeaderMainView: View {
    
    private var appBinding: Binding<AppState.AppData>
    init(appBinding: Binding<AppState.AppData>) {
        self.appBinding = appBinding
    }
    @Environment(\.viewController) private var viewControllerHolder: UIViewController?
    private var viewController: UIViewController? {
        self.viewControllerHolder!
    }
    
    let height = UIScreen.screenHeight
    let width = UIScreen.screenWidth
    
    var body: some View {
        HStack {
            player
            Spacer()
            HStack(spacing: 16) {
                map
                filter
            }
        }
        .padding(.horizontal, width * Size.shared.getAdaptSizeWidth(px: 16))
    }
}


// MARK: UI
private extension HeaderMainView {
    private var player: AnyView {
        AnyView(
            Button(action: {
                presentPlayer()
            }) {
                HStack(spacing: 13) {
                    Image("test")
                        .resizable()
                        .renderingMode(.original)
                        .scaledToFill()
                        .frame(width: width * Size.shared.getAdaptSizeWidth(px: 48),
                               height: height * Size.shared.getAdaptSizeHeight(px: 48))
                    
                    VStack(alignment: .leading,
                           spacing: height * Size.shared.getAdaptSizeHeight(px: 2)){
                        Text("Владислав")
                            .foregroundColor(.secondaryColor)
                            .font(Font.event.robotoBold20)
                            .lineLimit(1)
                    }
                    .frame(width: width * Size.shared.getAdaptSizeWidth(px: 180),
                           height: height * Size.shared.getAdaptSizeHeight(px: 50),
                           alignment: .leading)
                }
            }
        )
    }
}

private extension HeaderMainView {
    private var map: AnyView {
        AnyView(
            Button(action: {
                presentMap()
            }) {
                Image("map_turnedOff")
                    .resizable()
                    .renderingMode(.original)
                    .scaledToFill()
                    .frame(width: 24, height: 24)
            }
        )
    }
}

private extension HeaderMainView {
    private var filter: AnyView {
        AnyView(
            Button(action: {
                presentFiltrsSheet()
            }) {
                Image("filter")
                    .resizable()
                    .renderingMode(.original)
                    .scaledToFill()
                    .frame(width: 24, height: 24)
            }
        )
    }
}


// MARK: Actions
private extension HeaderMainView {
    private func presentPlayer() {
        self.viewController?.present(style: .fullScreen) {
            ProfileView(player: appBinding.main.currentPlayer.wrappedValue)
        }
    }
    
    private func presentMap() {
        self.viewController?.present(style: .pageSheet) {
            MapGameView(appBinding: appBinding) }
    }
    
    private func presentFiltrsSheet() {
        self.appBinding.main.filter.showFiltrsView.wrappedValue.toggle()
    }
}

struct HeaderMainView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderMainView(appBinding: .constant(.init()))
    }
}

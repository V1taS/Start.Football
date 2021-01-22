//
//  HeaderMainView.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 07.01.2021.
//

import SwiftUI

struct HeaderMainView: View {
    @Environment(\.viewController) private var viewControllerHolder: UIViewController?
    private var viewController: UIViewController? {
        self.viewControllerHolder!
    }
    
    let height = UIScreen.screenHeight
    let width = UIScreen.screenWidth
    @Binding var selectionGame: AppActions.MainApp.SelectionGame
    @Binding var showFiltrsView: Bool
    
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
            Button(action: { }) {
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
        self.viewController?.present(style: .pageSheet) {
            ProfileView() }
    }
    
    private func presentFiltrsSheet() {
        self.showFiltrsView.toggle()
    }
}

struct HeaderMainView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderMainView(selectionGame: .constant(.allGame),
                       showFiltrsView: .constant(false))
    }
}

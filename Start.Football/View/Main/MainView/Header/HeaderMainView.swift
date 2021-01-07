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
    @Binding var selectionGame: SelectionGame
    @Binding var showFiltrsView: Bool
    
    var body: some View {
        HStack {
            Button(action: {
                self.viewController?.present(style: .fullScreen) {
                    ProfileView() }
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
                    } .frame(width: width * Size.shared.getAdaptSizeWidth(px: 180),
                             height: height * Size.shared.getAdaptSizeHeight(px: 50),
                             alignment: .leading)
                }
            }
            Spacer()
            HStack(spacing: width * Size.shared.getAdaptSizeWidth(px: 16)) {
                Button(action: { }) {
                    Image("map_turnedOff")
                        .resizable()
                        .renderingMode(.original)
                        .scaledToFill()
                        .frame(width: 24, height: 24)
                }
                Button(action: {
                    self.showFiltrsView.toggle()
                }) {
                    Image("filter")
                        .resizable()
                        .renderingMode(.original)
                        .scaledToFill()
                        .frame(width: 24, height: 24)
                }
            }
        }
        .padding(.horizontal, width * Size.shared.getAdaptSizeWidth(px: 16))
    }
}

struct HeaderMainView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderMainView(selectionGame: .constant(.allGame),
                       showFiltrsView: .constant(false))
    }
}

//
//  ProgressBarView.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 28.12.2020.
//

import SwiftUI

struct ProgressBarView: View {

    @Binding var value: Float
    
    var body: some View {
        ZStack(alignment: .leading) {
            Rectangle()
                .frame(width: UIScreen.screenWidth * Size.shared.getAdaptSizeWidth(px: 160),
                       height: UIScreen.screenHeight * Size.shared.getAdaptSizeHeight(px: 5))
                .opacity(0.3)
                .foregroundColor(Color(.processCreateGameColor))
            
            Rectangle()
                .frame(width: min(CGFloat(self.value) * UIScreen.screenWidth * Size.shared.getAdaptSizeWidth(px: 160), UIScreen.screenWidth * Size.shared.getAdaptSizeWidth(px: 160)),
                       height: UIScreen.screenHeight * Size.shared.getAdaptSizeHeight(px: 5))
                .foregroundColor(Color(.primaryColor))
                .animation(.linear)
        }
        .cornerRadius(5)
        .padding(.top, UIScreen.screenHeight * Size.shared.getAdaptSizeHeight(px: 16))
    }
}
